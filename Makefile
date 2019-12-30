.DEFAULT_GOAL := help
.PHONY: home install init update backup

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
	| sort \
	| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

init: partitions initroot

home: make-links

install: ttf-cica installbase pipinstall goinstall aur mozc neomutt docker mariadb neovim redis rustinstall nodeinstall

update: updatebase melpaupdate pipupdate rustupdate goinstall

backup: backupbase pipbackup

partitions: check-root check-archlinux umount-partitions
	@ while true; do
		@ read -r -p "Do you want to create a new partition ? [y/N] " REPLY;
		[[ $$REPLY == '' || $$REPLY =~ ^[Nn]$$ ]] && exit 0
		if [[ $$REPLY =~ ^[Yy]$$ ]]; then
			@ echo -e
			@ echo -e "WARNING! This will wipe your device irrevocably!"
			@ read -r -p "Are you sure? (Type uppercase yes) " REPLY;
			if [[ $$REPLY == "YES" ]]; then
				@ DEVICES_LIST=(`lsblk -d | awk '{print "/dev/" $$1}' | grep 'sd\|hd\|vd\|nvme\|mmcblk'`);
				@ echo -e '\nSelect device to setup /root and /home luks partitions:'
				select DEVICE in $${DEVICES_LIST[@]}; do
					break
				done
				@ parted -s $${DEVICE} mklabel gpt
				@ parted -s $${DEVICE} mkpart primary 1MiB 100MiB # EFI (100MB)
				@ parted -s $${DEVICE} mkpart primary 100MiB 350MiB # Boot (250MB)
				@ parted -s $${DEVICE} mkpart primary 350MiB 100% # Crypted (100%)
				@ mkfs.vfat -F32 $${DEVICE}1
				@ mkfs.ext2 -F $${DEVICE}2
				@ read -s -r -p "Enter new luks passphrase: " PASSPHRASE; echo
				@ echo -n $${PASSPHRASE} | cryptsetup -q luksFormat -c aes-xts-plain64 -s 512 $${DEVICE}3 -d -
				@ echo -n $${PASSPHRASE} | cryptsetup -q luksOpen $${DEVICE}3 lvm -d -
				@ pvcreate -yff /dev/mapper/lvm
				@ vgcreate arch /dev/mapper/lvm
				@ read -r -p "Enter swap size: " -e -i "3G" SWAP_SIZE;
				@ lvcreate -L $${SWAP_SIZE}G arch -n swap
				@ read -r -p "Enter root size: " -e -i "100G" ROOT_SIZE;
				@ lvcreate -L $${ROOT_SIZE} arch -n root
				@ lvcreate -l +100%FREE arch -n home
				@ mkfs.ext4 /dev/mapper/arch-root
				@ mkfs.ext4 /dev/mapper/arch-home
				@ mkswap /dev/mapper/arch-swap
			fi
			exit 0
		fi
	@ done

make-links: ## Deploy home dotfiles
	ln -vsf ${PWD}/.bashrc ${HOME}/.bashrc
	ln -vsf ${PWD}/.bash_profile ${HOME}/.bash_profile
	ln -vsf ${PWD}/.zshrc ${HOME}/.zshrc
	[ -d "${HOME}/.config" ] || mkdir -p "${HOME}/.config"
	ln -vsf ${PWD}/.config/i3 ${HOME}/.config/
	ln -vsf ${PWD}/.Xresources ${HOME}/.Xresources
	ln -vsf ${PWD}/.xinitrc ${HOME}/.xinitrc
	ln -vsf ${PWD}/.profile ${HOME}/.profile
	ln -vsf ${PWD}/.config/polybar ${HOME}/.config

initroot: ## Initial deploy need root authority
	sudo ln -vsf ${PWD}/etc/pacman.conf /etc/pacman.conf
	sudo ln -vsf ${PWD}/etc/dnsmasq/resolv.dnsmasq.conf   /etc/resolv.dnsmasq.conf
	sudo ln -vsf ${PWD}/etc/dnsmasq/dnsmasq.conf   /etc/dnsmasq.conf
	sudo ln -vsf ${PWD}/etc/sysctl.d/40-max-user-watches.conf   /etc/sysctl.d/40-max-user-watches.conf
	sudo ln -vsf ${PWD}/etc/systemd/logind.conf   /etc/systemd/logind.conf
	sudo ln -vsf ${PWD}/etc/systemd/system/powertop.service   /etc/systemd/system/powertop.service
	sudo mkdir -p /etc/NetworkManager
	sudo ln -vsf ${PWD}/etc/NetworkManager/NetworkManager.conf /etc/NetworkManager/NetworkManager.conf

installbase: ## Install arch linux packages using pacman
	sudo pacman -S zsh git vim tmux evince zathura unrar seahorse mpv \
	zsh-completions xsel gvfs-smb unace iperf valgrind noto-fonts-emoji \
	inkscape file-roller xclip atool debootstrap oath-toolkit imagemagick lynx \
	the_silver_searcher powertop cifs-utils elinks flameshot ruby-rdoc ipcalc \
	cups-pdf openssh firefox firefox-i18n-ja gimp strace lhasa hub bookworm tig \
	pkgfile baobab dconf-editor rsync nodejs debian-archive-keyring gauche cpio \
	nmap poppler-data ffmpeg asciidoc sbcl docker aspell aspell-en screen mosh \
	gdb wmctrl pwgen linux-docs htop tcpdump gvfs p7zip lzop fzf gpaste optipng \
	arch-install-scripts pandoc jq sylpheed pkgstats python-pip ruby highlight  \
	texlive-langjapanese yarn texlive-latexextra ctags hdparm eog noto-fonts-cjk \
	arc-gtk-theme npm typescript chromium llvm llvm-libs lldb php tree w3m neomutt \
	zsh-syntax-highlighting shellcheck bash-completion mathjax expect elixir lsof \
	dnsmasq cscope postgresql-libs pdfgrep gnu-netcat cmatrix jpegoptim nethogs \
	curl parallel alsa-utils mlocate traceroute jhead whois geckodriver
	sudo pkgfile --update

aur: ## Install arch linux AUR packages using yaourt
	yaourt -S drone-cli
	yaourt -S git-secrets
	yaourt -S nkf
	yaourt -S peek
	yaourt -S screenkey

pipbackup: ## Backup python packages
	mkdir -p ${PWD}/archlinux
	pip freeze > ${PWD}/archlinux/requirements.txt

piprecover: ## Recover python packages
	mkdir -p ${PWD}/archlinux
	pip install --user -r ${PWD}/archlinux/requirements.txt

pipupdate: ## Update python packages
	pip-review --user | cut -d = -f 1 | xargs pip install -U --user

nodeinstall: ## Install node packages
	mkdir -p ${HOME}/.node_modules
	yarn global add npm
	yarn global add tern
	yarn global add jshint
	yarn global add eslint
	yarn global add babel-eslint
	yarn global add eslint-plugin-react
	yarn global add vue-language-server
	yarn global add vue-cli
	yarn global add create-react-app
	yarn global add create-component-app
	yarn global add prettier
	yarn global add firebase-tools
	yarn global add heroku-cli
	yarn global add webpack
	yarn global add gulp
	yarn global add tldr

nodenv: ## Install nodenv node-build
	yaourt -S nodenv
	git clone https://github.com/nodenv/node-build.git ${HOME}/.nodenv/plugins/node-build

rustinstall: ## Install rust and rust packages
	sudo pacman -S cmake
	mkdir -p ${HOME}/.cargo
	curl -sSf https://sh.rustup.rs | sh
	cargo install racer
	cargo install cargo-update
	cargo install cargo-script
	cargo install cargo-edit
	cargo install ripgrep
	cargo install exa
	cargo install fd-find
	cargo install xsv
	cargo install hyperfine
	rustup component add rust-src

rustupdate: ## Update rust packages
	cargo install-update -a

neomutt: ## Init neomutt mail client
	mkdir -p ${HOME}/.mutt
	ln -vsf ${PWD}/.muttrc   ${HOME}/.muttrc
	ln -vsf ${PWD}/.mutt/mailcap   ${HOME}/.mutt/mailcap
	ln -vsf ${PWD}/.mutt/certificates   ${HOME}/.mutt/certificates
	ln -vsf ${HOME}/Dropbox/mutt/aliases   ${HOME}/.mutt/aliases
	ln -vsf ${HOME}/Dropbox/mutt/signature   ${HOME}/.mutt/signature
	ln -vsf ${HOME}/Dropbox/mutt/.goobookrc   ${HOME}/.goobookrc
	yaourt -S goobook-git
	goobook authenticate

urxvt: ## Init urxvt terminal
	sudo pacman -S urxvt-perls
	ln -vsf ${PWD}/.Xresources   ${HOME}/.Xresources

mlterm: ## Init mlterm terminal
	yaourt -S mlterm
	mkdir -p ${HOME}/.mlterm
	ln -vsf ${PWD}/.mlterm/main   ${HOME}/.mlterm/main
	ln -vsf ${PWD}/.mlterm/color   ${HOME}/.mlterm/color
	ln -vsf ${PWD}/.mlterm/aafont   ${HOME}/.mlterm/aafont
	ln -vsf ${PWD}/.mlterm/key   ${HOME}/.mlterm/key

termite: ## Init termite terminal
	sudo pacman -S termite
	mkdir -p ${HOME}/.config/termite
	ln -vsf ${PWD}/.config/termite/config   ${HOME}/.config/termite/config

aws: ## Init aws cli
	test -L ${HOME}/.aws || rm -rf ${HOME}/.aws
	ln -vsfn ${HOME}/Dropbox/zsh/.aws   ${HOME}/.aws

mozc: ## Install ibus-mozc
	test -L ${HOME}/.mozc || rm -rf ${HOME}/.mozc
	ln -vsfn ${HOME}/Dropbox/mozc/.mozc   ${HOME}/.mozc
	yaourt -S ibus-mozc
	ibus-daemon -drx

ttf-cica: ## Install Cica font
	cd ${HOME}/Dropbox/arch/Cica_v3.0.0-rc1/;\
	sudo install -dm755 /usr/share/fonts/TTF;\
	sudo install -m644 *.ttf /usr/share/fonts/TTF/;\
	sudo install -d /usr/share/licenses/ttf-cica/;\
	sudo install -Dm644 *.txt /usr/share/licenses/ttf-cica/;\
	cd -

gnuglobal: ## Install gnu global
	mkdir -p ${HOME}/.local
	pip install --user pygments
	yaourt -S global

backupbase: ## Backup arch linux packages
	mkdir -p ${PWD}/archlinux
	pacman -Qqen > ${PWD}/archlinux/pacmanlist
	pacman -Qnq > ${PWD}/archlinux/allpacmanlist
	pacman -Qqem > ${PWD}/archlinux/yaourtlist

recover: ## Recover arch linux packages from backup
	sudo pacman -S --needed `cat ${PWD}/archlinux/pacmanlist`
	yaourt -S --needed $(DOY) `cat ${PWD}/archlinux/yaourtlist`

neovim: ## Init neovim
	sudo pacman -S neovim
	mkdir -p ${HOME}/.config/nvim
	ln -vsf ${PWD}/.config/nvim/init.vim ${HOME}/.config/nvim/init.vim
	ln -vsf ${PWD}/.config/nvim/installer.sh ${HOME}/.config/nvim/installer.sh
	bash ${HOME}/.config/nvim/installer.sh ${HOME}/.config/nvim

docker: ## Docker initial setup
	sudo usermod -aG docker ${USER}
	mkdir -p ${HOME}/.docker
	ln -vsf ${HOME}/Dropbox/docker/config.json   ${HOME}/.docker/config.json
	sudo systemctl enable docker.service
	sudo systemctl start docker.service

mariadb: # Mariadb initial setup
	sudo pacman -S mariadb mariadb-clients
	sudo ln -vsf ${PWD}/etc/mysql/my.cnf   /etc/mysql/my.cnf
	sudo mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
	sudo systemctl enable mariadb.service
	sudo systemctl start mariadb.service
	mysql_secure_installation
	mysql -u root -p < ${HOME}/Dropbox/mariadb/world.sql/data

redis: ## Redis inital setup
	sudo pacman -S redis
	sudo systemctl enable redis.service
	sudo systemctl start redis.service

varnish: ## Varnish inital setup
	sudo pacman -S varnish
	sudo ln -vsf ${PWD}/etc/varnish/default.vcl   /etc/varnish/default.vcl
	sudo systemctl enable varnish.service
	sudo systemctl start varnish.service

mongodb: ## Mongodb initial setup
	sudo pacman -S mongodb mongodb-tools
	sudo systemctl enable mongodb.service
	sudo systemctl start mongodb.service

powertop: ## Powertop initial setup (Warning take a long time)
	sudo powertop --calibrate
	sudo systemctl enable powertop

gnupg: ## Import gnupg secret-key
	gpg --allow-secret-key-import --import ${HOME}/Dropbox/passwd/privkey.asc

zoom: ## Install zoom for web conference
	sudo pacman -U ${HOME}/Dropbox/arch/zoom_x86_64.pkg.tar.xz

test: ## Test this Makefile using docker
	docker build -t dotfiles ${PWD}
	docker run -v /home/${USER}/Dropbox:${HOME}/Dropbox:cached --name makefiletest -d dotfiles
	@echo "========== make install =========="
	docker exec makefiletest sh -c "cd ${PWD}; make install"
	@echo "========== make init =========="
	docker exec makefiletest sh -c "cd ${PWD}; make init"
	@echo "========== make initroot =========="
	docker exec makefiletest sh -c "cd ${PWD}; make initroot"
	@echo "========== make initdropbox =========="
	docker exec makefiletest sh -c "cd ${PWD}; make initdropbox"
	@echo "========== make neomutt =========="
	docker exec makefiletest sh -c "cd ${PWD}; make neomutt"
	@echo "========== make melpa =========="
	docker exec makefiletest sh -c "cd ${PWD}; make melpa"
	@echo "========== make aur =========="
	docker exec makefiletest sh -c "cd ${PWD}; make aur"
	@echo "========== make mozc =========="
	docker exec makefiletest sh -c "cd ${PWD}; make mozc"
	@echo "========== make pipinstall =========="
	docker exec makefiletest sh -c "cd ${PWD}; make pipinstall"
	@echo "========== make goinstall =========="
	docker exec makefiletest sh -c "cd ${PWD}; make goinstall"
	@echo "========== make nodeinstall =========="
	docker exec makefiletest sh -c "cd ${PWD}; make nodeinstall"
	@echo "========== make rustinstall =========="
	docker exec makefiletest sh -c "cd ${PWD}; make rustinstall"

testsimple: ## Test this Makefile using docker without Dropbox
	docker build -t dotfiles ${PWD}
	docker run --name makefiletest -d dotfiles
	@echo "========== make install =========="
	docker exec makefiletest sh -c "cd ${PWD}; make install"
	@echo "========== make init =========="
	docker exec makefiletest sh -c "cd ${PWD}; make init"
	@echo "========== make initroot =========="
	docker exec makefiletest sh -c "cd ${PWD}; make initroot"
	@echo "========== make neomutt =========="
	docker exec makefiletest sh -c "cd ${PWD}; make neomutt"
	@echo "========== make melpa =========="
	docker exec makefiletest sh -c "cd ${PWD}; make melpa"
	@echo "========== make aur =========="
	docker exec makefiletest sh -c "cd ${PWD}; make aur"
	@echo "========== make pipinstall =========="
	docker exec makefiletest sh -c "cd ${PWD}; make pipinstall"
	@echo "========== make goinstall =========="
	docker exec makefiletest sh -c "cd ${PWD}; make goinstall"
	@echo "========== make nodeinstall =========="
	docker exec makefiletest sh -c "cd ${PWD}; make nodeinstall"
	@echo "========== make rustinstall =========="
	docker exec makefiletest sh -c "cd ${PWD}; make rustinstall"

updatebase: ## Update arch linux packages and save packages cache 3 generations
	yaourt -Syua; paccache -ruk0

check-root:
	@ if [ $$(whoami) != "root" ]; then
		@ echo "Permission denied! You must execute the script as the 'root' user."
		@ exit 1
	@ fi

check-archlinux:
	@ if [[ ! -e /etc/arch-release ]]; then
		@ echo "Error! You must execute the script on Arch Linux."
		@ exit 1
	@ fi

umount-partitions:
	@- umount -R /mnt/boot/efi > /dev/null 2>&1
	@- umount -R /mnt/boot/ > /dev/null 2>&1
	@- umount -R /mnt/home > /dev/null 2>&1
	@- umount -R /mnt/ > /dev/null 2>&1
	@- swapoff -a > /dev/null 2>&1
	@- dmsetup remove_all --force > /dev/null 2>&1


" Griesner config

" Plugins {{{
if empty(glob('~/.vim/autoload/plug.vim'))
        silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
        Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"       Plug 'altercation/vim-colors-solarized'
"        Plug 'KeitaNakamura/neodark.vim'
        Plug 'tomasr/molokai'
"        Plug 'chriskempson/base16-vim'
"        Plug 'sjl/badwolf'
"        Plug 'itchyny/landscape.vim'
"        Plug 'morhetz/gruvbox'
        Plug 'joshdick/onedark.vim'

        Plug 'itchyny/lightline.vim'
        Plug 'vim-syntastic/syntastic'
        Plug 'godlygeek/tabular'

        Plug 'Shougo/unite.vim'
        Plug 'Shougo/vimproc.vim', {'do' : 'make'}
        Plug 'christoomey/vim-tmux-navigator'
        Plug 'bronson/vim-trailing-whitespace'
        Plug 'junegunn/vim-easy-align'
        Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
        Plug 'junegunn/fzf.vim'
        Plug 'lervag/vimtex'
call plug#end()
" test {{{
        colorscheme onedark
" }}}
" neodark {{{
"      colorscheme neodark
"      let g:neodark#background = '#202020'
"      let g:neodark#use_256color = 1 " default: 0
"      let g:lightline = {}
"      let g:lightline.colorscheme = 'neodark'
"      set background=dark
"
" }}}
" Solarized {{{
"       colorscheme solarized
"       set background=dark
"       let g:solarized_contrast="high"
"       let g:solarized_termcolors=256
" }}}
" fzf {{{
        map <leader><space> :Files<CR>
        nnoremap <leader>b :Buffers<CR>
" }}}
" lightline {{{
        let g:lightline = { 'colorscheme': 'solarized', }
        set laststatus=2
"        set noshowmode
" }}}
" polyglot {{{
"
" }}}
" syntastic {{{
"       set statusline+=%#warningmsg#
"       set statusline+=%{SyntasticStatuslineFlag()}
"       set statusline+=%*
        " let g:syntastic_always_populate_loc_list = 1
        " let g:syntastic_auto_loc_list = 1
        " let g:syntastic_check_on_open = 1
        " let g:syntastic_check_on_wq = 0
" }}}
" tabular {{{
        vnoremap <silent> <leader>cee    :Tabularize /=<CR>              "tabular
        vnoremap <silent> <leader>cet    :Tabularize /#<CR>              "tabular
        vnoremap <silent> <leader>ce     :Tabularize /
" }}}
" }}}
" Basic Setup {{{
"        set hidden
        set nocompatible        " This must be first, because it changes other options as side effect
        set mouse=a
        set modelines=1
        set encoding=utf-8      " encoding
        set nocompatible        " This must be first, because it changes other options as side effect
        set nowrap              " don't wrap lines
        set nobackup
        set noswapfile
        set foldenable          " enable folding
        set foldlevelstart=10   " open most folds by default
        set foldmethod=marker
        " Automatically save and load folds
        autocmd BufWinLeave *.* mkview
        autocmd BufWinEnter *.* silent loadview"
        set nu rnu              " relative line number
        syntax enable           " enable syntax processing
        filetype indent on      " load filetype-specific indent files
        set tabstop=4           " number of visual spaces per TAB
        set softtabstop=4       " number of spaces in tab when editing
        set expandtab           " tabs are spaces
        set ignorecase          " ignore case when searching
        set showcmd             " show command in bottom bar
"        set showmode            " show options
        set cursorline          " highlight current line
        set cursorcolumn
        set wildmenu            " visual autocomplete for command menu
        set lazyredraw          " redraw only when we need to.
        set showmatch           " highlight matching [{()}]
        set incsearch           " search as characters are entered
        set hlsearch            " highlight matches
        set autochdir           " Set the working directory to wherever the open file lives
        set shiftround          " use multiple of shiftwidth when indenting with '<' and '>'
        set history=1000        " remember more commands and search history
        set undolevels=1000     " use many muchos levels of undo
        set title               " change the terminal's title
        set visualbell          " don't beep
        set noerrorbells        " don't beep
        set list
        set listchars=tab:›\ ,trail:•,extends:#,nbsp:.
        " set listchars=tab:>.,trail:.,extends:#,nbsp:.

        " Don't offer to open certain files/directories
        set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico,*.swp,*.bak,*.pyc,*.class
        set wildignore+=*.pdf,*.psd
        set wildignore+=node_modules/*,bower_components/*

        " sort is affecting only: directories on the top, files below
        let g:netrw_sort_sequence = '[\/]$,*'
        let g:netrw_banner = 0
        let g:netrw_liststyle = 3
        let g:netrw_browse_split = 4
        let g:netrw_altv = 1
        let g:netrw_winsize = 20
"       augroup ProjectDrawer
"       autocmd!
"       autocmd VimEnter * :Vexplore
"       augroup END
" }}}
" Mappings {{{
" leader {{{
        " let mapleader=","
        map <Space> <Leader>
        nnoremap <leader>; :nohlsearch<CR>                  " turn off search highlight
        nnoremap <leader>s :mksession<CR>                   " save session: type "vim -S" to reopen it
        map <silent><leader>v :source ~/.vimrc<CR>:PlugInstall<CR>:bdelete<CR>:exe ":echo 'vimrc reloaded'"<CR>
" }}j}
        inoremap jj <esc>
        set pastetoggle=<F2>
        " Alternate file
        nnoremap ff :e#<CR>
        " Map the ; key to toggle a selected fold opened/closed.
        nnoremap <silent>; @=(foldlevel('.')?'za':"\;")<CR>
        vnoremap ; zf
        " Easy window navigation
        map <C-j> <C-w>h
        map <C-k> <C-w>j
        map <C-l> <C-w>k
        map <C-m> <C-w>l
        " move between splits
        noremap <C-j> <C-w>h
        noremap <C-k> <C-w>j
        noremap <C-l> <C-w>k
        noremap <C-m> <C-w>l

        noremap j h
        noremap k j
        noremap l k
        noremap m l

        nnoremap j h
        nnoremap k j
        nnoremap l k
        nnoremap m l

        vnoremap j h
        vnoremap k j
        vnoremap l k
        vnoremap m l
        " Misc
        nnoremap gf :vertical wincmd f<CR>                  " 'gf' opens file under cursor in a new vertical split
        nnoremap gV `[v`]                                   " highlight last inserted text

        map <silent> <C-n> :NERDTreeToggle<CR>
        " let g:NERDTreeWinPos = "right"
        nnoremap <Tab> <C-W>w

        " search current whole line in the file
        nnoremap <leader>* 0y$/\V<c-r>"<cr>

        set path=.,**
        set clipboard=unnamed
        set splitbelow
        set splitright
        set backspace=indent,eol,start
        set shiftwidth=4   " number of spaces to use for autoindenting
        set smartcase      " ignore case if search pattern is all lowercase,
        vnoremap // y/<C-R>"<CR>
        nmap <buffer> <CR> <C-]>
        nmap <buffer> <BS> <C-T>
        set so=10
        set autoindent    " always set autoindenting on
        set copyindent    " copy the previous indentation on autoindenting
        set smarttab      " insert tabs on the start of a line according to

        vnoremap // y/<C-R>"<CR>

        set autoread

        nnoremap gr :grep <cword> *<CR>
        nnoremap Gr :grep <cword> %:p:h/*<CR>
        nnoremap gR :grep '\b<cword>\b' *<CR>
        nnoremap GR :grep '\b<cword>\b' %:p:h/*<CR>
" }}}
" vim:foldmethod=marker:foldlevel=0

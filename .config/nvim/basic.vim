"  General Settings
set nocompatible        " This must be first, because it changes other options as side effect
set t_Co=256            " Enable 256 color terminal
set timeoutlen=400
syntax enable           " enable syntax processing
set shortmess=aoOTI
set autoread
set mouse=a
set magic
set encoding=utf-8      " encoding
set nowrap              " don't wrap lines
set nobackup
set noswapfile
set nu rnu              " relative line number
filetype indent on      " load filetype-specific indent files
filetype plugin on      " use the file type plugins
set tabstop=4           " number of visual spaces per TAB
set softtabstop=4       " number of spaces in tab when editing
set expandtab           " tabs are spaces
set ignorecase          " ignore case when searching
"set showcmd            " show command in bottom bar
set noshowcmd           " Don't show command in status line
set cmdheight=2         " Height of the command line
"     set cursorline          " highlight current line
"     set cursorcolumn
set wildmenu            " visual autocomplete for command menu
set wildmode=longest,list,full
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set autochdir           " Set the working directory to wherever the open file lives
set shiftround          " use multiple of shiftwidth when indenting with '<' and '>'
set shiftwidth=4        " number of spaces to use for autoindenting
set history=1000        " remember more commands and search history
set undolevels=1000     " use many muchos levels of undo
set title               " change the terminal's title
set visualbell          " don't beep
set noerrorbells        " don't beep
set list
set so=10
set autoindent          " always set autoindenting on
set copyindent          " copy the previous indentation on autoindenting
set smarttab            " insert tabs on the start of a line according to

set listchars=tab:›\ ,trail:•,extends:#,nbsp:.
set splitbelow
set splitright
"     set showtabline=2       " Always show the tabs line
set backspace=indent,eol,start
set smartcase           " ignore case if search pattern is all lowercase,
set noruler             " Disable default status ruler

" Don't offer to open certain files/directories
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico,*.swp,*.bak,*.pyc,*.class
set wildignore+=*.pdf,*.psd
set wildignore+=node_modules/*,bower_components/*
set noshowmode

set updatetime=300
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Yank buffer's absolute path to X11 clipboard
nnoremap <Leader>y :let @+=expand("%:p")<CR>:echo 'Copied to clipboard.'<CR>


" Mappings
let mapleader=" "
vmap X y/<C-R>"<CR>

map <leader>i {
map <leader>u }


"    nmap <C-t> :tabnew <CR>
"    nmap <C-w> :tabclose <CR>
"cycling tabs
"    nmap <tab> :tabnext <CR>
"    nmap <S-tab> :tabp <CR>

"    map <leader>b :vsp<space>$BIB<CR>

map <leader>w :w<CR>
map <leader>q :q<CR>


" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden
" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>k :enew<cr>
" Move to the next buffer
"     nmap <leader>l :bnext<CR>
nmap <tab> :bnext<CR>
" Move to the previous buffer
nmap <C-tab> :bprevious<CR>
" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>j :bp <BAR> bd #<CR>
" Alternate file
nnoremap ff :e#<CR>

nmap <leader>ss :new<CR>
nmap <leader>sv :vnew<CR>

let g:maplocalleader = ','


nnoremap <leader>; :nohlsearch<CR>
"    map <silent><leader>v :source ~/.vimrc<CR>:PlugInstall<CR>:bdelete<CR>:exe ":echo 'vimrc reloaded'"<CR>
inoremap hh <esc>
set pastetoggle=<F2>


" Map the ; key to toggle a selected fold opened/closed.
nnoremap <silent>; @=(foldlevel('.')?'za':"\;")<CR>
vnoremap ; zf

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

nnoremap <C-Up>    :resize +2<CR>
nnoremap <C-Down>  :resize -2<CR>
nnoremap <C-Left>  :vertical resize +2<CR>
nnoremap <C-Right> :vertical resize -2<CR>

nnoremap H 0
nnoremap L $
nnoremap J <C-d>
nnoremap K <C-u>
vnoremap J <C-d>
vnoremap K <C-u>

xnoremap < <gv
xnoremap > >gv|

" Misc
nnoremap gf :vertical wincmd f<CR>                  " 'gf' opens file under cursor in a new vertical split
nnoremap gV `[v`]                                   " highlight last inserted text

" search current whole line in the file
nnoremap <leader>* 0y$/\V<c-r>"<cr>

set path=.,**
"set clipboard=unnamed
if has('clipboard')
	set clipboard& clipboard+=unnamedplus
endif

vnoremap <leader>y "*Y :let @+=@*<CR>
map <leader>p "+P


" Commenting blocks of code.
autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
autocmd FileType sh,ruby,python   let b:comment_leader = '# '
autocmd FileType conf,fstab       let b:comment_leader = '# '
autocmd FileType tex              let b:comment_leader = '% '
autocmd FileType mail             let b:comment_leader = '> '
autocmd FileType vim              let b:comment_leader = '" '
noremap <silent> <leader>cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> <leader>cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>


" Automatically deletes all trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" When pressing <leader>cd switch to the directory of the open buffer
map <Leader>cd :lcd %:p:h<CR>:pwd<CR>

nmap <buffer> <CR> <C-]>
nmap <buffer> <BS> <C-T>

vnoremap // y/<C-R>"<CR>
map <leader>/ :/<C-R>"<CR>
"vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

nnoremap gr :grep <cword> *<CR>
nnoremap Gr :grep <cword> %:p:h/*<CR>
nnoremap gR :grep '\b<cword>\b' *<CR>
nnoremap GR :grep '\b<cword>\b' %:p:h/*<CR>


" Cycle through splits.
nnoremap <S-Tab> <C-w>w

" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap jj <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://bash
  resize 10
endfunction
nnoremap <leader>tt :call OpenTerminal()<CR>

tnoremap <Esc> <C-\><C-n>:q!<CR>


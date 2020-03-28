"  General Vim settings
    set nocompatible        " This must be first, because it changes other options as side effect
    set t_Co=256            " Enable 256 color terminal
    syntax enable           " enable syntax processing
    set shortmess=aoOTI
    set autoread
    set mouse=v
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
    "set showcmd             " show command in bottom bar
    set noshowcmd           " Don't show command in status line
    set cmdheight=2         " Height of the command line
    set cursorline          " highlight current line
    set cursorcolumn
    set wildmenu            " visual autocomplete for command menu
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
    set showtabline=2       " Always show the tabs line
    set backspace=indent,eol,start
    set smartcase           " ignore case if search pattern is all lowercase,
    set noruler             " Disable default status ruler

    " Don't offer to open certain files/directories
    set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico,*.swp,*.bak,*.pyc,*.class
    set wildignore+=*.pdf,*.psd
    set wildignore+=node_modules/*,bower_components/*

    " Yank buffer's absolute path to X11 clipboard
    nnoremap <Leader>y :let @+=expand("%:p")<CR>:echo 'Copied to clipboard.'<CR>

" Plugins
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
    "Plug 'morhetz/gruvbox'
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'vim-syntastic/syntastic'
   "Plug 'godlygeek/tabular'
   "Plug 'Shougo/unite.vim'
   "Plug 'Shougo/vimproc.vim', {'do' : 'make'}
   "Plug 'bronson/vim-trailing-whitespace'
   "Plug 'junegunn/vim-easy-align'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'lervag/vimtex'
    Plug 'sirver/ultisnips'

    " -- vim airline
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
call plug#end()

set background=dark
colorscheme gruvbox
let g:gruvbox_contrast_dark="hard"

" Mappings
    let mapleader=" "

    nmap <C-t> :tabnew <CR>
    nmap <C-w> :tabclose <CR>
    "cycling tabs
    nmap <tab> :tabnext <CR>
    nmap <S-tab> :tabp <CR>

    map <leader>b :vsp<space>$BIB<CR>

    "previous buffer
    nmap <C-h> :bp <CR>
    "next buffer
    nmap <C-l> :bn <CR>

    map <leader><space> :Files<CR>
    map <leader>w :w<CR>
    map <leader>q :q<CR>

    nnoremap vv 0v$

"   nnoremap <leader>b :Buffers<CR>
    nnoremap <leader>; :nohlsearch<CR>
    nnoremap <leader>s :mksession<CR>
    map <silent><leader>v :source ~/.vimrc<CR>:PlugInstall<CR>:bdelete<CR>:exe ":echo 'vimrc reloaded'"<CR>
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

    nnoremap <Up>    :resize +2<CR>
	nnoremap <Down>  :resize -2<CR>
	nnoremap <Left>  :vertical resize +2<CR>
	nnoremap <Right> :vertical resize -2<CR>

    nnoremap J 0
	nnoremap M $
	nnoremap K G
	nnoremap L gg

	xnoremap < <gv
    xnoremap > >gv|

    map j h
    map k j
    map l k
    map m l

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

    " search current whole line in the file
    nnoremap <leader>* 0y$/\V<c-r>"<cr>

    set path=.,**
    "set clipboard=unnamed
    if has('clipboard')
        set clipboard& clipboard+=unnamedplus
    endif

    vnoremap <C-c> "*Y :let @+=@*<CR>
    map <C-p> "+P

" Automatically deletes all trailing whitespace on save
    autocmd BufWritePre * %s/\s\+$//e

    " When pressing <leader>cd switch to the directory of the open buffer
    map <Leader>cd :lcd %:p:h<CR>:pwd<CR>

    vnoremap // y/<C-R>"<CR>
    nmap <buffer> <CR> <C-]>
    nmap <buffer> <BS> <C-T>

    vnoremap // y/<C-R>"<CR>

    nnoremap gr :grep <cword> *<CR>
    nnoremap Gr :grep <cword> %:p:h/*<CR>
    nnoremap gR :grep '\b<cword>\b' *<CR>
    nnoremap GR :grep '\b<cword>\b' %:p:h/*<CR>

    "activate airline/Powerline fonts/icons
    let g:airline_powerline_fonts = 0
    let g:airline_theme = 'base16'
    set laststatus=2
    " symbols
    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif
    "enables vim_airline to have the upper tab_bar
    let g:airline#extensions#tabline#enabled = 1


" NERDTress File highlighting
    let g:NERDTreeDirArrowExpandable = '•'
    ""'►'
    let g:NERDTreeDirArrowCollapsible ='↪'
    ""'▼'

    function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
        exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
        exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'.   a:extension .'$#'
    endfunction

    call NERDTreeHighlightFile('hs', 'green', 'none', 'green', '#151515')
    call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
    call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
    call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
    call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow','#151515')
    call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
    call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
    call NERDTreeHighlightFile('html', 'green', 'none', '#00FF00', '#ffffff')
    call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
    call NERDTreeHighlightFile('css', 'cyan', 'none', '#10BBFF', '#151515')
    call NERDTreeHighlightFile('coffee', 'Red', 'none', '#ff0000', '#151515')
    call NERDTreeHighlightFile('js', 'yellow', 'none', '#ffa500', '#151515')
    call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

" Vimtex
    let g:tex_flavor='latex'
    let g:vimtex_view_method='zathura'
    let g:vimtex_quickfix_mode=0
    set conceallevel=1
    let g:tex_conceal='abdmg'

    let g:UltiSnipsExpandTrigger = '<tab>'
    let g:UltiSnipsJumpForwardTrigger = '<tab>'
    let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
    let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips', 'UltiSnips']


" Runs a script that cleans out tex build files whenever I close out a .tex
" file
    autocmd VimLeave *.tex !texclear %

    nmap <leader>li <plug>(vimtex-info)
    nmap <leader>lI <plug>(vimtex-info-full)
    nmap <leader>lv <plug>(vimtex-view)
    nmap <leader>ll <plug>(vimtex-compile)
    nmap <leader>le <plug>(vimtex-errors)
    nmap <leader>lo <plug>(vimtex-compile-output)
    nmap <leader>lc <plug>(vimtex-clean)

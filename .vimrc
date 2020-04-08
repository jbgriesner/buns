"  General Vim settings
    set nocompatible        " This must be first, because it changes other options as side effect
    set t_Co=256            " Enable 256 color terminal
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
    Plug 'bling/vim-bufferline'
    Plug 'tpope/vim-fugitive'
    Plug 'jeetsukumaran/vim-buffergator'

    " -- vim airline
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
call plug#end()


    set background=dark
    colorscheme gruvbox
    let g:gruvbox_contrast_dark="hard"

" Always enable preview window on the right with 60% width
    let g:fzf_preview_window = 'right:60%'
" [Buffers] Jump to the existing window if possible
    let g:fzf_buffers_jump = 1

" Mappings
    let mapleader=" "

"    nmap <C-t> :tabnew <CR>
"    nmap <C-w> :tabclose <CR>
    "cycling tabs
"    nmap <tab> :tabnext <CR>
"    nmap <S-tab> :tabp <CR>

"    map <leader>b :vsp<space>$BIB<CR>

    map <leader><space> :Files<CR>
    map <leader>w :w<CR>
    map <leader>q :q<CR>

    nnoremap vv 0v$

" *******************************************************
"   Buffers Management
" *******************************************************

    " This allows buffers to be hidden if you've modified a buffer.
    " This is almost a must if you wish to use buffers in this way.
    set hidden
    " To open a new empty buffer
    " This replaces :tabnew which I used to bind to this mapping
    nmap <leader>k :enew<cr>
    " Move to the next buffer
    nmap <leader>l :bnext<CR>
    nmap <tab> :bnext<CR>
    " Move to the previous buffer
    nmap <leader>h :bprevious<CR>
    " Close the current buffer and move to the previous one
    " This replicates the idea of closing a tab
    nmap <leader>j :bp <BAR> bd #<CR>
    " Alternate file
    nnoremap ff :e#<CR>

    nmap <leader>s :new<CR>
    nmap <leader>v :vnew<CR>

    " Show all open buffers and their status
"    nmap <leader>b :ls<CR>

    nnoremap <leader>b :Buffers<CR>
    nnoremap <leader>, :Lines<CR>


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

    nnoremap <Up>    :resize +2<CR>
	nnoremap <Down>  :resize -2<CR>
	nnoremap <Left>  :vertical resize +2<CR>
	nnoremap <Right> :vertical resize -2<CR>

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

    map <silent><C-n> :NERDTreeToggle<CR>

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

"activate airline/Powerline fonts/icons
    let g:airline_powerline_fonts = 1
    set laststatus=2
    " symbols
"   if !exists('g:airline_symbols')
"       let g:airline_symbols = {}
"    endif
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
    let g:Tex_BIBINPUTS="$BIB"
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
    "autocmd VimLeave *.tex !texclear %

    nmap <leader>li <plug>(vimtex-info)
    nmap <leader>lI <plug>(vimtex-info-full)
    nmap <leader>lv <plug>(vimtex-view)
    nmap <leader>ll <plug>(vimtex-compile)
    nmap <leader>le <plug>(vimtex-errors)
    nmap <leader>lo <plug>(vimtex-compile-output)
    nmap <leader>lc <plug>(vimtex-clean)

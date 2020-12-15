" Plugins
call plug#begin()
    Plug 'morhetz/gruvbox'
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
	Plug 'mhinz/vim-startify'
    Plug 'vim-syntastic/syntastic'
   "Plug 'godlygeek/tabular'
   "Plug 'Shougo/unite.vim'
   "Plug 'Shougo/vimproc.vim', {'do' : 'make'}
   "Plug 'bronson/vim-trailing-whitespace'
   "Plug 'junegunn/vim-easy-align'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'monkoose/fzf-hoogle.vim'

    " Latex stuff
    Plug 'lervag/vimtex'

    " A bunch of useful language related snippets (ultisnips is the engine).
    Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

    " Vimwiki
    Plug 'vimwiki/vimwiki'
    Plug 'mattn/calendar-vim'
    Plug 'vim-pandoc/vim-rmarkdown' " RMarkdown Docs in Vim
    Plug 'vim-pandoc/vim-pandoc' " RMarkdown Docs in Vim
    Plug 'vim-pandoc/vim-pandoc-syntax' " RMarkdown Docs in Vim

    Plug 'mileszs/ack.vim'

    Plug 'bling/vim-bufferline'
    Plug 'tpope/vim-fugitive'
    Plug 'jeetsukumaran/vim-buffergator'
    Plug 'itchyny/lightline.vim'
    Plug 'mgee/lightline-bufferline'                            " Top bar
    Plug 'maximbaz/lightline-trailing-whitespace'               " Trailing whitespace indicator
"     Plug 'maximbaz/lightline-ale'                               " ALE indicator
    Plug 'vifm/vifm.vim'

    " Use release branch (recommend)
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'ryanoasis/vim-devicons'

    Plug 'neovimhaskell/haskell-vim'

    Plug 'puremourning/vimspector'

    Plug 'liuchengxu/vim-which-key'
call plug#end()


" call dein#add('gcavallanti/vim-noscrollbar')                          " Scrollbar for statusline
" call dein#add('cskeeters/vim-smooth-scroll')                          " Smooth scroll
" call dein#add('moll/vim-bbye')                                        " Keep window when closing a buffer
" call dein#add('romainl/vim-qf')                                       " Quickfix / Loclist improvements

" Imports
source $HOME/.config/nvim/basic.vim
source $HOME/.config/nvim/gruvbox.vim
source $HOME/.config/nvim/nerdtree.vim
source $HOME/.config/nvim/fzf.vim
source $HOME/.config/nvim/coc.vim
source $HOME/.config/nvim/vimspector.vim
source $HOME/.config/nvim/ack.vim
source $HOME/.config/nvim/buffers.vim
source $HOME/.config/nvim/lightline.vim
" source $HOME/.config/nvim/which-key.vim
source $HOME/.config/nvim/whichkey.vim
" source $HOME/.config/nvim/ctags.vim
" source $HOME/.config/nvim/haskell-vim.vim
" source $HOME/.config/nvim/hoogle.vim
" source $HOME/.config/nvim/init.vim
" source $HOME/.config/nvim/vifm.vim
" source $HOME/.config/nvim/vimtex.vim
" source $HOME/.config/nvim/vimwiki.vim

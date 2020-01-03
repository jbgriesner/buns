""" Plugins
"""" Dein-begin

if &runtimepath !~# '/dein.vim'
  let s:dein_dir = expand('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  if !isdirectory(s:dein_dir)
    call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_dir))
  endif

  execute 'set runtimepath^=' . s:dein_dir
endif

call dein#begin(expand('~/.cache/dein'))

"""" Plugin manager
call dein#add('Shougo/dein.vim')
call dein#add('haya14busa/dein-command.vim')

"""" Look & feel
call dein#add('morhetz/gruvbox')                                      " Color theme
call dein#add('itchyny/lightline.vim')                                " Bottom bar
call dein#add('mgee/lightline-bufferline')                            " Top bar
call dein#add('maximbaz/lightline-trailing-whitespace')               " Trailing whitespace indicator
call dein#add('maximbaz/lightline-ale')                               " ALE indicator
call dein#add('gcavallanti/vim-noscrollbar')                          " Scrollbar for statusline
call dein#add('cskeeters/vim-smooth-scroll')                          " Smooth scroll
call dein#add('moll/vim-bbye')                                        " Keep window when closing a buffer
call dein#add('romainl/vim-qf')                                       " Quickfix / Loclist improvements


call dein#end()



"""" Theme
colorscheme gruvbox
"set termguicolors
set background=dark
let g:gruvbox_italic=1
let g:gruvbox_invert_selection=0
set guioptions+=c
set guioptions-=T
set guioptions-=m
set guicursor=n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20
hi Normal ctermbg=NONE guibg=NONE


"""" Lightline
let g:lightline = {
      \   'colorscheme': 'gruvbox',
      \   'active': {
      \     'left': [ [ 'mode' ], [ 'pwd' ] ],
      \     'right': [ [ 'linter_ok', 'linter_checking', 'linter_errors', 'linter_warnings', 'trailing', 'lineinfo' ], [ 'fileinfo' ], [ 'scrollbar' ] ],
      \   },
      \   'inactive': {
      \     'left': [ [ 'pwd' ] ],
      \     'right': [ [ 'lineinfo' ], [ 'fileinfo' ], [ 'scrollbar' ] ],
      \   },
      \   'tabline': {
      \     'left': [ [ 'buffers' ] ],
      \     'right': [ [ 'close' ] ],
      \   },
      \   'separator': { 'left': '', 'right': '' },
      \   'subseparator': { 'left': '', 'right': '' },
      \   'mode_map': {
      \     'n' : 'N',
      \     'i' : 'I',
      \     'R' : 'R',
      \     'v' : 'V',
      \     'V' : 'V-LINE',
      \     "\<C-v>": 'V-BLOCK',
      \     'c' : 'C',
      \     's' : 'S',
      \     'S' : 'S-LINE',
      \     "\<C-s>": 'S-BLOCK',
      \     't': '󰀣 ',
      \   },
      \   'component': {
      \     'lineinfo': '%l:%-v',
      \   },
      \   'component_expand': {
      \     'buffers': 'lightline#bufferline#buffers',
      \     'trailing': 'lightline#trailing_whitespace#component',
      \     'linter_ok': 'lightline#ale#ok',
      \     'linter_checking': 'lightline#ale#checking',
      \     'linter_warnings': 'lightline#ale#warnings',
      \     'linter_errors': 'lightline#ale#errors',
      \   },
      \   'component_function': {
      \     'pwd': 'LightlineWorkingDirectory',
      \     'scrollbar': 'LightlineScrollbar',
      \     'fileinfo': 'LightlineFileinfo',
      \   },
      \   'component_type': {
      \     'buffers': 'tabsel',
      \     'trailing': 'error',
      \     'linter_ok': 'left',
      \     'linter_checking': 'left',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \   },
      \ }

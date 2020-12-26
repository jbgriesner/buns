"""" Lightline Settings
" let g:lightline = {
"       \   'colorscheme': 'gruvbox',
"       \   'active': {
"       \     'left': [ [ 'mode' ], [ 'pwd' ] ],
"       \     'right': [ [ 'linter_ok', 'linter_checking', 'linter_errors', 'linter_warnings', 'trailing', 'lineinfo' ], [ 'fileinfo' ], [ 'scrollbar' ] ],
"       \   },
"       \   'inactive': {
"       \     'left': [ [ 'pwd' ] ],
"       \     'right': [ [ 'lineinfo' ], [ 'fileinfo' ], [ 'scrollbar' ] ],
"       \   },
"       \   'tabline': {
"       \     'left': [ [ 'buffers' ] ],
"       \     'right': [ [ 'close' ] ],
"       \   },
"       \   'separator': { 'left': '', 'right': '' },
"       \   'subseparator': { 'left': '', 'right': '' },
"       \   'mode_map': {
"       \     'n' : 'N',
"       \     'i' : 'I',
"       \     'R' : 'R',
"       \     'v' : 'V',
"       \     'V' : 'V-LINE',
"       \     "\<C-v>": 'V-BLOCK',
"       \     'c' : 'C',
"       \     's' : 'S',
"       \     'S' : 'S-LINE',
"       \     "\<C-s>": 'S-BLOCK',
"       \     't': '󰀣 ',
"       \   },
"       \   'component': {
"       \     'lineinfo': '%l:%-v',
"       \   },
"       \   'component_expand': {
"       \     'buffers': 'lightline#bufferline#buffers',
"       \     'trailing': 'lightline#trailing_whitespace#component',
"       \     'linter_ok': 'lightline#ale#ok',
"       \     'linter_checking': 'lightline#ale#checking',
"       \     'linter_warnings': 'lightline#ale#warnings',
"       \     'linter_errors': 'lightline#ale#errors',
"       \   },
"       \   'component_function': {
"       \     'pwd': 'LightlineWorkingDirectory',
"       \     'scrollbar': 'LightlineScrollbar',
"       \     'fileinfo': 'LightlineFileinfo',
"       \   },
"       \   'component_type': {
"       \     'buffers': 'tabsel',
"       \     'trailing': 'error',
"       \     'linter_ok': 'left',
"       \     'linter_checking': 'left',
"       \     'linter_warnings': 'warning',
"       \     'linter_errors': 'error',
"       \   },
"       \ }



" let g:lightline = {
"       \ 'active': {
"       \   'left': [ [ 'mode', 'paste' ],
"       \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
"       \ },
"       \ 'component_function': {
"       \   'gitbranch': 'FugitiveHead'
"       \ },
"       \ }
"


" let g:lightline = {
"       \ 'colorscheme': 'wombat',
"       \ 'active': {
"       \   'left': [ [ 'mode', 'paste' ],
"       \             [ 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified' ] ]
"       \ },
"       \ 'component_function': {
"       \   'cocstatus': 'coc#status',
"       \   'currentfunction': 'CocCurrentFunction'
"       \ },
"       \ }
"
function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'linter_ok', 'linter_checking', 'linter_errors', 'linter_warnings', 'trailing', 'lineinfo' ], [ 'fileinfo' ], [ 'scrollbar' ] ],
      \ },
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
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction',
      \   'pwd': 'LightlineWorkingDirectory',
      \   'scrollbar': 'LightlineScrollbar',
      \   'fileinfo': 'LightlineFileinfo',
      \ },
      \   'component_type': {
      \     'buffers': 'tabsel',
      \     'trailing': 'error',
      \     'linter_ok': 'left',
      \     'linter_checking': 'left',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \   },
      \ }



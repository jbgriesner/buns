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

nnoremap <leader>li <plug>(vimtex-info)
nmap <leader>lI <plug>(vimtex-info-full)
nmap <leader>lv <plug>(vimtex-view)
nnoremap <leader>ll <plug>(vimtex-compile)
nmap <leader>le <plug>(vimtex-errors)
nmap <leader>lo <plug>(vimtex-compile-output)
nmap <leader>lc <plug>(vimtex-clean)


" vimwiki
    nmap <leader>zz <plug>VimwikiIndex
    nmap <leader>zi <plug>VimwikiDiaryIndex
    nmap <leader>zs <plug>VimwikiUISelect
    nmap <leader>zt <plug>VimwikiTabIndex
    nmap <leader>z<Space>m <plug>VimwikiMakeTomorrowDiaryNote
    nmap <leader>z<Space>y <plug>VimwikiMakeYesterdayDiaryNote
    nmap <leader>z<Space>z <plug>VimwikiTabMakeDiaryNote
    nmap <leader>z<Space>i <plug>VimwikiDiaryGenerateLinks
    nmap <leader>z<Space>d <plug>VimwikiMakeDiaryNote

    let g:vim_markdown_math = 1
    let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
    let g:vimwiki_list = [{'path': '/home/jb/research/wiki/', 'syntax': 'markdown', 'ext': '.md', 'nested_syntaxes': {'python': 'python', 'c++': 'cpp', 'sh': 'sh', 'haskell': 'hs'}}]
    let g:vimwiki_global_ext = 0


    au BufRead,BufNewFile *.wiki,*.md set filetype=vimwiki
    autocmd FileType vimwiki map di :VimwikiMakeDiaryNote<CR>
    let g:calendar_options = 'nornu'

    function! ToggleCalendar()
    execute ":Calendar"
    if exists("g:calendar_open")
        if g:calendar_open == 1
        execute "q"
        unlet g:calendar_open
        else
        g:calendar_open = 1
        end
    else
        let g:calendar_open = 1
    end
    endfunction

    autocmd FileType vimwiki map c :call ToggleCalendar()<CR>


"=================================="
"       Document Compiling         "
"=================================="
        " ~~~~~ Compile document, be it groff/LaTeX/markdown/etc.
                map <leader>c :w! \| !compiler <c-r>%<CR>
        " ~~~~~ Turn on Autocompiler mode
                map <leader>a :!setsid autocomp % &<CR>
        " ~~~~~ Open corresponding .pdf/.html or preview
                map <leader>pp :!opout <c-r>%<CR><CR>
        " ~~~~~ Cleans out tex build files when I close out of a .tex file.
               " autocmd VimLeave *.tex !texclear %
        " ~~~~~ Maps the typical auto compiler key to \o which calles the
        " ~~~~~ Vim Live Latex preview function for live preview
"                autocmd FileType tex map <leader>a \o
"
"
" au BufReadCmd *.pdf silent !okular % &
nnoremap <leader>o :!okular <cfile> &<CR><CR>

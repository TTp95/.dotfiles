vim.cmd([[

" Vimtex
augroup VimTex
    au!
    au FIleType tex setlocal spell spelllang=en_us
    au FIleType tex setlocal wrap
    au FIleType tex nnoremap <buffer> <leader>f :VimtexTocToggle<CR>
    au FIleType tex nnoremap <Down> gj
    au FIleType tex inoremap <Down> <C-o>gj
    au FIleType tex vnoremap <Down> gj
    au FIleType tex nnoremap <Up> gk
    au FIleType tex inoremap <Up> <C-o>gk
    au FIleType tex vnoremap <Up> gk

    let g:vimtex_compiler_engine = 'pdflatex'
    let g:vimtex_view_general_viewer = 'evince'

    " map vimtex view for rapid pdf display
    nnoremap <space>,v :VimtexView <CR>
    nnoremap <space>,c :VimtexCompile <CR>
    nnoremap <space>,n :!makeindex main.nlo -s nomencl.ist -o main.nls <CR>

    let maplocalleader = "|"

augroup END

let g:tex_flavor = 'latex'

" Markdown
augroup Markdown
    au!
    au FIleType md setlocal spell spelllang=en_us
    au FIleType md setlocal wrap
    au FIleType md nnoremap <Down> gj
    au FIleType md inoremap <Down> <C-o>gj
    au FIleType md vnoremap <Down> gj
    au FIleType md nnoremap <Up> gk
    au FIleType md inoremap <Up> <C-o>gk
    au FIleType md vnoremap <Up> gk
augroup END

" vim-grammarous
let g:grammarous#languagetool_cmd = '/home/nk/.local/bin/yalafi-grammarous'
map <F9> :GrammarousCheck --lang=en-US<CR>
let g:grammarous#hooks = {}

function! g:grammarous#hooks.on_check(errs) abort
    nmap <buffer><C-l> <Plug>(grammarous-move-to-next-error)
    nmap <buffer><C-h> <Plug>(grammarous-move-to-previous-error)
endfunction

function! g:grammarous#hooks.on_reset(errs) abort
    nunmap <buffer><C-l>
    nunmap <buffer><C-h>
endfunction

]])

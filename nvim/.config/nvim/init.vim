
call plug#begin('/home/nk/.config/nvim/plugged')

" Plebvim lsp Plugins
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'onsails/lspkind-nvim'
Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }

Plug 'glepnir/lspsaga.nvim'
Plug 'simrat39/symbols-outline.nvim'
Plug 'tjdevries/lsp_extensions.nvim'
Plug 'ray-x/lsp_signature.nvim'

" Neovim Tree shitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

" Debugger Plugins
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'

" Snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'

" Vim pro
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug 'tpope/vim-dispatch'
Plug 'theprimeagen/vim-be-good'
Plug 'gruvbox-community/gruvbox'
Plug 'tpope/vim-projectionist'

" ThePrimeagen
Plug 'ThePrimeagen/harpoon'
Plug 'ThePrimeagen/git-worktree.nvim'

" telescope requirements...
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" prettier
Plug 'sbdchd/neoformat'

" Python Formater
Plug 'ambv/black'

"TTp
Plug 'JuliaEditorSupport/julia-vim'
Plug 'kdheepak/JuliaFormatter.vim'
Plug 'simrat39/rust-tools.nvim'
Plug 'rust-lang/rust.vim'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdcommenter'
Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

" Markdown + Writinn
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'https://github.com/conornewton/vim-pandoc-markdown-preview.git' "Markdown Preview
Plug 'lervag/vimtex'
Plug 'https://github.com/rhysd/vim-grammarous.git' "Powerful Grammar check

" Color Schemes
Plug 'flazz/vim-colorschemes'
Plug 'chriskempson/base16-vim'
Plug 'projekt0n/github-nvim-theme'
Plug 'navarasu/onedark.nvim'
Plug 'shaunsingh/moonlight.nvim'
Plug 'tiagovla/tokyodark.nvim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

call plug#end()

lua require("ttp")
lua require'nvim-treesitter.configs'.setup { indent = { enable = true }, highlight = { enable = true, additional_vim_regex_highlighting = true, }, incremental_selection = { enable = true }, textobjects = { enable = true }}
let g:vim_be_good_log_file = 1
let g:vim_apm_log = 1
let g:user_emmet_settings = {
  \  'svelte' : {
  \    'extends' : 'html',
  \  },
  \}

if executable('rg')
    let g:rg_derive_root='true'
endif

let loaded_matchparen = 1
let mapleader = " "

imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>

snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'

nnoremap <silent> Q <nop>

nnoremap <leader>vwh :h <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>bs /<C-R>=escape(expand("<cWORD>"), "/")<CR><CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :Ex<CR>
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <Leader>rp :resize 100<CR>
nnoremap <Leader>ee oif err != nil {<CR>log.Fatalf("%+v\n", err)<CR>}<CR><esc>kkI<esc>
nnoremap <Leader>cpu a%" PRIu64 "<esc>
nnoremap <leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>
nnoremap <leader>gt <Plug>PlenaryTestFile
nnoremap <leader>vwm :lua require("vim-with-me").init()<CR>
nnoremap <leader>dwm :lua require("vim-with-me").disconnect()<CR>
nnoremap <leader>gll :let g:_search_term = expand("%")<CR><bar>:Gclog -- %<CR>:call search(g:_search_term)<CR>
nnoremap <leader>gln :cnext<CR>:call search(_search_term)<CR>
nnoremap <leader>glp :cprev<CR>:call search(_search_term)<CR>

nnoremap <leader>x :silent !chmod +x %<CR>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

nnoremap Y yg$
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" greatest remap ever
xnoremap <leader>p "_dP

" next greatest remap ever : asbjornHaland
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

nnoremap <leader>d "_d
vnoremap <leader>d "_d

" vim TODO
nmap <Leader>tu <Plug>BujoChecknormal
nmap <Leader>th <Plug>BujoAddnormal
let g:bujo#todo_file_path = $HOME . "/.cache/bujo"

nnoremap <Leader>ww ofunction wait(ms: number): Promise<void> {<CR>return new Promise(res => setTimeout(res, ms));<CR>}<esc>k=i{<CR>

inoremap <C-c> <esc>

fun! EmptyRegisters()
    let regs=split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
    for r in regs
        call setreg(r, [])
    endfor
endfun

" ES
com! W w

nmap <leader>nn :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
augroup END

augroup THE_PRIMEAGEN
    autocmd!
    autocmd BufWritePre lua,cpp,c,h,hpp,cxx,cc Neoformat
    autocmd BufWritePre * %s/\s\+$//e
    "autocmd BufEnter,BufWinEnter,TabEnter *.rs :lua require'lsp_extensions'.inlay_hints{}
augroup END

"-----------------------
"-----------------------
"TTp - my list of remap
"-----------------------
"-----------------------
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"GITGUTTER
nmap ) <Plug>(GitGutterNextHunk)
nmap ( <Plug>(GitGutterPrevHunk)
let g:gitgutter_enabled = 1
let g:gitgutter_map_keys = 0
let g:gitgutter_highlight_linenrs = 1

"Pandoc
"let g:pandoc#folding#fdc = 0
"let g:pandoc#folding#level = 999
"let g:pandoc#biblio#use_bibtool = 1
"let g:pandoc#completion#bib#mode = "citeproc"
au FileType markdown call pandoc#completion#Init()

"Better tab experience - from https://webdevetc.com/
map <leader>tn :tabnew<cr>
map <leader>tt :tabnext
map <leader>ty :tabnext<cr>
map <leader>tm :tabmove
map <leader>tc :tabclose<cr>
map <leader>tz :tabonly<cr>

"Compiler
" Compile document, be it groff/LaTeX/markdown/etc.
map <leader>,c :w! \| !compiler <c-r>%<CR>


" Vimtex
augroup VimTex
    au!
    au FIleType tex setlocal spell spelllang=en_us
    au FIleType tex setlocal wrap
    " au FIleType tex setlocal columns=100
    au FIleType tex nnoremap <buffer> <leader>f :VimtexTocToggle<CR>
    au FIleType tex nnoremap <Down> gj
    au FIleType tex inoremap <Down> <C-o>gj
    au FIleType tex vnoremap <Down> gj
    au FIleType tex nnoremap <Up> gk
    au FIleType tex inoremap <Up> <C-o>gk
    au FIleType tex vnoremap <Up> gk
    " Shortcuts
    source ~/.config/nvim/scripts/shortcuts.vim
augroup END
let g:tex_flavor = 'latex'


" Markdown
augroup Markdown
    au!
    au FIleType md setlocal spell spelllang=en_us
    au FIleType md setlocal wrap
    " au FIleType md setlocal columns=100
    au FIleType md nnoremap <Down> gj
    au FIleType md inoremap <Down> <C-o>gj
    au FIleType md vnoremap <Down> gj
    au FIleType md nnoremap <Up> gk
    au FIleType md inoremap <Up> <C-o>gk
    au FIleType md vnoremap <Up> gk
    " Shortcuts
    source ~/.config/nvim/scripts/shortcuts.vim
augroup END


" Julia
" formatting
"let g:JuliaFormatter_always_launch_server=1
let g:JuliaFormatter_use_sysimg=1
let g:JuliaFormatter_options = {
    \ 'style' : 'blue',
    \ }

augroup Julia
    " formatting
    au FIleType julia nnoremap <buffer> <leader>f :JuliaFormatterFormat<CR>
    au FIleType julia vnoremap <buffer> <leader>f :JuliaFormatterFormat<CR>
augroup END

" FreeFEM
autocmd BufNewFile,BufRead *.edp source ~/.config/nvim/scripts/edp.vim

" vim-grammarous
let g:grammarous#languagetool_cmd = '/home/nk/.local/bin/yalafi-grammarous'
map <F9> :GrammarousCheck --lang=en-GB<CR>
let g:grammarous#hooks = {}

function! g:grammarous#hooks.on_check(errs) abort
    nmap <buffer><C-l> <Plug>(grammarous-move-to-next-error)
    nmap <buffer><C-h> <Plug>(grammarous-move-to-previous-error)
endfunction

function! g:grammarous#hooks.on_reset(errs) abort
    nunmap <buffer><C-l>
    nunmap <buffer><C-h>
endfunction

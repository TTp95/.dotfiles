set completeopt=menu,menuone,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

nnoremap <leader>gd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>vsh :lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>vrr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>vrn :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>vi :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>K :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>vca :lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>vd :lua vim.diagnostic.open_float()<CR>
nnoremap <leader>vn :lua vim.diagnostic.goto_next()<CR>
nnoremap <leader>vN :lua vim.diagnostic.goto_prev()<CR>

" Lsp Servers
lua require'lspconfig'.pylsp.setup{ on_attach=on_attach }
lua require'lspconfig'.julials.setup{ on_attach=on_attach }
lua require'lspconfig'.texlab.setup{ on_attach=on_attach }
lua require'lspconfig'.fortls.setup{ on_attach=on_attach }

" Rust
lua << EOF
-- Update this path
local extension_path = vim.env.HOME .. '/.vscode/extensions/vadimcn.vscode-lldb-1.6.10/'
local codelldb_path = extension_path .. 'adapter/codelldb'
local liblldb_path = extension_path .. 'lldb/lib/liblldb.so'

local opts = {
    -- ... other configs
    dap = {
        adapter = require('rust-tools.dap').get_codelldb_adapter(
            codelldb_path, liblldb_path)
    }
}

-- Normal setup
require('rust-tools').setup(opts)
EOF

" Julia Lang
autocmd Filetype julia setlocal omnifunc=v:lua.vim.lsp.omnifunc
autocmd Filetype julia hi link juliaFunctionCall Identifier
autocmd Filetype julia hi Operator guifg=Red ctermfg=Red
autocmd Filetype julia lua require("lsp_signature").on_attach()

"nvim-dap
nnoremap <silent> <F5> :lua require'dap'.continue()<CR>
nnoremap <silent> <F10> :lua require'dap'.step_over()<CR>
nnoremap <silent> <F11> :lua require'dap'.step_into()<CR>
nnoremap <silent> <F12> :lua require'dap'.step_out()<CR>
nnoremap <silent> <leader>b :lua require'dap'.toggle_breakpoint()<CR>
nnoremap <silent> <leader>B :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
nnoremap <silent> <leader>lp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
nnoremap <silent> <leader>dr :lua require'dap'.repl.open()<CR>
nnoremap <silent> <leader>dl :lua require'dap'.run_last()<CR>

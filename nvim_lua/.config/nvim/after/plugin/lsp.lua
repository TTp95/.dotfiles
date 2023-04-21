local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
    'rust_analyzer',
    'julials',
    'lua_ls',
    'texlab',
})

-- Fix Undefined global 'vim'
lsp.configure('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

-- Sources
local source_mapping = {
	buffer = "[Buffer]",
	nvim_lsp = "[LSP]",
	nvim_lua = "[Lua]",
	cmp_tabnine = "[TN]",
	path = "[Path]",
	luasnip = "[Snippet]",
}

-- Lspkind
local lspkind = require("lspkind")
require('lspkind').init({})

-- Lua Snip
local luasnip = require("luasnip")

-- Setup nvim-cmp.
local cmp = require('cmp')

lsp.setup_nvim_cmp({
    snippet = {
        expand = function(args)
            -- For `luasnip` user.
            require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = {
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ['<C-l>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, {'i', 's'}),
        ['<C-h>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, {'i', 's'}),
    },

    formatting = {
        format = function(entry, vim_item)
            vim_item.kind = lspkind.presets.default[vim_item.kind]
            local menu = source_mapping[entry.source.name]
            if entry.source.name == 'cmp_tabnine' then
                if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
                    menu = entry.completion_item.data.detail .. ' ' .. menu
                end
                vim_item.kind = ''
            end
            vim_item.menu = menu
            return vim_item
        end
    },

    sources = {
        { name = 'nvim_lsp' },

        -- For luasnip user.
        { name = 'luasnip' },

        { name = 'buffer' },

		{ name = "path" },

        -- tabnine
		{ name = "cmp_tabnine" },
    }
})

lsp.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr, remap = false}

    -- Lsp Remaps
    vim.keymap.set("n", "<leader>gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "<leader>K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "<leader>vn", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "<leader>vN", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("n", "<leader>vi", function() vim.lsp.buf.implementation() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

-- Lsp Zero Rust Server
local rust_lsp = lsp.build_options('rust_analyzer', {})

-- LSP Zero Setup
lsp.setup()

-- Rust + RustLSP + Debug
-- Always update this path
local extension_path = vim.env.HOME .. '/.vscode/extensions/vadimcn.vscode-lldb-1.7.3/'
local codelldb_path = extension_path .. 'adapter/codelldb'
local liblldb_path = extension_path .. 'lldb/lib/liblldb.so'

local opts = {
    dap = {
        adapter = require('rust-tools.dap').get_codelldb_adapter(
            codelldb_path, liblldb_path)
    },

    server = rust_lsp,
}

-- Initialize rust_analyzer with rust-tools
require('rust-tools').setup(opts)

-- Virtual Text
vim.diagnostic.config({
    virtual_text = true
})

-- Tabnine
local tabnine = require("cmp_tabnine.config")
tabnine:setup({
	max_lines = 1000,
	max_num_results = 20,
	sort = true,
	run_on_every_keystroke = true,
	snippet_placeholder = "..",
})

-- Friendly Snippets
require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.local/share/nvim/lazy/friendly-snippets" } })

-- Lsp Signature Help
require("lsp_signature").on_attach()

-- nvim-dap
require("dapui").setup()
require("nvim-dap-virtual-text").setup()

local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

-- nvim-dap
vim.keymap.set("n", "<silent><F5>", ":lua require'dap'.continue()<CR>")
vim.keymap.set("n", "<silent><F10>", ":lua require'dap'.step_over()<CR>")
vim.keymap.set("n", "<silent><F11>", ":lua require'dap'.step_into()<CR>")
vim.keymap.set("n", "<silent><F12>", ":lua require'dap'.step_out()<CR>")
vim.keymap.set("n", "<silent><leader>b", ":lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set("n", "<silent><leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
vim.keymap.set("n", "<silent><leader>lp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
vim.keymap.set("n", "<silent><leader>dr", ":lua require'dap'.repl.open()<CR>")
vim.keymap.set("n", "<silent><leader>dl", ":lua require'dap'.run_last()<CR>")

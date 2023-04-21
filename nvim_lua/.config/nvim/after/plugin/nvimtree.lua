-- nvim tree lua
require("nvim-tree").setup {
    hijack_cursor = true,
    hijack_netrw = false,
    respect_buf_cwd = true,
    renderer = {
        group_empty = true, --> here
    },
    diagnostics = {
        enable = true, --> here
        show_on_dirs = true, --> here
    },
}

vim.api.nvim_create_autocmd("BufEnter", {
    nested = true,
    callback = function()
        if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
            vim.cmd "quit"
        end
    end
})

vim.keymap.set("n", "<leader>ft", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>r", ":NvimTreeRefresh<CR>")
vim.keymap.set("n", "<leader>n", ":NvimTreeFindFile<CR>")

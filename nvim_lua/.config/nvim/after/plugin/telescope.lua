require("telescope").setup()
require("telescope").load_extension("fzf")
require('telescope').load_extension('dap')


vim.keymap.set('n', "<leader><C-p>", ":Telescope<CR>")
vim.keymap.set('n', "<leader>pc", ":Telescope current_buffer_fuzzy_find fuzzy=false case_mode=ignore_case<CR>")
vim.keymap.set('n', "<leader>ps", ":lua require('telescope.builtin').grep_string({ search = vim.fn.input(\"Grep For > \")})<CR>")
vim.keymap.set('n', "<C-p>", ":lua require('telescope.builtin').git_files()<CR>")
vim.keymap.set('n', "<Leader>pf", ":lua require('telescope.builtin').find_files()<CR>")
vim.keymap.set('n', "<leader>pg", ":lua require('telescope.builtin').live_grep()<CR>")

vim.keymap.set('n', "<leader>pw", ":lua require('telescope.builtin').grep_string { search = vim.fn.expand(\"<cword>\") }<CR>")
vim.keymap.set('n', "<leader>pb", ":lua require('telescope.builtin').buffers()<CR>")
vim.keymap.set('n', "<leader>vh", ":lua require('telescope.builtin').help_tags()<CR>")
vim.keymap.set('n', "<leader>gc", ":lua require('telescope.builtin').git_branches()<CR>")

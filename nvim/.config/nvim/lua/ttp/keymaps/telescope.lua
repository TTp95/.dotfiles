local Remap = require("ttp.keymap")
local nnoremap = Remap.nnoremap

nnoremap("<leader><C-p>", ":Telescope<CR>")
nnoremap("<leader>pc", ":Telescope current_buffer_fuzzy_find fuzzy=false case_mode=ignore_case<CR>")
nnoremap("<leader>ps", ":lua require('telescope.builtin').grep_string({ search = vim.fn.input(\"Grep For > \")})<CR>")
nnoremap("<C-p>", ":lua require('telescope.builtin').git_files()<CR>")
nnoremap("<Leader>pf", ":lua require('telescope.builtin').find_files()<CR>")
nnoremap("<leader>pg", ":lua require('telescope.builtin').live_grep()<CR>")

nnoremap("<leader>pw", ":lua require('telescope.builtin').grep_string { search = vim.fn.expand(\"<cword>\") }<CR>")
nnoremap("<leader>pb", ":lua require('telescope.builtin').buffers()<CR>")
nnoremap("<leader>vh", ":lua require('telescope.builtin').help_tags()<CR>")
nnoremap("<leader>gc", ":lua require('telescope.builtin').git_branches()<CR>")
nnoremap("<leader>gw", ":lua require('telescope').extensions.git_worktree.git_worktrees()<CR>")
nnoremap("<leader>gm", ":lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>")

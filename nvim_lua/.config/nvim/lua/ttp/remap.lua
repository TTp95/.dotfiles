-- leader
vim.g.mapleader = " "

-- open netrw
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- resize windows
vim.keymap.set("n", "<Leader>+", "<cmd>vertical resize +5<CR>")
vim.keymap.set("n", "<Leader>-", "<cmd>vertical resize -5<CR>")
vim.keymap.set("n", "<Leader>rp","<cmd>resize 100<CR>")

-- move one line up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- join lines
vim.keymap.set("n", "J", "mzJ`z")

-- movements
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest paste remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- greatest yank remap ever
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- greatest delete remap ever
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- This is going to get me cancelled
-- 'Ctrl + C' => 'Esc'
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Unmap Q
vim.keymap.set("n", "Q", "<nop>")

-- quickfix
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- search and replace word under cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- change mod to current file
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- source current file
vim.keymap.set("n", "<leader><leader>so", function()
    vim.cmd("so")
end)

-- Better tab experience - from https://webdevetc.com/
vim.keymap.set("n", "<leader>tn", ":tabnew<cr>")
vim.keymap.set("n", "<leader>tt", ":tabnext<cr>")
vim.keymap.set("n", "<leader>ty", ":tabnext")
vim.keymap.set("n", "<leader>tm", ":tabmove")
vim.keymap.set("n", "<leader>tc", ":tabclose<cr>")
vim.keymap.set("n", "<leader>to", ":tabonly<cr>")

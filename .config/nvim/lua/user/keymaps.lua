local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Remap space as the leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --
-- Better navigation of splits
keymap("n", "<C-h>", "<C-w>h", opts         )
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<C-k>", "<C-w>k", opts)

--keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<Esc>", opts)

-- Visual --
keymap("v", "p", '"_dP', opts)

-- Formatting --
keymap("n", "ff", "<cmd> lua vim.lsp.buf.format()<CR>", opts)

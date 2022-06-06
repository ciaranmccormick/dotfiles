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

keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprev<CR>", opts)


-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<Esc>", opts)

-- Visual --
keymap("v", "p", '"_dP', opts)

-- Telescope --
keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files()<CR>", opts)
keymap("n", "<leader>b", "<cmd>lua require'telescope.builtin'.buffers()<CR>", opts)
keymap("n", "<leader>q", "<cmd>lua require'telescope.builtin'.quickfix()<CR>", opts)
keymap("n", "<leader>s", "<cmd>lua require'telescope.builtin'.lsp_document_symbols()<CR>", opts)

keymap("n", "<c-t>", "<cmd>Telescope live_grep<cr>", opts)

-- Formatting --
keymap("n", "ff", "<cmd> lua vim.lsp.buf.formatting_sync()<CR>", opts)


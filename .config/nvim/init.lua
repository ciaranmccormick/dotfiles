-- User
require "user.options"
require "user.keymaps"
require "user.colorscheme"
require "user.plugins"

-- Systems
require "user.cmp"
require "user.lsp"

-- Plugins
require "user.impatient"
require "user.lualine"
require "user.telescope"
require "user.treesitter"
require "user.autopairs"
require "user.gitsigns"
require "user.comment"
require "user.nvim-tree"
require "user.toggleterm"
require "user.whichkey"
require "user.indentline"


local vim = vim
local opt = vim.opt

opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.g.python3_host_prog = 0

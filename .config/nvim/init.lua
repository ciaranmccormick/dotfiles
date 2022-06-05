--local plugins = require 'plugins'
--plugins.setup()

require "user.options"
require "user.keymaps"
require "user.plugins"
require "user.colorscheme"
require "user.cmp"
require "user.lsp"
require "user.telescope"
require "user.treesitter"
require "user.autopairs"
require "user.gitsigns"
require "user.comment"
require "user.nvim-tree"
require "user.toggleterm"


--require 'statusline'

--local lspconfig = require('lspconfig')
--lspconfig.pyright.setup{}
--local installer = require("nvim-lsp-installer")
--installer.setup {}


-- local luasnip = require('luasnip')
-- nvim-cmp setup
-- local cmp = require('cmp')


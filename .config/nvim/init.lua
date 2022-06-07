--local plugins = require 'plugins'
--plugins.setup()

-- User
require "user.options"
require "user.keymaps"
require "user.colorscheme"
require "user.plugins"

-- Systems
require "user.cmp"
require "user.lsp"

-- Plugins
require "user.lualine"
require "user.telescope"
require "user.treesitter"
require "user.autopairs"
require "user.gitsigns"
require "user.comment"
require "user.nvim-tree"
require "user.toggleterm"
require "user.whichkey"



--require 'statusline'

--local lspconfig = require('lspconfig')
--lspconfig.pyright.setup{}
--local installer = require("nvim-lsp-installer")
--installer.setup {}


-- local luasnip = require('luasnip')
-- nvim-cmp setup
-- local cmp = require('cmp')


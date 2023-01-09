--[[
lvim is the global options object

Linters should be filled in as strings with either
a global executable or a path to an executable
]]

-- general
vim.opt.mouse = "i"
lvim.colorscheme = "codedark"
vim.opt.relativenumber = true
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.builtin.bufferline.active = false

lvim.builtin.which_key.mappings["t"] = {
  name = "ToggleTerm",
  t = { "<cmd>ToggleTerm<CR>", "Toggle Terminal" },
  g = { "<cmd>lua _lazygit_toggle()<CR>", "Toggle Lazygit" },
  d = { "<cmd>lua _lazydocker_toggle()<CR>", "Toggle Lazydocker" }
}

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"

-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.insert_mode["jk"] = "<Esc>"

-- NvimTree
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
lvim.builtin.which_key.mappings["e"] = {
  name = "NvimTree",
  o = { "<cmd>NvimTreeFocus<CR>", "Open" },
  c = { "<cmd>NvimTreeClose<CR>", "Close" },
  t = { "<cmd>NvimTreeToggle<CR>", "Toggle" },
  r = { "<cmd>NvimTreeResize<CR>", "Resize" },
  f = { "<cmd>NvimTreeFocus<CR>", "Focus" },
}


-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true


-- generic LSP settings
-- -- make sure server will always be installed even if the server is in skipped_servers list
lvim.lsp.installer.setup.ensure_installed = {
  "jsonls",
  "pyright",
  "marksman"
}

--
-- -- change UI setting of `LspInstallInfo`
-- -- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
-- lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- lvim.lsp.installer.setup.ui.border = "rounded"
-- lvim.lsp.installer.setup.ui.keymaps = {
--     uninstall_server = "d",
--     toggle_server_expand = "o",
-- }

-- ---@usage disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "black", filetypes = { "python" } },
  { command = "isort", filetypes = { "python" } },
  { command = "markdownlint", filetypes = { "markdown" } },
  {
    command = "prettier",
    extra_args = { "--print-with", "100" },
    filetypes = { "typescript", "typescriptreact" },
  },
}

-- -- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "shellcheck", extra_args = { "--severity", "warning" } },
  { command = "flake8", filetypes = { "python" } },
  { command = "cspell", extra_args = { "--locale", "en-GB" }, filetypes = { "javascript", "markdown" } },
  { command = "markdownlint", filetypes = { "markdown" } },
}

-- DAP settings
lvim.builtin.dap.active = true
local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")

-- set up DAP Python
pcall(function() require("dap-python").setup(mason_path .. "packages/debugpy/venv/bin/python") end)
pcall(function() require("dap-python").test_runner = "pytest" end)
lvim.builtin.which_key.mappings["dm"] = { "<cmd>lua require('dap-python').test_method()<cr>", "Test Method" }
lvim.builtin.which_key.mappings["df"] = { "<cmd>lua require('dap-python').test_class()<cr>", "Test Class" }
lvim.builtin.which_key.vmappings["d"] = { name = "Debug",
  s = { "<cmd>lua require('dap-python').debug_selection()<cr>", "Debug Selection" },
}


-- add additional packages
lvim.plugins = {
  "mfussenegger/nvim-dap-python",
  "tomasiser/vim-code-dark",
  -- You can switch between vritual environmnts.
  "AckslD/swenv.nvim",
  "tpope/vim-surround",
  { "vimwiki/vimwiki",
    config = function()
      vim.g.vimwiki_global_ext = 0
      vim.g.vimwiki_list = {
        {
          path = "~/vimwiki/",
          auto_export = 1,
          syntax = 'markdown',
          ext = '.md',
        }
      }
    end

  },
}

-- setup lazydocker
-- lvim.builtin.terminal.execs[#lvim.builtin.terminal.execs + 1] = { "lazydocker", "td", "Lazydocker" }
-- function _lazydocker_toggle()
--   local Terminal = require("toggleterm.terminal").Terminal
--   local lazydocker = Terminal:new {
--     cmd = "lazydocker",
--     hidden = true,
--     direction = "float",
--     float_opts = {
--       border = "none",
--       width = 100000,
--       height = 100000,
--     },
--     on_open = function(_)
--       vim.cmd "startinsert!"
--     end,
--     on_close = function(_) end,
--     count = 99,
--   }
--   lazydocker:toggle()
-- end

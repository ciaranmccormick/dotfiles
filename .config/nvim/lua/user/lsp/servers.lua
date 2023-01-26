-- Learn the keybindings, see :help lsp-zero-keybindings
-- Learn to configure LSP servers, see :help lsp-zero-api-showcase
local status_ok, mason = pcall(require, "mason")
if not status_ok then
  return
end
mason.setup()

local servers = {
  "sumneko_lua",
  "rust_analyzer",
  "tsserver",
  "pyright",
}
require('mason-lspconfig').setup({ ensure_installed = servers })

local lspconfig = require("lspconfig")
require('mason-lspconfig').setup_handlers({
  function(server_name)
    local opts = {
      on_attach = require("user.lsp.handlers").on_attach,
      capabilities = require("user.lsp.handlers").capabilities,
    }
    local has_custom_opts, server_custom_opts = pcall(require, "user.lsp.settings." .. server_name)
    if has_custom_opts then
      opts = vim.tbl_deep_extend("force", server_custom_opts, opts)
    end
    lspconfig[server_name].setup(opts)
  end,
})

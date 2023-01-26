local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

local f = null_ls.builtins.formatting
local d = null_ls.builtins.diagnostics
local ca = null_ls.builtins.code_actions
local settings = {
  debug = false,
  sources = {
    -- formatting
    f.prettier,
    f.black,
    f.blue,
    f.isort,
    f.stylua,
    f.rustfmt,
    -- diagnostics
    d.flake8,
    d.eslint,
    d.mypy,
    d.codespell,
    d.markdownlint,
    -- code actions
    ca.eslint,
  },
}
null_ls.setup(settings)

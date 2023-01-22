local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local f = null_ls.builtins.formatting
local d = null_ls.builtins.diagnostics
local c = null_ls.builtins.code_actions

local sources = {

  -- python
  f.black,
  f.isort,
  d.flake8,
  d.mypy,

  -- rust 
  f.rustfmt,

  -- webdev stuff
  f.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  f.prettier.with { filetypes = { "html", "markdown", "css" } }, -- so prettier works only on these filetypes
  c.eslint,

  -- Lua
  f.stylua,

  -- cpp
  f.clang_format,

  -- markdown
  d.markdownlint,
}

null_ls.setup {
  debug = true,
  sources = sources,
}

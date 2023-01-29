local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

local f = null_ls.builtins.formatting
local d = null_ls.builtins.diagnostics
local ca = null_ls.builtins.code_actions
local settings = {
	debug = true,
	timeout_ms = 5000,
	sources = {
		-- formatting
    -- js/html/ts
		f.prettier,
    -- python
		f.black,
		f.isort,
    -- f.ruff,
    -- lua
		f.stylua,
    -- rust
		f.rustfmt,
		-- diagnostics
		d.eslint,
    -- python
		d.flake8,
		d.mypy,
    -- spelling/markdown
		d.codespell,
		d.markdownlint,
		-- code actions
		ca.eslint,
	},
}
null_ls.setup(settings)

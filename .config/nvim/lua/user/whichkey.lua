local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local plugins = {
	marks = true, -- shows a list of your marks on ' and `
	registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
	spelling = {
		enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
		suggestions = 20, -- how many suggestions should be shown in the list?
	},
	-- the presets plugin, adds help for a bunch of default keybindings in Neovim
	-- No actual key bindings are created
	presets = {
		operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
		motions = true, -- adds help for motions
		text_objects = true, -- help for text objects triggered after entering an operator
		windows = true, -- default bindings on <c-w>
		nav = true, -- misc bindings to work with windows
		z = true, -- bindings for folds, spelling and others prefixed with z
		g = true, -- bindings for prefixed with g
	},
}

local window = {
	border = "rounded", -- none, single, double, shadow
	position = "bottom", -- bottom, top
	margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
	padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
	winblend = 0,
}
local layout = {
	height = { min = 4, max = 25 }, -- min and max height of the columns
	width = { min = 20, max = 50 }, -- min and max width of the columns
	spacing = 3, -- spacing between columns
	align = "left", -- align columns left, center or right
}

local settings = {
	-- add operators that will trigger motion and text object completion
	-- to enable all native operators, set the preset / operators plugin above
	-- operators = { gc = "Comments" },
	plugins = plugins,
	window = window,
	layout = layout,
	key_labels = {},
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
	popup_mappings = {
		scroll_down = "<c-d>", -- binding to scroll down inside the popup
		scroll_up = "<c-u>", -- binding to scroll up inside the popup
	},
	ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
	show_help = true, -- show help message on the command line when the popup is visible
	triggers = "auto", -- automatically setup triggers
	triggers_blacklist = {
		-- list of mode / prefixes that should never be hooked by WhichKey
		-- this is mostly relevant for key maps that start with a native binding
		-- most people should not need to change this
		i = { "j", "k" },
		v = { "j", "k" },
	},
}

local opts = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local packer = {
	name = "Packer",
	c = { "<cmd>PackerCompile<cr>", "Compile" },
	i = { "<cmd>PackerInstall<cr>", "Install" },
	s = { "<cmd>PackerSync<cr>", "Sync" },
	S = { "<cmd>PackerStatus<cr>", "Status" },
	u = { "<cmd>PackerUpdate<cr>", "Update" },
}

local git = {
	name = "Git",
	-- Lazygit
	g = { "<cmd>lua _LAZYGIT_TOGGLE()<cr>", "Lazygit" },
	-- Telescope
	b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
	c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
	o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
	-- Gitsigns
	a = { "<cmd>Gitsigns stage_buffer <cr>", "Stage Buffer" },
	d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Diff" },
	j = { "<cmd>Gitsigns next_hunk<cr>", "Next Hunk" },
	k = { "<cmd>Gitsigns prev_hunk<cr>", "Prev Hunk" },
	l = { "<cmd>Gitsigns blame_line<cr>", "Blame" },
	p = { "<cmd>Gitsigns preview_hunk<cr>", "Preview Hunk" },
	r = { "<cmd>Gitsigns reset_hunk<cr>", "Reset Hunk" },
	R = { "<cmd>Gitsigns reset_buffer<cr>", "Reset Buffer" },
	s = { "<cmd>Gitsigns stage_hunk<cr>", "Stage Hunk" },
	u = { "<cmd>Gitsigns undo_stage_hunk<cr>", "Undo Stage Hunk" },
}

local lsp = {
	name = "LSP",
	-- LSP Info/Mason
	i = { "<cmd>LspInfo<cr>", "Info" },
	I = { "<cmd>Mason<cr>", "Installer Info" },
	-- nvim diagnostics
	j = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "Next Diagnostic" },
	k = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Prev Diagnostic" },
	-- nvim LSP
	a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
	f = { "<cmd>lua vim.lsp.buf.format()<cr>", "Format" },
	l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
	q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
	r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
	-- Telescope
	d = { "<cmd>Telescope diagnostics bufnr=0<cr>", "Document Diagnostics" },
	w = { "<cmd>Telescope lsp_workspace_diagnostics<cr>", "Workspace Diagnostics" },
	s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
	S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols" },
}

local find = {
	name = "Find",
	b = { "<cmd>Telescope buffers<cr>", "Buffers" },
	B = { "<cmd>Telescope file_browser<cr>", "File Browser" },
	c = { "<cmd>Telescope command_history theme=dropdown<cr>", "Command History" },
	C = { "<cmd>Telescope commands theme=dropdown<cr>", "Commands" },
	f = { "<cmd>Telescope git_files<cr>", "Find files" },
	F = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },
	g = { "<cmd>Telescope find_files<cr>", "Git Files" },
	h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
	k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
	m = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
	o = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
	p = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
	R = { "<cmd>Telescope registers<cr>", "Registers" },
	r = { "<cmd>Telescope lsp_references<cr>", "References" },
	s = { "<cmd>Telescope spell_suggest theme=cursor<cr>", "Spell Suggestions" },
}

local terminal = {
	name = "Terminal",
	f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
	h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
	v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
}

local mappings = {
	["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
	["w"] = { "<cmd>w!<CR>", "Save" },
	["c"] = { "<cmd>bdelete %<CR>", "Close Buffer" },
	["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
	f = find,
	p = packer,
	g = git,
	l = lsp,
	t = terminal,
}

which_key.setup(settings)
which_key.register(mappings, opts)

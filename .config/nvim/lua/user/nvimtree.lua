-- Settings for https://github.com/nvim-tree/nvim-tree.lua
local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  return
end

-- Replaces auto_close
local tree_cb = nvim_tree_config.nvim_tree_callback
vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
      vim.cmd "quit"
    end
  end
})

local view = {
  side = "left",
  adaptive_size = false,
  width = 35,
  hide_root_folder = false,
  preserve_window_proportions = false,
  number = true,
  relativenumber = true,
  signcolumn = "yes",
  mappings = {
    custom_only = false,
    list = {
      { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
      { key = "h", cb = tree_cb "close_node" },
      { key = "v", cb = tree_cb "vsplit" },
    },
  },
}

local window_picker = {
  enable = true,
  chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
  exclude = {
    filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
    buftype = { "nofile", "terminal", "help" },
  },
}
local actions = {
  use_system_clipboard = true,
  change_dir = { enable = true, global = false, restrict_above_cwd = false },
  expand_all = { max_folder_discovery = 300 },
  open_file = {
    quit_on_open = false,
    resize_window = true,
    window_picker = window_picker,
  },
  remove_file = { close_window = true },
}

local settings = {
  auto_reload_on_write = true,
  create_in_closed_folder = false,
  disable_netrw = false,
  hijack_cursor = false,
  hijack_netrw = true,
  hijack_unnamed_buffer_when_opening = false,
  ignore_buffer_on_setup = false,
  open_on_setup = false,
  open_on_setup_file = false,
  open_on_tab = false,
  sort_by = "name",
  update_cwd = false,
  reload_on_bufenter = false,
  respect_buf_cwd = false,
  view = view,
  renderer = {
    add_trailing = false,
    group_empty = false,
    highlight_git = false,
    highlight_opened_files = "none",
    root_folder_modifier = ":~",
    indent_markers = {
      enable = false,
      icons = {
        corner = "└ ",
        edge = "│ ",
        none = "  ",
      },
    },
    icons = {
      webdev_colors = true,
      git_placement = "before",
      padding = " ",
      symlink_arrow = " ➛ ",
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
      glyphs = {
        default = "",
        symlink = "",
        folder = {
          arrow_closed = "",
          arrow_open = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌",
        },
      },
    },
    special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md", "pyproject.toml", "poetry.lock" },
  },
  hijack_directories = { enable = true, auto_open = true },
  update_focused_file = { enable = false, update_cwd = false, ignore_list = {} },
  ignore_ft_on_setup = {},
  system_open = { cmd = "", args = {} },
  diagnostics = {
    enable = false,
    show_on_dirs = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  filters = {
    dotfiles = true,
    custom = {},
    exclude = {},
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 400,
  },
  actions = actions,
  trash = {
    cmd = "trash",
    require_confirm = true,
  },
  live_filter = {
    prefix = "[FILTER]: ",
    always_show_folders = true,
  },
  log = {
    enable = false,
    truncate = false,
    types = {
      all = false,
      config = false,
      copy_paste = false,
      diagnostics = false,
      git = false,
      profile = false,
    },
  },
}
nvim_tree.setup(settings)

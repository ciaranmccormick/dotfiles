local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>c"] = { ":bdelete<cr>", "close the current buffer" },
    ["<leader>w"] = { ":write<cr>", "close the current buffer" },
    ["<leader>gg"] = {
      function()
        local Terminal = require("toggleterm.terminal").Terminal
        local lazygit = Terminal:new {
          cmd = "lazygit",
          direction = "float",
          hidden = true,
        }
        lazygit:toggle()
      end,
      "Lazygit",
    },
  },
  i = {
    ["jk"] = { "<ESC>", "enter normal mode" },
  },
}

return M

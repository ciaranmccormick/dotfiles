local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>c"] = { ":BufferClose<cr>", "close the current buffer" },
    ["<leader>w"] = { ":write<cr>", "close the current buffer" },
  },

  i = {
    ["jk"] = { "<ESC>", "enter normal mode" },
  },
}

return M

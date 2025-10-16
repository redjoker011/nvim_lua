return {
  "echasnovski/mini.misc",
  version = false, -- track latest version
  config = function()
    local misc = require("mini.misc")
    misc.setup() -- safe to call even with no options

    -- Keymaps
    -- Toggle window zoom (maximize / restore)
    vim.keymap.set("n", "<C-w>z", misc.zoom, {
      desc = "Toggle window zoom",
      silent = true,
    })
  end,
}

return {
  "Mofiqul/dracula.nvim",
  lazy = false,    -- Load during startup if this is your primary colorscheme
  priority = 1000, -- Load prior to other UI plugins
  config = function()
    local dracula = require("dracula")
    dracula.setup({
      -- Choose between "dracula" and "dracula-soft"
      theme = "dracula",
      -- Set to true to disable background colors (transparent terminal support)
      transparent_bg = false,
      -- Styling options
      italic_comment = true,
      show_end_of_buffer = true,
      -- Custom palette or highlight overrides
      colors = {
        bg = "#282A36",
        fg = "#F8F8F2",
      },
    })
    vim.cmd.colorscheme("dracula")
  end,
}

return {
  "Mofiqul/dracula.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    local dracula = require("dracula")

    dracula.setup({
      theme = "dracula",
      transparent_bg = false,
      italic_comment = true,
      show_end_of_buffer = false, -- Clean bottom of buffer (hides ~ tildes)

      -- Custom Palette Adjustments & Visual Polish
      colors = {
        bg = "#282A36",
        fg = "#F8F8F2",
        selection = "#44475A",
        comment = "#6272A4",
        purple = "#BD93F9",
        cyan = "#8BE9FD",
        pink = "#FF79C6",
      },

      -- Custom Highlight Overrides for Modern Neovim UI
      overrides = function(colors)
        return {
          -- 1. Cleaner Window Dividers
          WinSeparator = { fg = "#44475A", bg = "NONE" },

          -- 2. Floating Windows & Popups (Telescope, LSP Float, Mason)
          NormalFloat = { bg = "#21222C" },
          FloatBorder = { fg = colors.purple, bg = "#21222C" },
          FloatTitle = { fg = colors.cyan, bg = "#21222C", bold = true },

          -- 3. Modern Cursor Line & Line Numbers
          CursorLine = { bg = "#2B2D3A" },
          CursorLineNr = { fg = colors.yellow, bold = true },
          LineNr = { fg = "#6272A4" },

          -- 4. Code Typography & Syntax Enhancements
          ["@keyword"] = { fg = colors.pink, italic = true },
          ["@keyword.function"] = { fg = colors.cyan, italic = true },
          ["@parameter"] = { fg = colors.orange, italic = true },
          ["@variable.builtin"] = { fg = colors.purple, italic = true },
          ["@type.builtin"] = { fg = colors.cyan, italic = true },

          -- 5. Visual Mode Selection Contrast
          Visual = { bg = "#44475A", bold = true },

          -- 6. Git Signs & Telescope Specific Polish
          TelescopeBorder = { fg = colors.purple, bg = "#21222C" },
          TelescopePromptBorder = { fg = colors.pink, bg = "#21222C" },
          TelescopePromptTitle = { fg = colors.pink, bg = "#21222C", bold = true },
        }
      end,
    })

    vim.cmd.colorscheme("dracula")
  end,
}

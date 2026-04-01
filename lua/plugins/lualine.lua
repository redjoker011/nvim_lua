-- ref:
-- - https://github.com/nvim-lualine/lualine.nvim
-- - https://github.com/idr4n/nvim-lua/blob/master/lua/plugins/lualine.lua
return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local lualine = require("lualine")

    -- Dracula-friendly palette
    local colors = {
      bg = "#282a36",
      fg = "#f8f8f2",
      purple = "#bd93f9",
      green = "#50fa7b",
      red = "#ff5555",
      yellow = "#f1fa8c",
      cyan = "#8be9fd",
      orange = "#ffb86c",
      pink = "#ff79c6",
      comment = "#6272a4",
    }

    -- Helpers
    local function has_width_gt(cols)
      return vim.fn.winwidth(0) > cols
    end

    local function get_lsp_client()
      local buf_ft = vim.bo.filetype
      local clients = vim.lsp.get_clients({ bufnr = 0 })

      if #clients == 0 then
        return "No LSP"
      end

      for _, client in ipairs(clients) do
        local ft = client.config.filetypes
        if ft and vim.tbl_contains(ft, buf_ft) then
          return client.name
        end
      end

      return "LSP"
    end

    -- Harpoon indicator (optional but useful with your setup)
    local function harpoon_component()
      local ok, mark = pcall(require, "harpoon.mark")
      if not ok then return "" end

      local total = mark.get_length()
      local current = mark.get_current_index()

      if current and total > 0 then
        return string.format("󰀱 %d/%d", current, total)
      end
      return ""
    end

    -- Macro recording indicator
    local function recording()
      local reg = vim.fn.reg_recording()
      if reg ~= "" then
        return " @" .. reg
      end
      return ""
    end

    lualine.setup({
      options = {
        theme = "dracula",
        globalstatus = true,
        component_separators = "",
        section_separators = "",
      },

      sections = {
        lualine_a = {
          {
            "mode",
            color = { fg = colors.bg, bg = colors.purple, gui = "bold" },
          },
        },

        lualine_b = {
          {
            "branch",
            icon = "",
          },
          {
            "diff",
            symbols = { added = " ", modified = "柳", removed = " " },
            cond = has_width_gt(80),
          },
        },

        lualine_c = {
          {
            "filename",
            path = 1,
          },
          {
            harpoon_component,
            cond = function()
              return harpoon_component() ~= ""
            end,
          },
        },

        lualine_x = {
          {
            recording,
            color = { fg = colors.red },
          },
          {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            symbols = { error = " ", warn = " ", info = " ", hint = " " },
          },
          {
            get_lsp_client,
            icon = "",
          },
          {
            "filetype",
            icon_only = true,
          },
        },

        lualine_y = {
          "progress",
        },

        lualine_z = {
          "location",
        },
      },

      inactive_sections = {
        lualine_c = { "filename" },
        lualine_x = {},
      },

      extensions = {
        "lazy",
        "mason",
        "trouble",
        "oil",
        "nvim-tree",
        "fzf",
      },
    })
  end,
}

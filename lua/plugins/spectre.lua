return {
  "nvim-pack/nvim-spectre",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  cmd = "Spectre",
  keys = {
    {
      "<leader>sr",
      function()
        require("spectre").open()
      end,
      desc = "Spectre: Search & Replace",
    },
    {
      "<leader>sw",
      function()
        require("spectre").open_visual({ select_word = true })
      end,
      mode = { "n", "v" },
      desc = "Spectre: Search current word",
    },
    {
      "<leader>sp",
      function()
        require("spectre").open_file_search()
      end,
      desc = "Spectre: Search in current file",
    },
  },
  config = function()
    require("spectre").setup({
      live_update = true,
      line_sep_start = "┌-----------------------------------------",
      result_padding = "¦  ",
      line_sep = "└-----------------------------------------",

      highlight = {
        ui = "String",
        search = "DiffChange",
        replace = "DiffDelete",
      },

      mapping = {
        ["toggle_line"] = {
          map = "dd",
          cmd = "<cmd>lua require('spectre').toggle_line()<CR>",
          desc = "Toggle current item",
        },
        ["replace_cmd"] = {
          map = "<leader>rc",
          cmd = "<cmd>lua require('spectre.actions').run_replace()<CR>",
          desc = "Replace all",
        },
        ["show_option_menu"] = {
          map = "<leader>o",
          cmd = "<cmd>lua require('spectre').open_options()<CR>",
          desc = "Options",
        },
        ["run_current_replace"] = {
          map = "<leader>R",
          cmd = "<cmd>lua require('spectre.actions').run_current_replace()<CR>",
          desc = "Replace current line",
        },
        ["send_to_qf"] = {
          map = "<leader>q",
          cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",
          desc = "Send to quickfix",
        },
      },
    })
  end,
}

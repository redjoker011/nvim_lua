 return {
    "nvim-telescope/telescope.nvim",
    lazy = true,
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        "<leader>sf",
        function() 
          require("telescope.builtin").find_files()
        end,
        desc = "Find Plugin File",
      },
      {
        "<leader><space>",
        function() 
          require("telescope.builtin").buffers()
        end,
        desc = "Find existing buffers",
      },
      {
        "<leader>sg",
        function() 
          require("telescope.builtin").live_grep()
        end,
        desc = "Search by Grep",
      },
      {
        "<leader>sw",
        function() 
          require("telescope.builtin").search_string()
        end,
        desc = "Search current Word",
      },
      {
        "<leader>sd",
        function() 
          require("telescope.builtin").diagnostics()
        end,
        desc = "Search Diagnostics",
      },
    },
    -- change some options
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--trim" -- add this value
        },
        mappings = {
          i = {
            ['<C-u>'] = false,
            ['<C-d>'] = false,
          },
        },
      },
    },
  }

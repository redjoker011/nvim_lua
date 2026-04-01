return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "olimorris/neotest-rspec",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/nvim-nio",
      "antoinemadec/FixCursorHold.nvim",
    },
    config = function()
      local neotest = require("neotest")

      neotest.setup({
        adapters = {
          require("neotest-rspec"),
        },

        -- optional but useful defaults
        discovery = {
          enabled = true,
        },

        running = {
          concurrent = true,
        },

        output = {
          open_on_run = true,
        },

        summary = {
          animated = true,
        },
      })

      vim.keymap.set("n", "<leader>ta", function()
        require("neotest").run.run(vim.loop.cwd())
      end, { desc = "Run all tests" })

      vim.keymap.set("n", "<leader>tf", function()
        neotest.run.run(vim.fn.expand("%"))
      end, { desc = "Run file tests" })

      -- Inside file
      vim.keymap.set("n", "<leader>tt", function()
        neotest.run.run()
      end, { desc = "Run nearest test" })

      vim.keymap.set("n", "<leader>ts", function()
        neotest.summary.toggle()
      end, { desc = "Toggle summary" })

      vim.keymap.set("n", "<leader>to", function()
        neotest.output.open({ enter = true })
      end, { desc = "Show output" })
    end,
  },
}

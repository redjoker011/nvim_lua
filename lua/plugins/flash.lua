return {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {
    modes = {
      search = { enabled = true },
      char = { enabled = true },
    },
  },
  config = function(_, opts)
    require("flash").setup(opts)

    -- Jump anywhere fast
    vim.keymap.set({ "n", "x", "o" }, "s", function()
      require("flash").jump()
    end, { desc = "Flash jump" })

    -- Treesitter-aware jump
    vim.keymap.set({ "n", "x", "o" }, "S", function()
      require("flash").treesitter()
    end, { desc = "Flash treesitter" })

    -- Remote (jump across windows)
    vim.keymap.set("o", "r", function()
      require("flash").remote()
    end, { desc = "Remote flash" })
  end,
}

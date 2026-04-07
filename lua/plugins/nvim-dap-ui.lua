return {
  "rcarriga/nvim-dap-ui",
  dependencies = { "mfussenegger/nvim-dap" },
  config = function()
    local dapui = require("dapui")
    dapui.setup()

    local function float(element)
      local width = math.floor(vim.o.columns * 0.85)
      local height = math.floor(vim.o.lines * 0.85 - 2) -- subtract cmdline/status space

      dapui.float_element(element, {
        width = width,
        height = height,
        position = "center",
      })
      vim.cmd("wincmd p")
    end

    vim.keymap.set("n", "<Leader>du", dapui.toggle)

    -- Zoom-specific panels
    vim.keymap.set("n", "<leader>dr", function()
      float("repl")
      vim.cmd("startinsert") -- go directly into insert mode
    end, { desc = "Zoom DAP REPL" })
  end,
}

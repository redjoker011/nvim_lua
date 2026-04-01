return {
  "rcarriga/nvim-dap-ui",
  dependencies = { "mfussenegger/nvim-dap" },
  config = function()
    local dapui = require("dapui")
    dapui.setup()

    vim.keymap.set("n", "<Leader>du", dapui.toggle)
  end,
}

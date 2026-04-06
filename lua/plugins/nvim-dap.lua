return {
  "mfussenegger/nvim-dap",
  config = function()
    local dap = require("dap")

    local function map(mode, lhs, rhs)
      vim.keymap.set(mode, lhs, rhs, { silent = true })
    end

    map("n", "<F5>", dap.continue)
    map("n", "<F10>", dap.step_over)
    map("n", "<F11>", dap.step_into)
    map("n", "<F12>", dap.step_out)
    map("n", "<Leader>b", dap.toggle_breakpoint)
    map("n", "<Leader>B", function()
      dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
    end)
  end,
}

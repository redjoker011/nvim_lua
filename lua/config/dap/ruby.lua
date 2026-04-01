local dap = require("dap")

dap.adapters.ruby = {
  type = "executable",
  command = "rdbg", -- make sure it's in PATH
  args = { "--open", "--port", "38698", "--command", "--" },
}

dap.configurations.ruby = {
  {
    type = "ruby",
    name = "Debug current file",
    request = "launch",
    program = "${file}",
    useBundler = true,
  },
  {
    type = "ruby",
    name = "Debug RSpec file",
    request = "launch",
    program = "bundle",
    programArgs = { "exec", "rspec", "${file}" },
    useBundler = true,
  },
}

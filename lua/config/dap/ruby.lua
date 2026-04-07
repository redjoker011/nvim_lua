local dap = require("dap")
local PORT = 38698

-- adapter
dap.adapters.ruby = function(callback, config)
  local cmd = { "bundle", "exec", "rdbg",
    "--open",
    "--host", "127.0.0.1",
    "--port", tostring(PORT),
    "-c",
    "--"
  }

  if config.program then
    table.insert(cmd, config.program)
  end

  if config.args then
    for _, v in ipairs(config.args) do
      table.insert(cmd, v)
    end
  end

  callback({
    type = "server",
    host = "127.0.0.1",
    port = PORT,
    executable = {
      command = cmd[1],
      args = vim.list_slice(cmd, 2),
    },
  })
end

-- configurations
dap.configurations.ruby = {
  -- 🌐 Rails server (BEST debugging workflow)
  {
    type = "ruby",
    command = "bundle",
    name = "Rails: server",
    request = "attach",
    localfs = true,
    args = { "bin/rails", "server" }
  }

  -- -- 📜 Plain Ruby script (non-Rails)
  -- {
  --   type = "ruby",
  --   name = "Ruby: current file",
  --   request = "attach",
  --   localfs = true,
  --   runtime_args = function()
  --     return { "ruby", vim.fn.expand("%") }
  --   end,
  -- },
}

local dap = require("dap")
local PORT = 38698

-- detect if project uses bundler
local function use_bundle()
  return vim.fn.filereadable("Gemfile") == 1
end

-- build command
local function build_cmd(config)
  if use_bundle() then
    return "bundle", {
      "exec", "rdbg",
      "--open",
      "--host", "127.0.0.1",
      "--port", tostring(PORT),
      "-c", "--",
      unpack(config.runtime_args or {})
    }
  else
    return "rdbg", {
      "--open",
      "--host", "127.0.0.1",
      "--port", tostring(PORT),
      "-c", "--",
      unpack(config.runtime_args or {})
    }
  end
end

-- adapter
dap.adapters.ruby = function(callback, config)
  local command, args = build_cmd(config)

  callback({
    type = "server",
    host = "127.0.0.1",
    port = PORT,
    executable = {
      command = command,
      args = args,
    },
  })
end

-- configurations
dap.configurations.ruby = {
  -- 🌐 Rails server (BEST debugging workflow)
  {
    type = "ruby",
    name = "Rails: server",
    request = "attach",
    localfs = true,
    runtime_args = function()
      return { "bin/rails", "server" }
    end,
  },

  -- 📜 Plain Ruby script (non-Rails)
  {
    type = "ruby",
    name = "Ruby: current file",
    request = "attach",
    localfs = true,
    runtime_args = function()
      return { "ruby", vim.fn.expand("%") }
    end,
  },
}

local M = {}

M.reload = function()
  local lua_path = vim.fn.stdpath("config") .. "/lua"

  -- Clear modules
  for name, _ in pairs(package.loaded) do
    if name:match("^config") or name:match("^plugins") then
      package.loaded[name] = nil
    end
  end

  -- Find all lua files under config/ and plugins/
  local files = vim.fn.glob(lua_path .. "/{config,plugins}/**/*.lua", true, true)

  for _, file in ipairs(files) do
    local module = file
        :gsub(lua_path .. "/", "")
        :gsub("%.lua$", "")
        :gsub("/", ".")

    -- require safely
    pcall(require, module)
  end

  -- Let lazy handle plugin state
  local ok, lazy = pcall(require, "lazy")
  if ok then
    pcall(lazy.reload)
  end

  vim.notify("Config reloaded (auto)", vim.log.levels.INFO)
end

return M

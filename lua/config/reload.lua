local M = {}

M.reload = function()
  local config_path = vim.env.MYVIMRC

  -- Clear user modules
  for name, _ in pairs(package.loaded) do
    if name:match("^config") or name:match("^plugins") or name:match("^user") then
      package.loaded[name] = nil
    end
  end

  -- Reload init.lua
  dofile(config_path)

  -- Reload Lazy safely via API (not vim.cmd)
  local ok, lazy = pcall(require, "lazy")
  if ok and lazy.reload then
    pcall(lazy.reload)
  end

  vim.notify("Reloaded config from: " .. config_path, vim.log.levels.INFO)
end

return M

local M = {}

--[[ Load NVIM Tree
  https://github.com/kyazdani42/nvim-tree.lua/issues/767#issuecomment-962637481
  Set window picker to false to avoid issues
--]]
function M.localsetup()
  require("nvim-tree").setup({
    sort_by = "case_sensitive",
    hijack_cursor = true,
    view = {
      width = 30,
      side = 'right',
    },
    actions = {
      open_file = {
        window_picker = {
          enable = false
        }
      }
    },
    renderer = {
      group_empty = true,
    },
    filters = {
      dotfiles = true,
    },
    diagnostics = {
      enable = true,
      show_on_dirs = true,
      show_on_open_dirs = true,
    },
  })
end

vim.keymap.set("n", "<Leader>v", ":NvimTreeToggle<CR>", { silent = true })

return M

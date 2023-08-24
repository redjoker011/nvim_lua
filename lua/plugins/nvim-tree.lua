local M = {}

--[[ Load NVIM Tree
  https://github.com/kyazdani42/nvim-tree.lua/issues/767#issuecomment-962637481
  Set window picker to false to avoid issues
--]]
function M.localsetup()
  require("nvim-tree").setup({
    sort_by = "case_sensitive",
    open_on_setup = true,
    view = {
      width = 30,
      side = 'right',
      mappings = {
        list = {
          { key = "u", action = "dir_up" },
          { key = "-", action = "cd" },
        },
      },
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
  })
end

vim.keymap.set("n", "<Leader>v", ":NvimTreeToggle<CR>", { silent = true })

return M

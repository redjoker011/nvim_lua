return { 
  "kyazdani42/nvim-tree.lua", 
  opts = { 
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
  }
}

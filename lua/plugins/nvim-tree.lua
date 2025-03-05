return {
  "kyazdani42/nvim-tree.lua",
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
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
    vim.keymap.set("n", "<Leader>v", ":NvimTreeToggle<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>t", ":NvimTreeFocus<CR>", { silent = true })
  end
}

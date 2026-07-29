return {
  "dlyongemallo/diffview-plus.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  cmd = {
    "DiffviewOpen",
    "DiffviewClose",
    "DiffviewToggleFiles",
    "DiffviewFocusFiles",
    "DiffviewRefresh",
    "DiffviewFileHistory",
  },
  keys = {
    { "<leader>gd", "<cmd>DiffviewOpen<cr>",          desc = "Open Diffview" },
    { "<leader>gq", "<cmd>DiffviewClose<cr>",         desc = "Close Diffview" },
    { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "Current File History" },
    { "<leader>gH", "<cmd>DiffviewFileHistory<cr>",   desc = "Branch File History" },
    { "<leader>gt", "<cmd>DiffviewToggleFiles<cr>",   desc = "Toggle File Panel" },
  },
  opts = {
    enhanced_diff_hl = true, -- Better syntax highlighting in diff splits
    use_icons = true,
    icons = {
      folder_closed = "",
      folder_open = "",
    },
    view = {
      default = {
        layout = "diff2_horizontal",
      },
      merge_tool = {
        layout = "diff3_horizontal",
        disable_diagnostics = true,
      },
      file_history = {
        layout = "diff2_horizontal",
      },
    },
    file_panel = {
      listing_style = "tree", -- "tree" or "list"
      tree_options = {
        flatten_dirs = true,
        folder_statuses = "only_used",
      },
      win_config = {
        position = "left",
        width = 35,
      },
    },
    keymaps = {
      disable_defaults = false,
      -- Custom mappings inside the Diffview panel buffers
      file_panel = {
        { "n", "j",    "<cmd>DiffviewNextFile<cr>",     { desc = "Select next file" } },
        { "n", "k",    "<cmd>DiffviewPrevFile<cr>",     { desc = "Select previous file" } },
        { "n", "<cr>", "<cmd>DiffviewFocusFiles<cr>",   { desc = "Focus file panel" } },
        { "n", "s",    "<cmd>DiffviewToggleStaged<cr>", { desc = "Stage / Unstage entry" } },
        { "n", "R",    "<cmd>DiffviewRefresh<cr>",      { desc = "Update stats and file list" } },
      },
      file_history_panel = {
        { "n", "gq", "<cmd>DiffviewClose<cr>", { desc = "Close history panel" } },
      },
    },
  },
}

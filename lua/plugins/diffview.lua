return {
  "sindrets/diffview.nvim",

  cmd = { "DiffviewOpen", "DiffviewFileHistory" },
  keys = {
    { "<leader>gd", "<cmd>DiffviewOpen<cr>",          desc = "Open Diffview" },
    { "<leader>gh", "<cmd>DiffviewFileHistory<cr>",   desc = "File History" },
    { "<leader>gH", "<cmd>DiffviewFileHistory %<cr>", desc = "Current File History" },
    { "<leader>gq", "<cmd>DiffviewClose<cr>",         desc = "Close Diffview" }
  },
  opts = {
    enhanced_diff_hl = true,
    use_icons = true,
  },
}

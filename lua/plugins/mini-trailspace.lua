return {
  "echasnovski/mini.trailspace",
  version = false,       -- always use the latest
  event = "BufReadPost", -- lazy-load when a buffer is opened
  config = function()
    local trailspace = require("mini.trailspace")
    trailspace.setup({ only_in_normal_buffers = true })

    -- Keymaps for quick trimming and highlighting
    vim.keymap.set("n", "<leader>tw", trailspace.trim, {
      desc = "Trim trailing whitespace",
    })

    vim.keymap.set("n", "<leader>tn", trailspace.trim_last_lines, {
      desc = "Trim trailing newlines at EOF",
    })

    -- vim.keymap.set("n", "<leader>th", trailspace.highlight, {
    --   desc = "Toggle highlight for trailing spaces",
    -- })

    -- Optional: auto-trim before saving
    vim.api.nvim_create_autocmd("BufWritePre", {
      callback = function()
        trailspace.trim()
        trailspace.trim_last_lines()
      end,
    })
  end,
}

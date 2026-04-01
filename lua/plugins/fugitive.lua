return {
  "tpope/vim-fugitive",
  cmd = {
    "Git", "G", "G commit", "G blame", "Gdiffsplit", "Gread", "Gwrite", "G push", "G pull"
  },
  keys = {
    { "<leader>gs", "<cmd>Git<CR>",                                             desc = "Git (run git command)",                           mode = "n" },
    { "<leader>gb", "<cmd>G blame<CR>",                                         desc = "Git blame (interactive split)",                   mode = "n" },
    { "<leader>gd", "<cmd>Gdiffsplit<CR>",                                      desc = "Git diff (vertical split)",                       mode = "n" },
    { "<leader>gc", "<cmd>Git commit<CR>",                                      desc = "Git commit",                                      mode = "n" },
    { "<leader>gp", "<cmd>Git push<CR>",                                        desc = "Git push",                                        mode = "n" },
    { "<leader>gP", "<cmd>Git pull<CR>",                                        desc = "Git pull",                                        mode = "n" },
    { "<leader>gr", "<cmd>Gread<CR>",                                           desc = "Revert buffer to HEAD (discard working changes)", mode = "n" },
    { "<leader>gw", "<cmd>Gwrite<CR>",                                          desc = "Stage current file (write to index)",             mode = "n" },
    { "<leader>gl", "<cmd>Git --no-pager log --oneline --graph --decorate<CR>", desc = "Git log (graph)",                                 mode = "n" },
  },
  config = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "fugitive", "fugitiveblame" },
      callback = function(event)
        local opts = { buffer = event.buf, silent = true }
        -- q to quit fugitive/blame buffers
        vim.keymap.set("n", "q", "<cmd>q<CR>", opts)
        -- Enter to open the commit / blob under the cursor (Gedit)
        vim.keymap.set("n", "<CR>", "<cmd><C-u>Gedit<CR>", vim.tbl_extend("force", opts, { desc = "Open commit/blob" }))
        -- Helpful: close blame and return to working buffer with gq (behaves like Fugitive's default)
        vim.keymap.set("n", "gq", "<cmd>Gedit<CR>", opts)
      end,
    })
  end,
}

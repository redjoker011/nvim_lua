return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    priority = 999,
    opts = {
      -- Non-LSP tools or binaries you want Mason to install automatically
      ensure_installed = {
        "gopls",
        "ts_ls",
        "lua-language-server",
      },
    },
  },
  {
    "williamboman/mason-nvim-dap.nvim",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    opts = {
      ensure_installed = { "ruby" },
      automatic_installation = true,
    },
  },
}

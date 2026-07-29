return {
  {
    "hrsh7th/cmp-nvim-lsp",
    lazy = false,
    priority = 1000,
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local servers = {
        gopls = {
          settings = {
            gopls = {
              analyses = { unusedparams = true },
              staticcheck = true,
            },
          },
        },

        ruby_lsp = {
          cmd = { "ruby-lsp" },
          init_options = {
            formatter = "auto",
            linters = { "auto" },
          },
        },

        ts_ls = {},

        lua_ls = {
          settings = {
            Lua = {
              runtime = { version = "LuaJIT" },
              diagnostics = { globals = { "vim" } },
              workspace = { checkThirdParty = false },
              telemetry = { enable = false },
            },
          },
        },
      }

      -- Apply global defaults
      vim.lsp.config("*", { capabilities = capabilities })

      -- Pass server options & enable
      for server_name, server_opts in pairs(servers) do
        vim.lsp.config(server_name, server_opts)
        vim.lsp.enable(server_name)
      end

      --  Only map Telescope overrides & formatting in LspAttach
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
        callback = function(event)
          local bufnr = event.buf
          local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = bufnr, desc = "LSP: " .. desc })
          end

          -- Optional Telescope overrides (if you prefer Telescope windows over quickfix)
          map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
          map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
          map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
        end,
      })
    end,
  },
}

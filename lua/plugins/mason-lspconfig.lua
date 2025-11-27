return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    priority = 999,
    opts = {
      -- Non-LSP tools go here if you want
      ensure_installed = {
        -- "stylua",
        -- "gofumpt",
      },
    },
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      local mason_lspconfig = require("mason-lspconfig")

      -- Shared on_attach for all servers
      local on_attach = function(_, bufnr)
        local nmap = function(keys, func, desc)
          vim.keymap.set("n", keys, func, {
            buffer = bufnr,
            desc = desc and ("LSP: " .. desc) or nil,
          })
        end

        -- Navigation
        nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
        nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
        nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
        nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
        nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")

        -- Symbols
        nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
        nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

        -- Actions
        nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
        nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

        -- Docs
        nmap("K", vim.lsp.buf.hover, "Hover Documentation")
        nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

        -- Workspace
        nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
        nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
        nmap("<leader>wl", function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, "[W]orkspace [L]ist Folders")

        -- Optional: format
        nmap("<leader>f", function()
          vim.lsp.buf.format { async = true }
        end, "[F]ormat buffer")
      end

      -- Completion capabilities (for nvim-cmp)
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Single source of truth for LSP servers and their settings
      local servers = {
        gopls = {
          settings = {
            gopls = {
              analyses = {
                unusedparams = true,
              },
              staticcheck = true,
            },
          },
        },

        solargraph = {
          -- Ruby settings later if needed
        },

        ts_ls = {
          -- Typescript settings / init_options later
        },

        lua_ls = {
          settings = {
            Lua = {
              runtime = {
                version = "LuaJIT",
              },
              diagnostics = {
                globals = { "vim" },
              },
              workspace = {
                checkThirdParty = false,
              },
              telemetry = {
                enable = false,
              },
            },
          },
        },
      }

      -- 1. Let Mason ensure the servers are installed
      mason_lspconfig.setup {
        ensure_installed = vim.tbl_keys(servers),
        automatic_installation = true,
      }

      -- 2. Global defaults for *all* servers using the new API
      vim.lsp.config("*", {
        on_attach = on_attach,
        capabilities = capabilities,
      })

      -- 3. Per-server overrides with vim.lsp.config(server_name, opts)
      for server_name, server_opts in pairs(servers) do
        -- server_opts can override on_attach/capabilities if you want later
        vim.lsp.config(server_name, server_opts)
      end

      -- 4. Optional: auto-enable all configured servers on LSP-capable buffers
      --    (Neovim 0.11 style)
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspAutoEnable", { clear = true }),
        callback = function(args)
          -- If a client is already attached, do nothing; otherwise we start as needed.
          -- You can also be explicit and do vim.lsp.enable() per ft if you prefer.
        end,
      })

      -- If you’d rather be explicit and not rely on autocmd magic, you can instead:
      --   vim.lsp.enable { name = "lua_ls", bufnr = 0 }
      -- etc. But most setups only need the configs; nvim will handle starting per root/ft.
    end,
  },
}

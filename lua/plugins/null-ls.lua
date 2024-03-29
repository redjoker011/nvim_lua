-- Use Null LS for formatting, linting and diagnostics must be delegated to LSP
-- NOTE: LSP and Plugins for formatting, diagnostics and linting if defined here should be explicitly installed in the system. Use :checkhealth to check the logs
local M = {}

local null_ls = require("null-ls")

local lSsources = {
  null_ls.builtins.formatting.prettier.with({
    filetypes = {
      "css",
      "scss",
      "html",
      "json",
      "yaml",
      "markdown",
      "graphql",
      "md",
      "txt",
    },
  }),
  null_ls.builtins.formatting.erb_format
}

local augroup = vim.api.nvim_create_augroup("NullLSFormatting", {})

function M.localsetup()
  require("null-ls").setup({
    sources = lSsources,
    on_attach = function(client, bufnr)
      if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = augroup,
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format({
              bufnr = bufnr,
              filter = function(client)
                return client.name == "null-ls"
              end,
            })
          end,
        })
      end
    end,
  })
end

return M

return {
  'nvimtools/none-ls.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local null_ls = require("null-ls")
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    null_ls.setup({
      sources = {
        null_ls.builtins.diagnostics.haml_lint,

        -- ESLint as formatter (Standard JS)
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.code_actions.eslint_d,
        null_ls.builtins.formatting.eslint_d,
      },

      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })

          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({
                bufnr = bufnr,
                async = false,
              })
            end,
          })
        end
      end,
    })
  end
}

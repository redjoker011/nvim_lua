return {
  -- 1. Core Treesitter Parser Manager
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    lazy = vim.fn.argc(-1) == 0,
    init = function()
      -- Automatically enable syntax highlighting and tree-sitter indents natively
      vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          pcall(vim.treesitter.start)
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
    config = function()
      local ts = require("nvim-treesitter")

      -- Initialize the plugin with your preferred custom path if required
      ts.setup({
        install_dir = vim.fn.expand("~/.local/share/nvim/lazy/nvim-treesitter/parser"),
      })

      -- Modern equivalent to 'ensure_installed' using the new main branch API
      local ensure_installed = {
        "bash", "css", "go", "html", "javascript", "json", "lua", "markdown",
        "markdown_inline", "query", "regex", "ruby", "scss", "sql", "typescript",
        "vim", "vimdoc", "yaml"
      }

      local installed = ts.get_installed()
      local to_install = vim.iter(ensure_installed):filter(function(p)
        return not vim.tbl_contains(installed, p)
      end):totable()

      if #to_install > 0 then
        ts.install(to_install)
      end
    end,
  },

  -- 2. Treesitter Textobjects (Configured independently on main branch)
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("nvim-treesitter-textobjects").setup({
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["aa"] = "@parameter.outer",
            ["ia"] = "@parameter.inner",
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ["]m"] = "@function.outer",
            ["]]"] = "@class.outer",
          },
          goto_next_end = {
            ["]M"] = "@function.outer",
            ["]["] = "@class.outer",
          },
          goto_previous_start = {
            ["[m"] = "@function.outer",
            ["[["] = "@class.outer",
          },
          goto_previous_end = {
            ["[M"] = "@function.outer",
            ["[]"] = "@class.outer",
          },
        },
      })
    end,
  },
}

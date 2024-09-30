return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects"
  },
  build = ":TSUpdate",
  lazy = vim.fn.argc(-1) == 0,
  init = function()
    require("nvim-treesitter.install").prefer_git = true
    require("nvim-treesitter.query_predicates")
  end,
  opts = function()
    local parser_path = "~/.local/share/nvim/lazy/nvim-treesitter/parser"
    vim.opt.runtimepath:prepend(parser_path)
    local treesitter = require 'nvim-treesitter.configs'

    treesitter.setup(
      {
        parser_install_dir = parser_path,
        ensure_installed = {
          "bash",
          "html",
          "javascript",
          "json",
          "lua",
          "markdown",
          "markdown_inline",
          "query",
          "regex",
          "typescript",
          "vim",
          "yaml",
          'go',
          'vim',
          'vimdoc',
          'ruby',
          'sql',
          'css',
          'scss'
        },
        highlight = { enable = true },
        indent = { enable = true, disable = { 'python', 'vimdoc' } },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = '<c-space>',
            node_incremental = '<c-space>',
            scope_incremental = '<c-s>',
            node_decremental = '<c-backspace>',
          },
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ['aa'] = '@parameter.outer',
              ['ia'] = '@parameter.inner',
              ['af'] = '@function.outer',
              ['if'] = '@function.inner',
              ['ac'] = '@class.outer',
              ['ic'] = '@class.inner',
            },
          },
          move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
              [']m'] = '@function.outer',
              [']]'] = '@class.outer',
            },
            goto_next_end = {
              [']M'] = '@function.outer',
              [']['] = '@class.outer',
            },
            goto_previous_start = {
              ['[m'] = '@function.outer',
              ['[['] = '@class.outer',
            },
            goto_previous_end = {
              ['[M'] = '@function.outer',
              ['[]'] = '@class.outer',
            },
          },
          swap = {
            enable = true,
            swap_next = {
              ['<leader>a'] = '@parameter.inner',
            },
            swap_previous = {
              ['<leader>A'] = '@parameter.inner',
            },
          },
        },
      })
  end
}

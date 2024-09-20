require("config.lazy")

-- [[ Setting options ]]
-- See `:help vim.o`

-- Global Config --

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Set colorscheme
vim.o.termguicolors = true

-- Set completeopt to have a better completion experience
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

-- Use relative numbering
vim.wo.relativenumber = true

-- Text Width and Color column
vim.o.textwidth = 120
vim.o.colorcolumn = "+1"

-- Number Width and Numbering
vim.wo.number = true
vim.wo.numberwidth = 5

-- Enable mouse in command line mode
vim.o.mouse = "c"

-- Enable spelling check
vim.o.spell = true

-- Enable folding
vim.o.foldlevel = 1
vim.o.foldenable = true
vim.o.foldmethod = 'expr'

-- Tabs for Ruby
vim.o.shiftwidth = 2
vim.o.softtabstop = -1 -- Use shiftwidth setting for sts
vim.o.tabstop = 2

-- Use expandtab and modeline to properly identify tabs on insert and edit
vim.o.expandtab = true
vim.o.modelines = true

vim.o.shiftround = true
vim.o.smartindent = true
vim.o.matchtime = 3

-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happenbefore plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ','
vim.g.maplocalleader = ','

-- Nvim Tree Config
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- Map jk to escape
vim.keymap.set('i', 'jk', '<esc>')
vim.keymap.set('i', '<esc>', '<nop>')

-- Enforce using j and k when moving
vim.keymap.set('n', '<Up>', function() print 'Use k' end)
vim.keymap.set('n', '<Left>', function() print 'Use h' end)
vim.keymap.set('n', '<Down>', function() print 'Use j' end)
vim.keymap.set('n', '<Right>', function() print 'Use l' end)

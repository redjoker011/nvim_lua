# Neovim Config made with Lua

![Preview](./doc_images/preview.png)

## Pre-requisites

- Neovim version > [v0.8.2](https://github.com/neovim/neovim/wiki/Installing-Neovim)
- [Rip Grep](https://github.com/BurntSushi/ripgrep)

## Installation

**Clone Repository and set as default nvim config**

`git clone git@github.com:redjoker011/nvim_lua.git ~/.config/nvim`

**Install Plugins using Lazy**
open neovim and run `:Lazy` command

## Plugins

### Package Mananger
- [lazy](https://github.com/folke/lazy.nvim)

### LSP, Linter, Parser and Auto Complete
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

### Git Tools
- [vim-fugitive](https://github.com/tpope/vim-fugitive)

### Theme and Status Line
- [dracula](https://github.com/maxmx03/dracula.nvim)
- [lualine](https://github.com/nvim-lualine/lualine.nvim)
- [gitsigns](https://github.com/lewis6991/gitsigns.nvim)

### Indentation, Comments and more
- [vim-surround](https://github.com/tpope/vim-surround)
- [auto-pairs](https://github.com/jiangmiao/auto-pairs)
- [indent-blankline](https://github.com/lukas-reineke/indent-blankline.nvim)
- [Comment](https://github.com/numToStr/Comment.nvim)

### Floating Buffer and Window control
- [telescopic](https://github.com/nvim-telescope/telescope.nvim)

### Tree Directory
- [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua)

## Key Bindings

### Leader Key 

- `,`
- `<Space\>`

### Common Key Bindings


**<Leader\>** means you have to either hit `,` bar or `Space`
 - global leader - `,`
 - local leader - `<Space>`

**<C-w-s\>** means you have to hit Ctrl followed by w and s

**<Leader\>sf**  means you have to hit the Leader key(Space | ,) followed by s and f

<br>


| Key Binding | Description 		   				|  Plugin 		       |
| ----------------- | ------------------------------------------------------- | ------------------------------ |
| <C-w-s\>          | Open new window in horizontal mode      		      |   		               |
| <C-w-v\>          | Open new window in vertical mode        		      |              		       |
| I                 | Insert Mode        				      |              		       |
| Esc	            | Exit Insert Mode        				      |                                |
| <Leader\>ev	    | Edit $VIMRC        				      |                                 |
| <Leader\>sv	    | Reload $VIMRC        				      |                                 |
| <Leader\>?        | Find recently opened files         		      |     Vim Telescope              |
| <Leader\><Space\> | View existing buffers              		      |     Vim Telescope              |
| <Leader\>sf       | Search File in directory           		      |     Vim Telescope              |
| <Leader\>sh       | Search Help tags                   		      |     Vim Telescope              |
| <Leader\>sg       | Search for word or regrexp using Grep in directory      |     Vim Telescope              |
| <Leader\>sd       | Search Diagnostics				      |     Vim Telescope              |
| gd                | Go To Definition		      	          |     LSP	                        |
| gr                | Go To References		      	          |     LSP	                        |
| gI                | Go To Implementation		      	      |     LSP	                        |
| <Leader\>D        | Type Definition		      	          |     LSP	                        |
| K                 | Hover Documentation		      	      |     LSP	                        |
| <Leader\>v        | Toggle Nvim Tree			      	              |     Nvim Tree	               |
| <C\>v             | Open file in vertical split		      	      |     Nvim Tree	               |
| <C\>x             | Open file in horizontal split		      	      |     Nvim Tree	    |

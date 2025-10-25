local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug 'blazkowolf/gruber-darker.nvim'
Plug 'Mofiqul/adwaita.nvim'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'stevearc/oil.nvim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'windwp/nvim-autopairs'
Plug 'folke/which-key.nvim'
Plug 'goolord/alpha-nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'numToStr/FTerm.nvim'
Plug 'nvim-lualine/lualine.nvim'

Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

vim.call('plug#end')

require("config.opt")
require("config.keybinds")
require("config.lspconfig")

require("plugin.cmp")
require("plugin.nvimtree")
require("plugin.oil")
require("plugin.colorizer")
require("plugin.alpha")
require("plugin.lualine")

require("nvim-autopairs").setup {}

-- vim.cmd.colorscheme('lunaperche')
-- vim.cmd.colorscheme('vim')
vim.cmd.colorscheme('adwaita')
-- vim.cmd.colorscheme('gruber-darker')

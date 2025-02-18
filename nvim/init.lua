-- neovim :)

local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug 'blazkowolf/gruber-darker.nvim'
Plug 'morhetz/gruvbox'
Plug 'uZer/pywal16.nvim'
Plug 'slugbyte/lackluster.nvim'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'stevearc/oil.nvim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'nvim-lualine/lualine.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'folke/which-key.nvim'
Plug 'goolord/alpha-nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'numToStr/FTerm.nvim'

Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

vim.call('plug#end')

require("config.opt")
require("config.keybinds")

require("plugin.cmp")
require("plugin.lualine")
require("plugin.nvimtree")

require("oil").setup()
require("nvim-autopairs").setup {}
require'alpha'.setup(require'alpha.themes.startify'.config)
require('cmp').setup({ name = 'buffer' })

vim.cmd.colorscheme("gruber-darker")
--vim.cmd.colorscheme("lackluster")

-- TODO: move lines up-down 
-- move selections up-down
-- autocmd stuff
-- resize windows ctrl+arrows

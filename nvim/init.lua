local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug 'Mofiqul/adwaita.nvim'
Plug 'p00f/alabaster.nvim'

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
-- Plug 'MeanderingProgrammer/render-markdown.nvim'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'neovim/nvim-lspconfig'

vim.call('plug#end')

require("config.opt")
require("config.keybinds")

vim.lsp.config('*', {
	require('cmp_nvim_lsp').default_capabilities()
})
require("config.lspconfig")

require("plugin.cmp")
require("plugin.nvimtree")
require("plugin.oil")
require("plugin.colorizer")
require("plugin.alpha")
-- require("plugin.lualine")

require("nvim-autopairs").setup {}
-- require("render-markdown").disable()

vim.cmd.colorscheme("lunaperche")


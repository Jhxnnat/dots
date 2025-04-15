-- neovim :)

local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug 'blazkowolf/gruber-darker.nvim'
Plug 'morhetz/gruvbox'
Plug 'uZer/pywal16.nvim'
Plug 'slugbyte/lackluster.nvim'
Plug 'sainnhe/gruvbox-material'

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

Plug 'ej-shafran/compile-mode.nvim'

vim.call('plug#end')

require("config.theme")
require("config.opt")
require("config.keybinds")

require("plugin.cmp")
require("plugin.lualine")
require("plugin.miniline")
require("plugin.nvimtree")
require("plugin.oil")
require("plugin.colorizer")

require("nvim-autopairs").setup {}
require'alpha'.setup(require'alpha.themes.startify'.config)
require('cmp').setup({ name = 'buffer' })

vim.g.gruvbox_material_background = "hard"
vim.g.gruvbox_material_foreground = "original"
vim.g.gruvbox_material_statusline_style = "original"
vim.cmd.colorscheme("gruvbox-material")

-- TODO: move lines up-down (insert mode)
-- move selections up-down

-- Neovide font resize
if vim.g.neovide then
    vim.keymap.set({ "n", "v" }, "<C-+>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>")
    vim.keymap.set({ "n", "v" }, "<C-->", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>")
    vim.keymap.set({ "n" , "v" }, "<C-0>", ":lua vim.g.neovide_scale_factor = 1<CR>")
end


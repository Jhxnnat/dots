-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

lvim.plugins = {
    {
        'sainnhe/gruvbox-material',
        lazy = false,
        priority = 1000,
        config = function()
            vim.g.gruvbox_material_foreground = "material"
            -- vim.g.gruvbox_material_background = "hard"
            vim.g.gruvbox_material_disable_italic_comment = 1
            vim.g.gruvbox_material_statusline_style = "original"
            vim.cmd.colorscheme('gruvbox-material')
        end
    },
    {
        'morhetz/gruvbox',
        config = function()
            -- vim.gruvbox_termcolors = 16
            vim.cmd.colorscheme("gruvbox")
        end
    },
    {
        "blazkowolf/gruber-darker.nvim",
    },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },
    {
        'norcalli/nvim-colorizer.lua'
    },
    {
        'xiyaowong/transparent.nvim'
    },
    {
        "rebelot/kanagawa.nvim"
    },
    {
        "ficcdaf/ashen.nvim"
    },
    {
        "zenbones-theme/zenbones.nvim",
        dependencies = "rktjmp/lush.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            -- vim.g.zenbones_compat = 1
            vim.g.zenbones_darken_comments = 45
            vim.cmd.colorscheme('zenbones')
        end
    },
    { 'datsfilipe/vesper.nvim' },
}

-- lvim.colorscheme = "ashen"
--lvim.colorscheme = "kanagawa"
-- lvim.colorscheme = "gruvbox-material"
-- lvim.colorscheme = "gruvbox"
-- lvim.colorscheme = "gruber-darker"
lvim.colorscheme = "zenburned"
-- lvim.colorscheme = "vesper"

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.relativenumber = true

lvim.builtin.breadcrumbs.active = false

-- StatusLine
-- lvim.builtin.lualine.style = "default"
-- lvim.builtin.lualine.options.theme = "gruvbox_dark"

--Some Key Remaps
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<C-p>', ':Telescope file_browser path=%:p:h select_buffer=true<CR>', opts)
-- swap I and H
vim.api.nvim_set_keymap('n', 'i', 'k', opts)
vim.api.nvim_set_keymap('n', 'k', 'j', opts)
vim.api.nvim_set_keymap('n', 'j', 'h', opts)
vim.api.nvim_set_keymap('n', 'h', 'i', opts)

vim.api.nvim_set_keymap('v', 'i', 'k', opts)
vim.api.nvim_set_keymap('v', 'k', 'j', opts)
vim.api.nvim_set_keymap('v', 'j', 'h', opts)
vim.api.nvim_set_keymap('v', 'h', 'i', opts)

-- exit insert mode with out ESC or C-c
vim.api.nvim_set_keymap('i', 'qq', '<ESC>', opts)

-- Error navigaion
vim.keymap.set('n', '<A-{>', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', '<A-}>', vim.diagnostic.goto_next, opts)

-- Split
lvim.keys.normal_mode["|"] = ":vsplit<CR>"
lvim.keys.normal_mode["-"] = ":split<CR>"

-- nvim colorizer
require('colorizer').setup()

lvim.builtin.bufferline.active = false

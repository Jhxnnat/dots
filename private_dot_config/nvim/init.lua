local options = {
	laststatus = 3,
    -- ruler = false, --disable extra numbering
    -- showmode = false, --not needed due to lualine
    -- showcmd = false,
    wrap = true, -- bound to leader-W
    mouse = "a", --enable mouse
    clipboard = "unnamedplus", -- system clipboard
    history = 100, --command line history
    swapfile = false, --swap just gets in the way, usually
    backup = false,
    undofile = true, --undos are saved to file
    cursorline = false,
    ttyfast = true, --faster scrolling
    smoothscroll = true,
    number = true, --numbering lines
    -- relativenumber = true, --toggle bound to leader nn
    numberwidth = 5,
    smarttab = true, --indentation stuff
    cindent = true,
    autoindent = false,
    tabstop = 4, --visual width of tab
	shiftwidth = 4,
    termguicolors = true,
    ignorecase = true, --ignore case while searching
    smartcase = true, --but do not ignore if caps are used
    splitkeep = 'screen', --stablizie window open/close
	signcolumn = "yes:1"
}
for k, v in pairs(options) do
	vim.opt[k] = v
end

local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'stevearc/oil.nvim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'windwp/nvim-autopairs'
Plug 'folke/which-key.nvim'
Plug 'goolord/alpha-nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'numToStr/FTerm.nvim'
Plug 'nvim-mini/mini.statusline'

Plug 'vala-lang/vala.vim'

Plug 'neovim/nvim-lspconfig'

vim.call('plug#end')

require("colorizer").setup({ "*" })
require("nvim-autopairs").setup {}

require("oil").setup({
	default_file_explorer = true,
	columns = { "icon", "permissions", "size", "mtime", },
	watch_for_changes = true,
	view_options = {
		show_hidden = true,
		natural_order = "fast",
		case_insensitive = false,
		sort = {
			{ "type", "asc" },
			{ "name", "asc" },
		},
	}
})

local alpha = require('alpha')
local dashboard = require("alpha.themes.dashboard")
dashboard.section.buttons.val = {
	dashboard.button("d", "  Dev dir", ":cd ~/Dev/<CR> :Oil<CR>"),
	dashboard.button("n", "󰯂  Notes", ":cd ~/Notes/<CR> :Oil<CR>"),
	dashboard.button("c", "  Config", ":cd ~/.config/nvim/<CR> :Oil<CR>"),
}
dashboard.section.buttons.opts.hl = "Keyword"
dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)

vim.cmd.colorscheme("lunaperche")
vim.cmd [[
	highlight Normal guibg=none
	highlight NonText guibg=none
	highlight Normal ctermbg=none
	highlight NonText ctermbg=none
	highlight LineNr guibg='#383838'
	highlight SignColumn guibg='#383838'
]]

local function map(m, k, v, d)
	vim.keymap.set(m, k, v, { desc = d, noremap = true, silent = true })
end
vim.api.nvim_set_keymap('i', 'qq', '<ESC>', { noremap = true, silent = true })

map("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local builtin = require('telescope.builtin')
map('n', '<leader>f', builtin.find_files, 'Telescope find files')
map('n', '<leader>sg', builtin.live_grep, 'Telescope live grep')
map('n', '<leader>sb', builtin.buffers, 'Telescope buffers')
map('n', '<leader>b', builtin.buffers, 'Telescope buffers')
map('n', '<leader>sh', builtin.help_tags, 'Telescope help tags')

map('n', '<leader>w', '<CMD>w<CR>', 'Save')
map('n', '<leader>q', '<CMD>q<CR>', 'Exit')


map('v', '>', '> gv', 'Indent keep selection')
map('v', '<', '< gv', 'Indent keep selection')

map('n', '|', ":vsplit<CR>", "split vertical")
map('n', '-', ":split<CR>", "split horizontal")

map('n', '<leader>e', '<CMD>Oil<CR>', "Oil")

map('n', '<A-j>', "<CMD>m .+1<CR>==", "move line down")
map('n', '<A-k>', "<CMD>m .-2<CR>==", "move line up")
map("v", '<A-j>', ":m '>+1<CR>gv=gv", "move selection up")
map("v", '<A-k>', ":m '<-2<CR>gv=gv", "move selection down")

map('n', '<leader>h', '<CMD>noh<CR>', 'disable hightlighting')

map('n', '<A-i>', '<CMD>lua require("FTerm").toggle()<CR>', 'toggle nonsenseTerm')
map('t', '<A-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', 'toggle nonsenseTerm')

map('n', '<leader>;', '<CMD>Alpha<CR>', 'Goto Alpha')

map("n", "<leader>x", "<cmd>!chmod +x %<CR>", "make a file executable")
map("n", "<leader>W", ":set wrap!<CR>", "toggle wrap")

map("n", "<leader>n", function()
	if vim.wo.relativenumber then
		vim.wo.relativenumber = false
		vim.wo.number = true
	else
		vim.wo.relativenumber = true
	end
end, 'toogle relative num')

map("n", "<C-down>", ":resize +2<CR>")
map("n", "<C-up>", ":resize -2<CR>")
map("n", "<C-left>", ":vertical resize -2<CR>")
map("n", "<C-right>", ":vertical resize +2<CR>")


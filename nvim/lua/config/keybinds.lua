-- mappings, including plugins
local function map(m, k, v, d)
	vim.keymap.set(m, k, v, { desc = d, noremap = true, silent = true })
end

local function nmap(m, k, v)
	vim.api.nvim_set_keymap(m, k, v, { noremap = true, silent = true })
end

-- set leader
map("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local builtin = require('telescope.builtin')
map('n', '<leader>f', builtin.find_files, 'Telescope find files')
map('n', '<leader>sg', builtin.live_grep, 'Telescope live grep')
map('n', '<leader>sb', builtin.buffers, 'Telescope buffers')
map('n', '<leader>b', builtin.buffers, 'Telescope buffers')
map('n', '<leader>sh', builtin.help_tags, 'Telescope help tags')

-- swap I and H
nmap('n', 'i', 'k')
nmap('n', 'k', 'j')
nmap('n', 'j', 'h')
nmap('n', 'h', 'i')

nmap('v', 'i', 'k')
nmap('v', 'k', 'j')
nmap('v', 'j', 'h')
nmap('v', 'h', 'i')

-- save exit
map('n', '<leader>w', '<CMD>w<CR>', 'Save')
map('n', '<leader>q', '<CMD>q<CR>', 'Exit')

-- exit insert mode with out ESC or C-c 
nmap('i', 'qq', '<ESC>')

-- Error navigaion
-- vim.keymap.set('n', '<A-{>', vim.diagnostic.goto_prev, opts)
-- vim.keymap.set('n', '<A-}>', vim.diagnostic.goto_next, opts)

-- Indent and keep visual selection
map('v', '>', '> gv', 'Indent keep selection')
map('v', '<', '< gv', 'Indent keep selection')

-- Split
map('n', '|', ":vsplit<CR>", "split vertical")
map('n', '-', ":split<CR>", "split horizontal")

-- NavigateSplit
map('n', '<c-k>', ":wincmd k<CR>", 'move to window up')
map('n', '<c-j>', ":wincmd j<CR>", 'move to window down')
map('n', '<c-h>', ":wincmd h<CR>", 'move to window left')
map('n', '<c-l>', ":wincmd l<CR>", 'move to window right')

-- Oil
map('n', '<leader>e', '<CMD>Oil<CR>', "Oil")
map('n', '<leader>E', '<CMD>NvimTreeToggle<CR>', "File Tree")

-- Moving Line  
map('n', '<a-k>', "<CMD>m .-2<CR>==", "move line up")
map('n', '<a-j>', "<CMD>m .+1<CR>==", "move line down")

-- noh
map('n', '<leader>h', '<CMD>noh<CR>', 'disable hightlinting')

-- NonsenseTerminal
map('n', '<A-i>', '<CMD>lua require("FTerm").toggle()<CR>', 'toggle nonsenseTerm')
map('t', '<A-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', 'toggle nonsenseTerm')

-- Alpha
map('n', '<leader>;', '<CMD>Alpha<CR>', 'Goto Alpha')

-- misc
map("n", "<leader>t", switch_theme, "switch themes")
map("n", "<leader>P", ":PlugInstall<CR>", "vim-plug")
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



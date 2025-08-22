-- neovim :)

-- OPTIONS --
local options = {
	laststatus = 3,
    -- ruler = false,
    showmode = true,
    showcmd = false,
    wrap = false, --toggle bound to leader W
    mouse = "a", --enable mouse
    clipboard = "unnamedplus", --system clipboard integration
    history = 100, --command line history
    swapfile = false, --swap just gets in the way, usually
    backup = false,
    undofile = true, --undos are saved to file
    cursorline = true, --highlight line
    ttyfast = true, --faster scrolling
    smoothscroll = true,
	
    number = true, --numbering lines
    relativenumber = true, --toggle bound to leader nn
    numberwidth = 4,

    smarttab = true, --indentation stuff
    cindent = true,
    autoindent = false,
    tabstop = 4, --visual width of tab
	shiftwidth = 4,

    -- foldmethod = "expr",
    -- foldlevel = 99, --disable folding, lower #s enable
    -- foldexpr = "nvim_treesitter#foldexpr()",
	
    termguicolors = true,

    ignorecase = true, --ignore case while searching
    smartcase = true, --but do not ignore if caps are used

    splitkeep = 'screen', --stablizie window open/close
	-- guicursor = "n-v-i-c:block-Cursor"
}

for k, v in pairs(options) do
	vim.opt[k] = v
end


-- KEYBINDS --
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

-- save exit
map('n', '<leader>w', '<CMD>w<CR>', 'Save')
map('n', '<leader>q', '<CMD>q<CR>', 'Exit')

-- exit insert mode with out ESC or C-c 
nmap('i', 'qq', '<ESC>')

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

-- Moving Lines
map('n', '<A-j>', "<CMD>m .+1<CR>==", "move line down")
map('n', '<A-k>', "<CMD>m .-2<CR>==", "move line up")
map("v", '<A-j>', ":m '>+1<CR>gv=gv", "move selection up")
map("v", '<A-k>', ":m '<-2<CR>gv=gv", "move selection down")

-- noh
map('n', '<leader>h', '<CMD>noh<CR>', 'disable hightlinting')

-- Misc
map("n", "<leader>x", "<cmd>!chmod +x %<CR>", "make a file executable")
map("n", "<leader>W", ":set wrap!<CR>", "toggle wrap")

-- Tootle relativenumber
map("n", "<leader>n", function()
	if vim.wo.relativenumber then
		vim.wo.relativenumber = false
		vim.wo.number = true
	else
		vim.wo.relativenumber = true
	end
end, 'toogle relative num')

-- Resize splits
map("n", "<C-down>", ":resize +2<CR>")
map("n", "<C-up>", ":resize -2<CR>")
map("n", "<C-left>", ":vertical resize -2<CR>")
map("n", "<C-right>", ":vertical resize +2<CR>")

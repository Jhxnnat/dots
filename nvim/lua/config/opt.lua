local options = {
	laststatus = 3,
    -- ruler = false, --disable extra numbering
    -- showmode = false, --not needed due to bufferline
    showcmd = false,
    wrap = false, --toggle bound to leader W
    mouse = "a", --enable mouse
    clipboard = "unnamedplus", --system clipboard integration
    history = 100, --command line history
    swapfile = false, --swap just gets in the way, usually
    backup = false,
    undofile = true, --undos are saved to file
    cursorline = false,
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
	
    termguicolors = true,

    ignorecase = true, --ignore case while searching
    smartcase = true, --but do not ignore if caps are used

    splitkeep = 'screen', --stablizie window open/close
	-- guicursor = "n-v-i-c:block-Cursor"
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

-- vim.diagnostic.config({
-- 	signs = false,
-- })

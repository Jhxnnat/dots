local themes = { --add more themes here, if installed
	{ "gruber-darker", "gruber-darker" },
	{ "pywal16", "pywal16-nvim" },
}

local current_theme_index = 1

_G.switch_theme = function()
	current_theme_index = current_theme_index % #themes + 1
	local colorscheme, lualine = unpack(themes[current_theme_index])
	vim.cmd("colorscheme " .. colorscheme)
	--require("lualine").setup({ options = { theme = lualine } })
end

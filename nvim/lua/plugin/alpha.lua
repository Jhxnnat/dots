local alpha = require('alpha')
local dashboard = require("alpha.themes.dashboard")
-- dashboard.section.header.val = {
--
--
-- 	[[  ^  ^  ^   ^☆ ★ ☆ ___I_☆ ★ ☆ ^  ^   ^  ^  ^   ^  ^ ]],
-- 	[[ /|\/|\/|\ /|\ ★☆ /\-_--\ ☆ ★/|\/|\ /|\/|\/|\ /|\/|\ ]],
-- 	[[ /|\/|\/|\ /|\ ★ /  \_-__\☆ ★/|\/|\ /|\/|\/|\ /|\/|\ ]],
-- 	[[ /|\/|\/|\ /|\ 󰻀 |[]| [] | 󰻀 /|\/|\ /|\/|\/|\ /|\/|\ ]],
-- }

dashboard.section.buttons.val = {
	dashboard.button("d", "  Dev dir", ":cd ~/Dev/<CR> :Oil<CR>"),
	dashboard.button("n", "󰯂  Notes", ":cd ~/Dev/notes/<CR> :Oil<CR>"),
	dashboard.button("c", "  Config", ":cd ~/.config/nvim/<CR> :Oil<CR>"),
	dashboard.button("p", "  Plugins", ":PlugInstall<CR>"),
	dashboard.button("q", "󰅙  Quit", ":q!<CR>"),
}

dashboard.section.buttons.opts.hl = "Keyword"
dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)

local lualine = require("lualine")

local function neovimlogo()
	return [[ ]]
end

lualine.setup {
    options = {
        theme = 'auto',
        section_separators = { left = '', component_separators = '' },
        refresh = {
              statusline = 50,
        }
    },
	sections = {
	    lualine_a = { neovimlogo, 'mode'},
	    lualine_b = {'branch'},
	    lualine_c = {'filename'},
	    lualine_x = {'encoding'},
	    lualine_y = {'selectioncount', 'searchcount', 'progress'},
	    lualine_z = {'location'}
	}
}

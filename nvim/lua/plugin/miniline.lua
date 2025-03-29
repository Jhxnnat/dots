local lualine = require("lualine")

local mode_map = {
  ['NORMAL'] = 'N',
  ['O-PENDING'] = 'N?',
  ['INSERT'] = 'I',
  ['VISUAL'] = 'V',
  ['V-BLOCK'] = 'VB',
  ['V-LINE'] = 'VL',
  ['V-REPLACE'] = 'VR',
  ['REPLACE'] = 'R',
  ['COMMAND'] = '!',
  ['SHELL'] = 'SH',
  ['TERMINAL'] = 'T',
  ['EX'] = 'X',
  ['S-BLOCK'] = 'SB',
  ['S-LINE'] = 'SL',
  ['SELECT'] = 'S',
  ['CONFIRM'] = 'Y?',
  ['MORE'] = 'M',
}

lualine.setup {
    options = {
        theme = 'auto',
        section_separators = { left = '', component_separators = '' },
        refresh = {
              statusline = 50,
        }
    },
	sections = {
		lualine_a = { {'mode', fmt = function(s) return mode_map[s] or s end} },
	    lualine_b = {'branch'},
	    lualine_c = {'filename'},
	    lualine_x = {'encoding'},
	    lualine_y = {'selectioncount', 'searchcount', 'progress'},
	    lualine_z = {'location'}
	}
}

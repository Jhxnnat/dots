local colors_name = "minbones"
vim.g.colors_name = colors_name -- Required when defining a colorscheme

local lush = require "lush"
local hsluv = lush.hsluv -- Human-friendly hsl
local util = require "zenbones.util"

local bg = vim.o.background

local palette
palette = util.palette_extend({
	bg = hsluv "#f2ecbc",
}, bg)

-- Generate the lush specs using the generator util
local generator = require "zenbones.specs"
local base_specs = generator.generate(palette, bg, generator.get_global_config(colors_name, bg))

-- Optionally extend specs using Lush
local specs = lush.extends({ base_specs }).with(function()
	return {
		Statement { base_specs.Statement, fg = palette.rose },
		Function { fg = palette.fg, gui = "bold" },
		Special { fg = palette.water, gui = "italic" },
		Type { fg = palette.sky, gui = "bold" },
		Whitespace { bg = Statement.fg },
	}
end)

-- Pass the specs to lush to apply
lush(specs)

-- Optionally set term colors
-- require("zenbones.term").apply_colors(palette)

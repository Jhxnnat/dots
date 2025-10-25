-- local _capabilities = require('cmp_nvim_lsp').default_capabilities()

return {
	cmd = { "rust-analyzer" },
	-- server = {
	-- 	capabilities = _capabilities,
	-- },
	filetypes = { "rust" },
	settings = {
	  ["rust-analyzer"] = {
		  diagnostics = {
			  enable = true,
		  }
	  }
	},
}



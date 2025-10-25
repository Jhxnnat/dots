vim.lsp.config('rust_analyzer', {
	filetypes = { 'rust' }
})

vim.lsp.enable('rust_analyzer')
vim.diagnostic.config({ virtual_text = true })

vim.lsp.config('rust_analyzer', {
	filetypes = {'rust'},
})

vim.lsp.config('pyright', {
	filetypes = {'python'}
})

vim.lsp.enable('rust_analyzer')
vim.lsp.enable('pyright')
vim.diagnostic.config({ virtual_text = true })

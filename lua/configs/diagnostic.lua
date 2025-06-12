vim.diagnostic.config({
	virtual_text = true,
	virtual_lines = false,
	update_in_insert = true,
	severity_sort = true,
	float = {
		title = "Diagnostics",
		header = {},
		border = "rounded",
	}
})
vim.keymap.set('n', '<leader>ve', function()
		vim.diagnostic.open_float()
end)

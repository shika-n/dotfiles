-- Move between splits
vim.keymap.set("n", "<C-Up>", "<cmd>wincmd k<cr>")
vim.keymap.set("n", "<C-Left>", "<cmd>wincmd h<cr>")
vim.keymap.set("n", "<C-Down>", "<cmd>wincmd j<cr>")
vim.keymap.set("n", "<C-Right>", "<cmd>wincmd l<cr>")

-- Quotes & brackets
vim.keymap.set("i", "'<Tab>", "''<Left>")
vim.keymap.set("i", '"<Tab>', '""<Left>')
vim.keymap.set("i", "(<Tab>", "()<Left>")
vim.keymap.set("i", "{<Tab>", "{}<Left>")
vim.keymap.set("i", "[<Tab>", "[]<Left>")
vim.keymap.set("i", "(<Cr>", "(<Cr>)<Esc>O")
vim.keymap.set("i", "{<Cr>", "{<Cr>}<Esc>O")
vim.keymap.set("i", "[<Cr>", "[<Cr>]<Esc>O")

-- Terminal
vim.keymap.set("t", "<C-q>", "<C-\\><C-n>")

-- LSP check
vim.keymap.set("n", "<leader>h", function()
	local filetype = vim.bo.filetype
	local language = vim.treesitter.language.get_lang(filetype)
	local highlight_started = false
	if vim.treesitter.highlighter.active[vim.api.nvim_get_current_buf()] then
		highlight_started = true
	end

	print("Type: ", filetype, ", Language: ", language, ", Highlight: ", highlight_started)
end)

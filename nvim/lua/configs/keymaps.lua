-- Move between splits
vim.keymap.set('n', "<C-Up>", "<cmd>wincmd k<cr>")
vim.keymap.set('n', "<C-Left>", "<cmd>wincmd h<cr>")
vim.keymap.set('n', "<C-Down>", "<cmd>wincmd j<cr>")
vim.keymap.set('n', "<C-Right>", "<cmd>wincmd l<cr>")

-- Quotes & brackets
vim.keymap.set('i', "\'<Tab>", "\'\'<Left>")
vim.keymap.set('i', "\"<Tab>", "\"\"<Left>")
vim.keymap.set('i', "(<Tab>", "()<Left>")
vim.keymap.set('i', "{<Tab>", "{}<Left>")
vim.keymap.set('i', "[<Tab>", "[]<Left>")
vim.keymap.set('i', "(<Cr>", "(<Cr>)<Esc>O")
vim.keymap.set('i', "{<Cr>", "{<Cr>}<Esc>O")
vim.keymap.set('i', "[<Cr>", "[<Cr>]<Esc>O")

-- Terminal
vim.keymap.set('t', "<Esc>", "<C-\\><C-n>")

-- LSP check
vim.keymap.set('n', "<leader>h", function()
	local filetype = vim.bo.filetype
	local language = vim.treesitter.language.get_lang(filetype)
	local highlight_started = false
	if vim.treesitter.highlighter.active[vim.api.nvim_get_current_buf()] then
		highlight_started = true
	end

	print(
		"Type: ", filetype,
		", Language: ", language,
		", Highlight: ", highlight_started
	)
end)

-- Neotree
vim.keymap.set('n', "\\", "<cmd>Neotree toggle reveal<cr>")

-- Telescope
local telescope = require("telescope.builtin")
vim.keymap.set('n', "<leader>ff", telescope.find_files, {
	desc = "Telescope find files"
})
vim.keymap.set('n', "<leader>fg", telescope.live_grep, {
	desc = "Telescope live grep"
})
vim.keymap.set('n', "<leader>fb", telescope.buffers, {
	desc = "Telescope buffers"
})
vim.keymap.set('n', "<leader>fh", telescope.help_tags, {
	desc = "Telescope help tags"
})
vim.keymap.set('n', "<leader>fr", telescope.resume, {
	desc = "Telescope last search"
})

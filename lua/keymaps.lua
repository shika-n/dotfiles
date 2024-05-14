vim.keymap.set('i', '<C-s>', '<cmd>w<cr>')
vim.keymap.set('i', '<C-w>', '<cmd>q<cr>')

vim.keymap.set('i', '<C-z>', '<cmd>norm u<cr>')
vim.keymap.set('i', '<C-y>', '<cmd>norm <C-r><cr>')

vim.keymap.set('i', '<A-J>', '<cmd>norm yyp<cr>')
vim.keymap.set('i', '<A-K>', '<cmd>norm yyP<cr>')
vim.keymap.set('i', '<A-Down>', '<cmd>norm <S-v>xp<cr>')
vim.keymap.set('i', '<A-Up>', '<cmd>norm <S-v>xkkp<cr>')

vim.keymap.set('n', '<C-Up>', '<cmd>wincmd k<cr>')
vim.keymap.set('n', '<C-Left>', '<cmd>wincmd h<cr>')
vim.keymap.set('n', '<C-Down>', '<cmd>wincmd j<cr>')
vim.keymap.set('n', '<C-Right>', '<cmd>wincmd l<cr>')

vim.keymap.set('n', '/', '<cmd>Neotree reveal_force_cwd<cr>')

vim.keymap.set('i', '\'', '\'\'<Left>')
vim.keymap.set('i', '\"', '\"\"<Left>')
vim.keymap.set('i', '(', '()<Left>')
vim.keymap.set('i', '{', '{}<Left>')
vim.keymap.set('i', '[', '[]<Left>')

vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

local comments_leadings = {
	["lua"] = "--",
	["c"] = "//",
	["cpp"] = "//",
	["java"] = "//",
	["html"] = "<!--",
}

vim.keymap.set('n', '<C-_>',
	function()
		local comments_lead = comments_leadings[vim.bo.filetype]
		local current_line = string.gsub(vim.api.nvim_get_current_line(), "%s+", "")


		print(i .. " " .. length)
	end
)

vim.keymap.set('n', '<F5>',
	function()
		print(vim.api.nvim_buf_get_name(0))
	end
)

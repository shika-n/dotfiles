vim.keymap.set('i', '<C-s>', '<cmd>w<cr>')
vim.keymap.set('i', '<C-w>', '<cmd>q<cr>')

vim.keymap.set('i', '<C-z>', '<cmd>norm u<cr>')
vim.keymap.set('i', '<C-y>', '<cmd>norm <C-r><cr>')

vim.keymap.set('i', '<A-S-Down>', '<cmd>norm yyp<cr>')
vim.keymap.set('i', '<A-S-Up>', '<cmd>norm yyP<cr>')
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

vim.keymap.set('i', '<C-k>',
	function()
		local file_type = vim.bo.filetype

		if file_type == "lua" then
			vim.cmd("norm ^i-- ")
		end
	end
)

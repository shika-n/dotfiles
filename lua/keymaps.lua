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


-- vim.keymap.set('i', ')', 
-- 	function()
-- 		vim.api.nvim_feedkeys(")", false)
-- 	end
-- )

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

local pairs = {
	["("] = ")",
	["{"] = "}",
	["["] = "]",
	[">"] = "<",
}
local keys = {
	["<Up>"] = vim.api.nvim_replace_termcodes("<Up>", true, false, true),
	["<Backspace>"] = vim.api.nvim_replace_termcodes("<Backspace>", true, false, true),
	["<End>"] = vim.api.nvim_replace_termcodes("<End>", true, false, true),
}
vim.keymap.set('i', '<cr>',
	function()
		local cursor = vim.api.nvim_win_get_cursor(0)
		local line = vim.api.nvim_get_current_line()
		local char = {line:sub(cursor[2], cursor[2]), line:sub(cursor[2] + 1, cursor[2] + 1)}
		 
		if pairs[char[1]] == char[2] then
			vim.api.nvim_feedkeys("\n|\n" .. keys["<Up>"] .. keys["<End>"] .. keys["<Backspace>"] .. "\t", "i", false)
		else
			vim.api.nvim_feedkeys("\n", "i", false)
		end
	end
)

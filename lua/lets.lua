vim.g.mapleader = ","


index = string.find(vim.env.MYVIMRC, "/[^(/)]*$")
win_index = string.find(vim.env.MYVIMRC, "(\\)[^(\\)]*$")

if unix_index == nil then
	index = win_index
end
vim.env.VIMCONFIGSPATH = string.sub(vim.env.MYVIMRC, 0, index) .. "lua/configs.lua"

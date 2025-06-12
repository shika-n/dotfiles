local telescope = require("telescope.builtin")

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
vim.keymap.set('n', '\\', '<cmd>Neotree toggle<cr>')

vim.keymap.set('i', '\'<Tab>', '\'\'<Left>')
vim.keymap.set('i', '\"<Tab>', '\"\"<Left>')
vim.keymap.set('i', '(<Tab>', '()<Left>')
vim.keymap.set('i', '{<Tab>', '{}<Left>')
vim.keymap.set('i', '[<Tab>', '[]<Left>')
vim.keymap.set('i', '(<Cr>', '(<Cr>)<Esc>O')
vim.keymap.set('i', '{<Cr>', '{<Cr>}<Esc>O')
vim.keymap.set('i', '[<Cr>', '[<Cr>]<Esc>O')

vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

vim.keymap.set('n', '<leader>ff', telescope.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', telescope.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', telescope.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', telescope.help_tags, { desc = 'Telescope help tags' })

vim.keymap.set('n', '<leader>dw', function() vim.diagnostic.open_float() end)
-- local ls = require("luasnip")
-- 
-- vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
-- vim.keymap.set({"i", "s"}, "<Tab>", function() ls.jump( 1) end, {silent = true})
-- vim.keymap.set({"i", "s"}, "<S-Tab>", function() ls.jump(-1) end, {silent = true})
-- 
-- vim.keymap.set({"i", "s"}, "<C-E>", function()
-- 	if ls.choice_active() then
-- 		ls.change_choice(1)
-- 	end
-- end, {silent = true})


-- vim.keymap.set('i', ')', 
-- 	function()
-- 		vim.api.nvim_feedkeys(")", false)
-- 	end
-- )

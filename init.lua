local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    { "nvim-neo-tree/neo-tree.nvim",
    	branch = "v3.x",
	dependencies = {
	    "nvim-lua/plenary.nvim",
	    "nvim-tree/nvim-web-devicons",
	    "MunifTanjim/nui.nvim"
	}
    }
})

vim.cmd.colorscheme "catppuccin-mocha"

-- let
vim.g.mapleader = ","

-- set
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.number = true

-- shortcuts
--vim.keymap.set('n', '<C-s>', '<cmd>w<cr>')
--vim.keymap.set('n', '<C-w>', '<cmd>q<cr>')

vim.keymap.set('n', '<C-Up>', '<cmd>wincmd k<cr>')
vim.keymap.set('n', '<C-Left>', '<cmd>wincmd h<cr>')
vim.keymap.set('n', '<C-Down>', '<cmd>wincmd j<cr>')
vim.keymap.set('n', '<C-Right>', '<cmd>wincmd l<cr>')

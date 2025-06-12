require("configs.lazy")
require("configs.diagnostic")
require("configs.keymaps")
require("configs.opts")

vim.lsp.config('*', {
	root_markers = { ".git" },
})

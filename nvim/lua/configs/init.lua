require("configs.lazy")
require("configs.diagnostic")
require("configs.keymaps")
require("configs.opts")
require("configs.custom_hl")

vim.lsp.config("*", {
	root_markers = { ".git" },
})

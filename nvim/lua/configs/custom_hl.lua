local function override_hl(hl_group_name, opts)
	local current_opts = vim.api.nvim_get_hl(0, {
		name = hl_group_name,
		link = false,
	})

	local overridden_opts = vim.tbl_extend("force", current_opts, opts)

	vim.api.nvim_set_hl(0, hl_group_name, overridden_opts)
end

override_hl("CursorLineNr", {
	fg = "#f7ff99",
	bold = true,
})
override_hl("LineNr", {
	fg = "#a3aecc",
})

override_hl("ColorColumn", {
	bg = "none",
	ctermbg = "none",
	underdotted = true,
})

override_hl("NormalFloat", {
	bg = "none",
	ctermbg = "none",
})
override_hl("FloatBorder", {
	bg = "none",
	ctermbg = "none",
})
override_hl("FloatTitle", {
	bg = "none",
	ctermbg = "none",
})

override_hl("GitSignsCurrentLineBlame", {
	fg = "#858fac",
	italic = true,
})

override_hl("NeoTreeFileStats", {
	fg = "#858fac",
})

if vim.fn.has("win32") == 1 then
	-- slangd uses CreateProcess which doesn't use PATHEXT to run mason's .cmd
	-- files. Giving the full path to mason's slang .cmd file also doesn't work
	-- since if clangFormatLocation contains path separator, slang will check if
	-- the ending contains .exe. If not, it will append .exe so we ended up
	-- with /mason/bin/clang-format.cmd.exe as the final path. Fortunately,
	-- giving the name without path works since it's treated differently by
	-- slang.
	return {
		settings = {
			slang = {
				format = {
					clangFormatLocation = "clang-format.cmd",
				},
			},
		},
	}
end

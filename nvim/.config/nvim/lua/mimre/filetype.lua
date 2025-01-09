vim.filetype.add({
	pattern = {
		[".*/nvim/queries/.*%.scm"] = { "scheme", { priority = math.huge } },
	},
})

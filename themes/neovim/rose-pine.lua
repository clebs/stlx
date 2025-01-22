require("rose-pine").setup({
	variant = 'moon',

	styles = {
		transparency = true,
	},
	highlight_groups = {
		Visual = { bg = "foam" },
		-- VertSplit = { fg = "muted", bg = "muted" },
	},
})
vim.cmd.colorscheme("rose-pine")

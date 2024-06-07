local cmd = vim.cmd

-- Transparent BG
-- Focused pane/window
cmd('autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE')
-- All other panes and overlays
cmd('autocmd ColorScheme * highlight NormalNC ctermbg=NONE guibg=NONE')
cmd('autocmd ColorScheme * highlight NormalSB ctermbg=NONE guibg=NONE')

require("tokyonight").setup({
	style = "moon",             -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
	transparent = true,         -- Enable this to disable setting the background color
	terminal_colors = true,     -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
	styles = {
		sidebars = "transparent", -- style for floating windows
		floats = "transparent",   -- style for floating windows
	},
	sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
})

cmd.colorscheme("tokyonight-moon")

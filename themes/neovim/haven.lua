local M = {}

M.config = {
	transparent = false,
}

M.setup = function(opts)
	opts = opts or {}
	M.config = vim.tbl_deep_extend('force', M.config, opts)

	-- vars and funcs
	local hl = vim.api.nvim_set_hl
	local transparent = M.config.transparent

	-- Background helper for transparency
	-- Sets either the given color or transparent based on config.
	local setTransparent = function(color)
		return transparent and 'NONE' or color
	end

	-- Linen & Fern palette (light)
	local colors = {
		-- Base colors
		bg0 = '#eee8da', -- Warm linen (background)
		bg1 = '#e7dfd0', -- Dark linen
		bg2 = '#e2dac9', -- Deeper linen
		bg3 = '#cedbd5', -- Selection sage
		bg4 = '#d6d2c2', -- Faded linen
		bg5 = '#8a9490', -- Muted text/comments

		-- Foreground
		fg0 = '#263d40', -- Deep pine (main text)
		fg1 = '#344c4b', -- Light pine
		fg2 = '#526056', -- Dark foreground / muted
		fg3 = '#203538', -- Bright foreground

		-- Accents
		fern = '#4c6045',        -- Leaf green
		fern_soft = '#3d6040',   -- Bright leaf green
		bark = '#795334',        -- Warm earth brown
		bark_soft = '#8c4829',   -- Terracotta orange
		clay_red = '#8c4036',    -- Burnt clay
		ochre = '#73591c',       -- Golden ochre
		slate_blue = '#315b7b',  -- Slate blue
		heather = '#6c4d6c',     -- Dusty plum
		lagoon = '#2e605d',      -- Deep teal

		-- Special
		selection = '#cedbd5',
		cursor_line = '#e7dfd0',
		visual = '#d5ded8',
	}

	-- Reset highlighting
	vim.cmd('highlight clear')
	if vim.fn.exists('syntax_on') then
		vim.cmd('syntax reset')
	end

	vim.o.termguicolors = true
	vim.o.background = 'light'
	vim.g.colors_name = 'linen-fern'


	-- Editor UI
	hl(0, 'Normal', { fg = colors.fg0, bg = setTransparent(colors.bg0) })
	hl(0, 'NormalFloat', { fg = colors.fg0, bg = setTransparent(colors.bg1) })
	hl(0, 'FloatBorder', { fg = colors.bark, bg = setTransparent(colors.bg1) })
	hl(0, 'SignColumn', { bg = setTransparent(colors.bg0) })
	hl(0, 'EndOfBuffer', { fg = setTransparent(colors.bg0) })
	hl(0, 'Cursor', { fg = colors.bg0, bg = colors.fg3 })
	hl(0, 'CursorLine', { bg = colors.cursor_line })
	hl(0, 'CursorLineNr', { fg = colors.ochre, bold = true })
	hl(0, 'LineNr', { fg = colors.fg2 })
	hl(0, 'Visual', { bg = colors.visual })
	hl(0, 'Search', { fg = colors.bg0, bg = colors.fg2 })
	hl(0, 'IncSearch', { fg = colors.bg0, bg = colors.bark })

	-- Syntax
	hl(0, 'Comment', { fg = colors.bg5, italic = true })
	hl(0, 'String', { fg = colors.fern })
	hl(0, 'Function', { fg = colors.bark })
	hl(0, 'Keyword', { fg = colors.clay_red })
	hl(0, 'Type', { fg = colors.ochre })
	hl(0, 'Number', { fg = colors.heather })
	hl(0, 'Boolean', { fg = colors.heather })
	hl(0, 'Operator', { fg = colors.fg1 })
	hl(0, 'Identifier', { fg = colors.bark })
	hl(0, '@punctuation.bracket', { fg = colors.fg0 })
	hl(0, '@constructor', { fg = colors.fg0 })
	hl(0, '@variable', { fg = colors.fg0 })
	hl(0, 'Special', { fg = colors.ochre })

	-- UI components
	hl(0, 'StatusLine', { fg = colors.fg0, bg = colors.bg2 })
	hl(0, 'StatusLineNC', { fg = colors.fg2, bg = colors.bg1 })
	hl(0, 'TabLineSel', { fg = colors.bark, bg = colors.bg0, bold = true })
	hl(0, 'Pmenu', { fg = colors.fg0, bg = colors.bg1 })
	hl(0, 'PmenuSel', { fg = colors.ochre, bg = colors.bg3, bold = true })

	-- Diagnostics
	hl(0, 'DiagnosticError', { fg = colors.clay_red })
	hl(0, 'DiagnosticWarn', { fg = colors.ochre })
	hl(0, 'DiagnosticInfo', { fg = colors.slate_blue })
	hl(0, 'DiagnosticHint', { fg = colors.bg5 })

	-- Git signs
	hl(0, 'GitSignsAdd', { fg = colors.fern })
	hl(0, 'GitSignsChange', { fg = colors.ochre })
	hl(0, 'GitSignsDelete', { fg = colors.clay_red })

	-- Base color groups (for linking)
	hl(0, 'Fern', { fg = colors.fern })
	hl(0, 'FernSoft', { fg = colors.fern_soft })
	hl(0, 'ClayRed', { fg = colors.clay_red })
	hl(0, 'Bark', { fg = colors.bark })
	hl(0, 'BarkSoft', { fg = colors.bark_soft })
	hl(0, 'Ochre', { fg = colors.ochre })
	hl(0, 'SlateBlue', { fg = colors.slate_blue })
	hl(0, 'Heather', { fg = colors.heather })
	hl(0, 'Lagoon', { fg = colors.lagoon })
	hl(0, 'Fg', { fg = colors.fg0 })
	hl(0, 'FgDim', { fg = colors.fg1 })
	hl(0, 'Grey', { fg = colors.fg2 })
	hl(0, 'GreyDim', { fg = colors.bg5 })

	-- NvimTree
	hl(0, 'NvimTreeNormal', { fg = colors.fg0, bg = setTransparent(colors.bg0) })
	hl(0, 'NvimTreeNormalNC', { fg = colors.fg0, bg = setTransparent(colors.bg0) })
	hl(0, 'NvimTreeEndOfBuffer', { fg = setTransparent(colors.bg0), bg = setTransparent(colors.bg0) })
	hl(0, 'NvimTreeVertSplit', { fg = colors.bg1, bg = setTransparent(colors.bg0) })
	hl(0, 'NvimTreeCursorLine', { bg = colors.bg1 })
	hl(0, 'NvimTreeSymlink', { link = 'Fg' })
	hl(0, 'NvimTreeFolderName', { link = 'Bark' })
	hl(0, 'NvimTreeRootFolder', { link = 'ClayRed' })
	hl(0, 'NvimTreeFolderIcon', { link = 'Fern' })
	hl(0, 'NvimTreeEmptyFolderName', { link = 'Grey' })
	hl(0, 'NvimTreeOpenedFolderName', { link = 'Fern' })
	hl(0, 'NvimTreeExecFile', { link = 'Fg' })
	hl(0, 'NvimTreeOpenedFile', { link = 'Fg' })
	hl(0, 'NvimTreeSpecialFile', { link = 'Ochre' })
	hl(0, 'NvimTreeImageFile', { link = 'Fg' })
	hl(0, 'NvimTreeIndentMarker', { link = 'GreyDim' })
	hl(0, 'NvimTreeGitDirty', { link = 'Ochre' })
	hl(0, 'NvimTreeGitStaged', { link = 'Fern' })
	hl(0, 'NvimTreeGitMerge', { link = 'Bark' })
	hl(0, 'NvimTreeGitRenamed', { link = 'Heather' })
	hl(0, 'NvimTreeGitNew', { link = 'Fern' })
	hl(0, 'NvimTreeGitDeleted', { link = 'ClayRed' })

	-- Terminal colors
	vim.g.terminal_color_0 = colors.fg0
	vim.g.terminal_color_1 = colors.clay_red
	vim.g.terminal_color_2 = colors.fern
	vim.g.terminal_color_3 = colors.ochre
	vim.g.terminal_color_4 = colors.slate_blue
	vim.g.terminal_color_5 = colors.heather
	vim.g.terminal_color_6 = colors.lagoon
	vim.g.terminal_color_7 = colors.bg1
	vim.g.terminal_color_8 = colors.fg2
	vim.g.terminal_color_9 = '#963a30'
	vim.g.terminal_color_10 = '#3d6040'
	vim.g.terminal_color_11 = '#645a19'
	vim.g.terminal_color_12 = '#265d75'
	vim.g.terminal_color_13 = '#634a7c'
	vim.g.terminal_color_14 = '#245f55'
	vim.g.terminal_color_15 = colors.bg0
end

M.setup({ transparent = true })

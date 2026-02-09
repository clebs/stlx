local M = {}

M.config = {
	transparent = false,
}

M.setup = function(opts)
	opts = opts or {}
	M.config = vim.tbl_deep_extend('force', M.config, opts)

	local transparent = M.config.transparent

	-- Ember & Ash palette
	local colors = {
		-- Base colors
		bg0 = '#0d0b0a', -- Deep charcoal black (background)
		bg1 = '#1a1513', -- Smoky brownish-gray
		bg2 = '#241e1b', -- Warm ash
		bg3 = '#3a2e2a', -- Highlighted ash
		bg4 = '#4a3a35', -- Faded ember brown
		bg5 = '#7a6a62', -- Muted text/comments

		-- Foreground
		fg0 = '#e6d3c7', -- Soft warm beige (main text)
		fg1 = '#cbb9ad', -- Dimmed beige
		fg2 = '#a8988f', -- Subtle text

		-- Accents
		ember = '#ff9933',        -- Glowing ember orange
		ember_soft = '#cc7a29',   -- Dim ember orange
		ash_glow = '#d1bfa9',     -- Soft pale beige
		coal_red = '#cc5544',     -- Burnt red
		smoke_purple = '#a68b8f', -- Smoky mauve
		fire_yellow = '#ffcc66',  -- Bright yellow ember tip
		char_amber = '#e6aa5c',   -- Char amber
		highlight_glow = '#ffb347', -- Glowing highlight

		-- Special
		selection = '#3a2e2a',
		cursor_line = '#211d1a',
		visual = '#3d3836',
	}

	-- Reset highlighting
	vim.cmd('highlight clear')
	if vim.fn.exists('syntax_on') then
		vim.cmd('syntax reset')
	end

	vim.o.termguicolors = true
	vim.o.background = 'dark'
	vim.g.colors_name = 'ember-ash'

	local hl = vim.api.nvim_set_hl

	-- Background helper for transparency
	local bg = function(color)
		return transparent and 'NONE' or color
	end

	-- Editor UI
	hl(0, 'Normal', { fg = colors.fg0, bg = bg(colors.bg0) })
	hl(0, 'NormalFloat', { fg = colors.fg0, bg = bg(colors.bg1) })
	hl(0, 'FloatBorder', { fg = colors.ember, bg = bg(colors.bg1) })
	hl(0, 'SignColumn', { bg = bg(colors.bg0) })
	hl(0, 'EndOfBuffer', { fg = bg(colors.bg0) })
	hl(0, 'Cursor', { fg = colors.bg0, bg = colors.ember })
	hl(0, 'CursorLine', { bg = colors.cursor_line })
	hl(0, 'CursorLineNr', { fg = colors.fire_yellow, bold = true })
	hl(0, 'LineNr', { fg = colors.fg2 })
	hl(0, 'Visual', { bg = colors.visual })
	hl(0, 'Search', { fg = colors.bg0, bg = colors.ember })
	hl(0, 'IncSearch', { fg = colors.bg0, bg = colors.highlight_glow })

	-- Syntax
	hl(0, 'Comment', { fg = colors.bg5, italic = true })
	hl(0, 'String', { fg = colors.ember })
	hl(0, 'Function', { fg = colors.char_amber })
	hl(0, 'Keyword', { fg = colors.coal_red })
	hl(0, 'Type', { fg = colors.fire_yellow })
	hl(0, 'Number', { fg = colors.smoke_purple })
	hl(0, 'Boolean', { fg = colors.smoke_purple })
	hl(0, 'Operator', { fg = colors.fg1 })
	hl(0, 'Identifier', { fg = colors.char_amber })
	hl(0, '@punctuation.bracket', { fg = colors.fg0 })
	hl(0, '@constructor', { fg = colors.fg0 })
	hl(0, '@variable', { fg = colors.fg0 })
	hl(0, 'Special', { fg = colors.fire_yellow })

	-- UI components
	hl(0, 'StatusLine', { fg = colors.fg0, bg = colors.bg2 })
	hl(0, 'StatusLineNC', { fg = colors.fg2, bg = colors.bg1 })
	hl(0, 'TabLineSel', { fg = colors.ember, bg = colors.bg0, bold = true })
	hl(0, 'Pmenu', { fg = colors.fg0, bg = colors.bg1 })
	hl(0, 'PmenuSel', { fg = colors.fire_yellow, bg = colors.bg3, bold = true })

	-- Diagnostics
	hl(0, 'DiagnosticError', { fg = colors.coal_red })
	hl(0, 'DiagnosticWarn', { fg = colors.fire_yellow })
	hl(0, 'DiagnosticInfo', { fg = colors.smoke_purple })
	hl(0, 'DiagnosticHint', { fg = colors.ash_glow })

	-- Git signs
	hl(0, 'GitSignsAdd', { fg = colors.ember })
	hl(0, 'GitSignsChange', { fg = colors.char_amber })
	hl(0, 'GitSignsDelete', { fg = colors.coal_red })

	-- Base color groups (for linking)
	hl(0, 'Ember', { fg = colors.ember })
	hl(0, 'EmberSoft', { fg = colors.ember_soft })
	hl(0, 'CoalRed', { fg = colors.coal_red })
	hl(0, 'CharAmber', { fg = colors.char_amber })
	hl(0, 'FireYellow', { fg = colors.fire_yellow })
	hl(0, 'AshGlow', { fg = colors.ash_glow })
	hl(0, 'SmokePurple', { fg = colors.smoke_purple })
	hl(0, 'HighlightGlow', { fg = colors.highlight_glow })
	hl(0, 'Fg', { fg = colors.fg0 })
	hl(0, 'FgDim', { fg = colors.fg1 })
	hl(0, 'Grey', { fg = colors.fg2 })
	hl(0, 'GreyDim', { fg = colors.bg5 })

	-- NvimTree
	hl(0, 'NvimTreeNormal', { fg = colors.fg0, bg = bg(colors.bg0) })
	hl(0, 'NvimTreeNormalNC', { fg = colors.fg0, bg = bg(colors.bg0) })
	hl(0, 'NvimTreeEndOfBuffer', { fg = bg(colors.bg0), bg = bg(colors.bg0) })
	hl(0, 'NvimTreeVertSplit', { fg = colors.bg1, bg = bg(colors.bg0) })
	hl(0, 'NvimTreeCursorLine', { bg = colors.bg1 })
	hl(0, 'NvimTreeSymlink', { link = 'Fg' })
	hl(0, 'NvimTreeFolderName', { link = 'CharAmber' })
	hl(0, 'NvimTreeRootFolder', { link = 'CoalRed' })
	hl(0, 'NvimTreeFolderIcon', { link = 'Ember' })
	hl(0, 'NvimTreeEmptyFolderName', { link = 'Grey' })
	hl(0, 'NvimTreeOpenedFolderName', { link = 'Ember' })
	hl(0, 'NvimTreeExecFile', { link = 'Fg' })
	hl(0, 'NvimTreeOpenedFile', { link = 'Fg' })
	hl(0, 'NvimTreeSpecialFile', { link = 'FireYellow' })
	hl(0, 'NvimTreeImageFile', { link = 'Fg' })
	hl(0, 'NvimTreeIndentMarker', { link = 'GreyDim' })
	hl(0, 'NvimTreeGitDirty', { link = 'FireYellow' })
	hl(0, 'NvimTreeGitStaged', { link = 'Ember' })
	hl(0, 'NvimTreeGitMerge', { link = 'CharAmber' })
	hl(0, 'NvimTreeGitRenamed', { link = 'SmokePurple' })
	hl(0, 'NvimTreeGitNew', { link = 'Ember' })
	hl(0, 'NvimTreeGitDeleted', { link = 'CoalRed' })

	-- Terminal colors
	vim.g.terminal_color_0 = colors.bg1
	vim.g.terminal_color_1 = colors.coal_red
	vim.g.terminal_color_2 = colors.ember
	vim.g.terminal_color_3 = colors.char_amber
	vim.g.terminal_color_4 = colors.smoke_purple
	vim.g.terminal_color_5 = colors.ash_glow
	vim.g.terminal_color_6 = colors.highlight_glow
	vim.g.terminal_color_7 = colors.fg1
	vim.g.terminal_color_8 = colors.bg3
	vim.g.terminal_color_9 = '#dd7766'
	vim.g.terminal_color_10 = '#ffb366'
	vim.g.terminal_color_11 = '#ffd27f'
	vim.g.terminal_color_12 = '#c4a3a8'
	vim.g.terminal_color_13 = '#e6cfc4'
	vim.g.terminal_color_14 = '#ffcc99'
	vim.g.terminal_color_15 = '#ffffff'
end

M.setup({ transparent = true })

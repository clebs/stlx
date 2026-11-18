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
   -- Sets either the given color or transparent ased on config.
   local setTransparent = function(color)
      return transparent and 'NONE' or color
   end

   local colors = {
      bg            = setTransparent("#0A0E14"), -- Deep midnight
      ui_bg         = setTransparent("#0E1620"), -- Shallow midnight
      cursorline_bg = setTransparent("#0F141C"), -- Shallow midnight
      fg            = "#E6F0FF",                 -- Soft icy white
      primary       = "#64B5F6",                 -- Vivid sky blue
      secondary     = "#00CFFF",                 -- Electric cyan
      success       = "#4DD0E1",                 -- Bright aqua
      danger        = "#2979FF",                 -- Intense azure
      warning       = "#81D4FA",                 -- Soft light blue
      info          = "#00E5FF",                 -- Neon cyan
      light         = "#B3E5FC",                 -- Pale baby blue
      dark          = "#041019",                 -- Deeper midnight
      muted         = "#355A66",                 -- Stormy teal
      visual        = "#123C56",                 -- Deep teal
   }

   vim.cmd("highlight clear")
   vim.cmd("set termguicolors") -- Reset highlighting
   if vim.fn.exists('syntax_on') then
      vim.cmd('syntax reset')
   end

   vim.o.termguicolors = true
   vim.o.background = 'dark'
   vim.g.colors_name = 'space'



   hl(0, "Normal", { fg = colors.fg, bg = colors.bg })
   hl(0, "Comment", { fg = colors.muted, italic = true })
   hl(0, "Constant", { fg = colors.secondary })
   hl(0, "String", { fg = colors.success })
   hl(0, "Character", { fg = colors.success })
   hl(0, "Number", { fg = colors.warning })
   hl(0, "Boolean", { fg = colors.primary, bold = true })
   hl(0, "Float", { fg = colors.warning })
   hl(0, "Identifier", { fg = colors.info })
   hl(0, "Function", { fg = colors.primary, bold = true })
   hl(0, "Statement", { fg = colors.danger, bold = true })
   hl(0, "Conditional", { fg = colors.danger })
   hl(0, "Repeat", { fg = colors.secondary })
   hl(0, "Label", { fg = colors.secondary })
   hl(0, "Operator", { fg = colors.fg })
   hl(0, "Keyword", { fg = colors.primary, bold = true })
   hl(0, "Exception", { fg = colors.danger })
   hl(0, "PreProc", { fg = colors.secondary })
   hl(0, "Include", { fg = colors.primary })
   hl(0, "Define", { fg = colors.primary })
   hl(0, "Macro", { fg = colors.warning })
   hl(0, "PreCondit", { fg = colors.secondary })
   hl(0, "Type", { fg = colors.info })
   hl(0, "StorageClass", { fg = colors.info })
   hl(0, "Structure", { fg = colors.secondary })
   hl(0, "Typedef", { fg = colors.secondary })
   hl(0, "Special", { fg = colors.warning })
   hl(0, "SpecialChar", { fg = colors.warning })
   hl(0, "Tag", { fg = colors.info })
   hl(0, "Delimiter", { fg = colors.fg })
   hl(0, "SpecialComment", { fg = colors.muted })
   hl(0, "Debug", { fg = colors.danger })

   -- UI Elements
   hl(0, "CursorLine", { bg = cursorline_bg })
   hl(0, "CursorLineNr", { fg = colors.primary, bold = true })
   hl(0, "LineNr", { fg = colors.muted })
   hl(0, "Visual", { bg = colors.visual })
   hl(0, "Search", { fg = colors.bg, bg = colors.primary })
   hl(0, "IncSearch", { fg = colors.bg, bg = colors.secondary })
   hl(0, "Pmenu", { fg = colors.fg, bg = ui_bg })
   hl(0, "PmenuSel", { fg = colors.bg, bg = colors.primary })
   hl(0, "StatusLine", { fg = colors.fg, bg = ui_bg })
   hl(0, "StatusLineNC", { fg = colors.muted, bg = ui_bg })
   hl(0, "VertSplit", { fg = colors.dark })
   hl(0, "Title", { fg = colors.primary, bold = true })
   hl(0, "ErrorMsg", { fg = colors.bg, bg = colors.danger, bold = true })
   hl(0, "WarningMsg", { fg = colors.bg, bg = colors.warning })
   hl(0, "MoreMsg", { fg = colors.success })
   hl(0, "ModeMsg", { fg = colors.primary, bold = true })

   -- Transparent BG
   -- Focused pane/window
   vim.cmd('autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE')
   -- All other panes and overlays
   vim.cmd('autocmd ColorScheme * highlight NormalNC ctermbg=NONE guibg=NONE')
   vim.cmd('autocmd ColorScheme * highlight NormalSB ctermbg=NONE guibg=NONE')
end

M.setup({ transparent = true })

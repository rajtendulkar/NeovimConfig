-- Hide ~ from end of lines.
vim.opt.fillchars = { eob = " " }

-- -- Highlightign line number for lsp diagnostics sings
vim.cmd
[[
  autocmd ColorScheme * highlight DiagnosticLineNrError guibg=#51202A guifg=#FF0000 gui=bold
  autocmd ColorScheme * highlight DiagnosticLineNrWarn guibg=#51412A guifg=#FFA500 gui=bold
  autocmd ColorScheme * highlight DiagnosticLineNrInfo guibg=#1E535D guifg=#00FFFF gui=bold
  autocmd ColorScheme * highlight DiagnosticLineNrHint guibg=#1E205D guifg=#0000FF gui=bold

  autocmd ColorScheme * sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl=DiagnosticLineNrError
  autocmd ColorScheme * sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn linehl= numhl=DiagnosticLineNrWarn
  autocmd ColorScheme * sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo linehl= numhl=DiagnosticLineNrInfo
  autocmd ColorScheme * sign define DiagnosticSignHint text= texthl=DiagnosticSignHint linehl= numhl=DiagnosticLineNrHint
]]

vim.g.tokyonight_style = "night" -- styles: storm, night and day.
vim.g.enfocado_style = "nature"    -- styles: nature and neon.

vim.g.enfocado_plugins = {
  "cmp",
  "dashboard",
  "gitsigns",
  "lsp",
  "lsp-installer",
  "matchup",
  "packer",
  "scrollview",
  "telescope",
  "todo-comments",
  "tree",
  "treesitter",
  "vista",
  "which-key",
}

require("onedark").setup  {
    -- Main options --
    style = "darker", -- Choose between "dark", "darker", "cool", "deep", "warm", "warmer" and "light"
    term_colors = true,
    -- Change code style ---
    -- Options are italic, bold, underline, none
    -- You can configure multiple style with comma seperated, For e.g., keywords = "italic,bold"
    code_style = {
        comments = "italic",
        keywords = "none",
        functions = "none",
        strings = "none",
        variables = "none"
    },
    -- Plugins Config --
    diagnostics = {
        darker = true, -- darker colors for diagnostic
        undercurl = true,   -- use undercurl instead of underline for diagnostics
        background = true,    -- use background color for virtual text
    },
}

vim.cmd("colorscheme onedark")



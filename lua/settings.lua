-- Defining alias for vim.opt.
local opt = vim.opt

-- Number settings.
opt.number = true
opt.numberwidth = 2

-- True collor support.
opt.termguicolors = true

-- Enable cursor line.
opt.cursorline = true

-- With set hidden you’re telling Neovim that you can
-- have unsaved worked that’s not displayed on your screen.
opt.hidden = true

-- Set indentation stuf.
opt.tabstop = 4
opt.shiftwidth = 4
opt.smartindent = true
opt.smartcase = true
opt.expandtab = true
opt.smarttab = true

-- Set searching stuf.
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- Enabling ruler and statusline.
opt.ruler = true
opt.laststatus = 2

-- Setting time that Neovim wait after each keystroke.
opt.ttimeoutlen = 20
opt.timeoutlen = 1000

-- Setting up autocomplete menu.
opt.completeopt = "menuone,noselect"

-- Add cursorline and diasable it in terminal
vim.cmd('autocmd WinEnter,BufEnter * if &ft is "toggleterm" | set nocursorline | else | set cursorline | endif')

-- Set line number for help files.
vim.cmd
[[
  augroup help_config
    autocmd!
    autocmd FileType help :set number
  augroup END
]]

-- Ignore these files in VIM
opt.wildignore = {'*.a','*.o','*.bmp','*.gif','*.ico','*.jpg','*.png', '*~','*.swp','*.tmp'}

-- Paste toggle mapped to F5
opt.pastetoggle="<F5>"

-- highlight matching brackets
opt.showmatch = true

-- this allows buffers to be hidden if you've modified a buffer
opt.hidden = true

vim.api.nvim_exec([[set guifont=DroidSansMono\ Nerd\ Font\ Complete:h11]], false)
vim.api.nvim_exec([[set gfw=DroidSansMono\ Nerd\ Font\ Complete:h11]], false)
--vim.api.nvim_exec([[set guifont=Hack\ Regular\ Nerd\ Font\ Complete:h11]], false)
--
--webdev icons
--vim.g.webdevicons_enable_nerdtree = 1
--vim.g.webdevicons_enabl = 0
--vim.g.WebDevIconsUnicodeDecorateFolderNodes = 0
--vim.g.WebDevIconsNerdTreeAfterGlyphPadding = ' '



-- do not fold any text
opt.foldenable = false 

--set autoindent               " auto-indenting
--set wildmenu                 " visual autocomplete for command menu
opt.mouse = 'a'
opt.mousemodel = popup

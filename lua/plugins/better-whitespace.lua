-- Set alias for vim.g.
local g = vim.g

g.better_whitespace_enabled=1
g.strip_whitespace_on_save=1
g.strip_whitespace_confirm=0

g.better_whitespace_filetypes_blacklist = {'diff', 'git', 'gitcommit', 'unite', 'qf', 'help', 'markdown', 'fugitive'}

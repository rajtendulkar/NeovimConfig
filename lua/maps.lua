-- Function for make mapping easier.
local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend("force", options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

require('tree')

map('n', '<C-g>', ':lua require\'tree\'.toggle()<CR>')

-- Map leader key to comma.
vim.g.mapleader = ','

-- Set cl for clearing highlights after searching word in file.
map('n', '<leader>cl', ':noh<CR>')

-- BarBar: Buffer switching
map('n', '<C-Up>', ':BufferPrevious<CR>', { noremap = false })
map('n', '<C-Down>', ':BufferNext<CR>', { noremap = false })

-- Buffer closing.
map('n', '<leader>bc', ':BufferLinePickClose<CR>')
map('n', '<leader>bq', ':bp <BAR> bd #<CR>')

-- NvimTree toggle
--map('n', '<C-g>', ':NvimTreeToggle<CR>')

-- F2 key to save all buffers
map('n', '<F2>', ':wa<CR>')

-- F3 key to save all buffers and quit
map('n', '<F3>', ':xa<CR>')

-- F4 key to quit without saving any buffers
map('n', '<F4>', ':qa!<CR>')

-- Toggle line numbers display.
map('n', '<F6>', ':set invnumber<CR>')

-- Toggle taglist window
map('n', '<F7>', ':TagbarToggle<CR>')

-- Tab key for switching windows
map('n', '<Tab>', '')
map('n', '<S-Tab>', 'p')

-- Remove unnecessary white spaces.
map('n', '<leader>cw', ':StripWhitespace<CR>')

-- Telescop.
map("n", "<Leader>fw", ":Telescope live_grep<CR>")
map("n", "<Leader>gt", ":Telescope git_status<CR>")
map("n", "<Leader>cm", ":Telescope git_commits<CR>")
map("n", "<Leader>ff", ":Telescope find_files<CR>")
map("n", "<Leader>fp", ":lua require('telescope').extensions.media_files.media_files()<CR>")
map("n", "<Leader>fb", ":Telescope buffers<CR>")
map("n", "<Leader>fh", ":Telescope help_tags<CR>")
--map("n", "<Leader>fo", ":Telescope oldfiles<CR>")
map("n", "<Leader>th", ":Telescope colorscheme<CR>")

-- Lsp
map('n', '<space>,', ':lua vim.lsp.diagnostic.goto_prev()<CR>')
map('n', '<space>;', ':lua vim.lsp.diagnostic.goto_next()<CR>')
map('n', '<space>a', ':lua vim.lsp.buf.code_action()<CR>')
map('n', '<leader>gd', ':lua vim.lsp.buf.definition()<CR>')
map('n', '<space>f', ':lua vim.lsp.buf.formatting()<CR>')
map('n', '<space>h', ':lua vim.lsp.buf.hover()<CR>')
map('n', '<space>m', ':lua vim.lsp.buf.rename()<CR>')
map('n', '<space>r', ':lua vim.lsp.buf.references()<CR>')
map('n', '<space>s', ':lua vim.lsp.buf.document_symbol()<CR>')


-- ToggleTerm
map('n', '<C-h>', ':ToggleTerm<CR>')
map('t', '<C-h>', ':ToggleTerm<CR>')
map('n', 'v:count1 <C-h>', ':v:count1' .. '"ToggleTerm"<CR>')
map('v', 'v:count1 <C-h>', ':v:count1' .. '"ToggleTerm"<CR>')
function _G.set_terminal_keymaps()
  map('t', '<esc>', '<C-\\><C-n>')
  map('t', 'jk', '<C-\\><C-n>')
  map('t', '<A-h>', '<c-\\><c-n><c-w>h')
  map('t', '<A-j>', '<c-\\><c-n><c-w>j')
  map('t', '<A-k>', '<c-\\><c-n><c-w>k')
  map('t', '<A-l>', '<c-\\><c-n><c-w>l')

  map('t', '<S-h>', '<c-\\><C-n>:call ResizeLeft(3)<CR>')
  map('t', '<S-j>', '<c-\\><C-n>:call ResizeDown(1)<CR>')
  map('t', '<S-k>', '<c-\\><C-n>:call ResizeUp(1)<CR>')
  map('t', '<S-l>', '<c-\\><C-n>:call ResizeRight(3)<CR>')
end
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- TODO: Update logic
--    on F5 press : paste, no line no. TagbarDisable
--    on F5 press : nopaste, line no. TagbarEnable
--map('n', '<F5>', ':set nopaste<CR> :set nonu<CR> :TagbarToggle<CR>')



-- comment
map("n", "<leader>ct", ":CommentToggle<CR>")
map("v", "<leader>ct", ":'<,'>CommentToggle<CR>")


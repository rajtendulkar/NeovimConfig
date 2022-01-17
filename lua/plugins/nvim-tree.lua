local present, nvimtree = pcall(require, "nvim-tree")
if not present then
    return
end
local tree_cb = require"nvim-tree.config".nvim_tree_callback

-- Set alias for vim.g.
local g = vim.g

g.nvim_tree_ignore = { ".git", ".ccls-cache", ".cache", "__pycache__"} -- Ignore these types in listing.
g.nvim_tree_auto_ignore_ft = { "dashboard" } -- Don't open tree on specific fiypes.
--g.nvim_tree_quit_on_open = 1 -- closes tree when file's opened.
g.nvim_tree_tab_open = 0 -- file opens on Tab key.
g.nvim_tree_indent_markers = 1 -- This option shows indent markers when folders are open.
g.nvim_tree_hide_dotfiles = 1 -- This option hides files and folders starting with a dot `.`.
g.nvim_tree_git_hl = 1 -- Will enable file highlight for git attributes (can be used without the icons).
g.nvim_tree_highlight_opened_files = 0 -- Will enable folder and file icon highlight for opened files/directories.
g.nvim_tree_add_trailing = 0 -- Append a trailing slash to folder names. ]]
g.nvim_tree_disable_default_keybindings = 1 -- Disables default key bindings
vim.g.nvim_tree_window_picker_exclude = {
    filetype = {'packer', 'vista_kind'},
    buftype = {'terminal'}
}

nvimtree.setup {
  auto_close = false,
  open_on_tab = false,
  update_cwd = true,
  update_to_buf_dir = {
    enable = true,
    auto_open = true,
  },
  filters = {
    dotfiles = false,
    custom = {".git", ".github", ".clang-format", ".gitignore", ".gitmodules"}
  },
  view = {
    width = "15%",
    side = "left",
    mappings = {
      list = {
       { key = { '<leftmouse>' }, cb = tree_cb("edit") },
       {key = "<S-h>", cb = ":call ResizeLeft(3)<CR>"},
       {key = "<C-h>", cb = tree_cb("toggle_dotfiles")},
      }
    }
  }
}

local tree ={}
tree.open = function ()
   require'bufferline.state'.set_offset(31, 'FileTree')
   require'nvim-tree'.find_file(true)
end

tree.close = function ()
   require'bufferline.state'.set_offset(0)
   require'nvim-tree'.close()
end

return tree
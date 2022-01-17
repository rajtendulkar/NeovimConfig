-- source config files

-- Packer 
-- Initialization command:
-- sudo apt update; sudo apt install -y libjpeg8-dev zlib1g-dev python-dev python3-dev libxtst-dev curl git unzip universal-ctags nodejs npm  ranger xclip gcc ripgrep wget subversion neovim
-- git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
-- PackerSync in NEOVIM
require('plugins')

-- VIM Settings
require('settings')

-- Keyboard shortcuts
require('maps')

-- Theme settings
require('theme')

-- LSP settings
require('lsp')

require('user_settings')

# Neovim Configuration files

I am using Packer for NEOVim.

## Setup

1. Install latest neovim
```
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim
```

2. Install packages on Ubuntu
```
sudo apt update; sudo apt install -y libjpeg8-dev zlib1g-dev python-dev python3-dev libxtst-dev curl git unzip universal-ctags nodejs npm  ranger xclip gcc ripgrep wget subversion clangd ccls
```

3. Clone Packer
```
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

4. Sync all packages in NVim
```
:PackerSync
```

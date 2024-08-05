# Installation Instructions

## Installig NeoVim

* On fedora run:

```bash 
sudo dnf install neovim
```

* For other distros, check out the *"Install from package"* and *"Install from source"* sections on [Neovim's github repo](https://github.com/neovim/neovim?tab=readme-ov-file#install-from-package).

## Installing prerequisites

### Installing lua-language-server

[lua-language-server website](https://luals.github.io/wiki/build/)

* clone repo
* install libstdc++-static if needed
* run ./make.sh

#### Adding lua-laguage-server to the PATH variable

on bash run:
```bash
cd ~
vim .bashrc #You can use any editor of your preference
```

add the folowing line to .bashrc:
```bash
PATH="path/to/lua-language-server:$PATH"
```
Remember that you **MUST** change *"path/to/lua-language-server"* to the actual path on your system.

## Cloning this repo:

This code will clone the remote repo and delete the local git repo created

```bash
mkdir ~/.config/nvim
cd ~/.config/nvim
git clone https://github.com/hzambenedetti/neovim_config.git
mv -t . neovim_config/*
yes | rm -r neovim_config
```

## Installing Packer

Just go to [packer's github page](https://github.com/wbthomason/packer.nvim?tab=readme-ov-file#quickstart) and follow the installation instructions.

## Verify that the plugin's are up-to-date

In the packer.lua file verify that plugins like telescope, treesitter and others are in their last stable version.
As the config is setup, everytime you save the plugins.lua file, it should automaticaly update your plugins.

## Finalizing

```bash
nvim ~/.config/nvim/lua/notzamba/packer.lua

#That is: press the ":" key <Command> "enter"
:PackerSync
:TSUpdate
```

Having done all theses steps, your nvim should be up and working!
If not, then i don't know what to do. In that case, feel free to open an issue that i will do my best to help you.


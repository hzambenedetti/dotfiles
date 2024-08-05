local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  --USAGE: use "gh_user/plugin_name.nvim"
  --WHERE: plugins are on the /home/<user>/.local/share/nvim/site directory
  -- You could just clone a plugin's repo in this exact place and it would work...

  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself

  -- PLUGINS_HERE
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used by lots of plugins

  --COLORSCHEMES
  --rose-pine colorscheme
    use({
	    'rose-pine/neovim',
	    as = 'rose-pine',
    })

	--nightfox colorscheme
	use({
	    "EdenEast/nightfox.nvim",
	    as = 'nightfox',
  })

  --tokyonight colorscheme
  use({
      "folke/tokyonight.nvim",
      as = 'tokyonight',
  })
  
  --dracula colorscheme
  use({
    "dracula/vim",
    as = "dracula"
  })
  
  --nightfly colorscheme
  use({
    "bluz71/vim-nightfly-colors",
    as = "nightfly"
  })

  --CMP PLUGINS
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "hrsh7th/nvim-cmp"
  use "saadparwaiz1/cmp_luasnip" 
  

  --SNIPPETS PLUGINS
  use({
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
  })
  use "rafamadriz/friendly-snippets" 
  
  -- LSP Plugins
  use "neovim/nvim-lspconfig"
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  
  -- Telescope
  use ({
      "nvim-telescope/telescope.nvim",
      requires = {
        "nvim-lua/plenary.nvim",
      }
  })
  --use "nvim-telescope/telescope-media-files.nvim"
  

  -- Treesitter
  use{
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate"
  }
  
  -- Autopairs
  use "windwp/nvim-autopairs"
  
  -- Comments
  use "numToStr/Comment.nvim"
  --use "JoosepAlviste/nvim-ts-context-commentstring" -- requires treesitter
  
  -- Git signs
  use "lewis6991/gitsigns.nvim"
  
  -- Nvim tree 
  use "kyazdani42/nvim-tree.lua"
  use "kyazdani42/nvim-web-devicons"
  
  -- Bufferline 
  use "akinsho/bufferline.nvim"
  use "moll/vim-bbye"
  
  
  -- ToggleTerm
  use "akinsho/toggleterm.nvim"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

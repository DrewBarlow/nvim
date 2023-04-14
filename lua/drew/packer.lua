vim.cmd.packadd("packer.nvim")

-- Automatically install packer
local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = vim.fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  vim.cmd.packadd("packer.nvim")
end

return require("packer").startup(function(use)
  -- packer
  use {"wbthomason/packer.nvim"}
  use {"nvim-lua/plenary.nvim"}

  -- autopair parens, quotes, etc.
  use {"windwp/nvim-autopairs"}

  -- autocomment
  use {"numToStr/Comment.nvim"}
  use {"JoosepAlviste/nvim-ts-context-commentstring"}

  -- ui
  use {"kyazdani42/nvim-web-devicons"}
  use {"akinsho/bufferline.nvim"}
  use {"moll/vim-bbye"}
  use {"nvim-lualine/lualine.nvim"}
  use {"akinsho/toggleterm.nvim"}
  use {"lewis6991/impatient.nvim"}
  use {"lukas-reineke/indent-blankline.nvim"}
  use {"folke/todo-comments.nvim"}

  -- theme
  use {"catppuccin/nvim", as = "catppuccin"}

  -- cmp and lsp
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = {
		  -- lsp
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

		  -- autocmp 
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

      -- copilot
      {"zbirenbaum/copilot.lua"},
      {"zbirenbaum/copilot-cmp"},

		  -- code snippets 
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
      {"simrat39/rust-tools.nvim"}
	  }
  }

  -- telescope
  use {"nvim-telescope/telescope.nvim"}
  use {"nvim-telescope/telescope-file-browser.nvim"}

  -- treesitter
  use {"nvim-treesitter/nvim-treesitter", commit="8e763332b7bf7b3a426fd8707b7f5aa85823a5ac"}
  use {"nvim-treesitter/playground"}
  use {"nvim-treesitter/nvim-treesitter-context"}

  -- git
  use {"lewis6991/gitsigns.nvim"}
  use {"ThePrimeagen/git-worktree.nvim"}

  -- whichKey
  use {"folke/which-key.nvim"}

  -- undo tree
  use {"mbbill/undotree"}

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

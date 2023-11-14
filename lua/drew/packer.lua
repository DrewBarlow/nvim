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
  use {"wbthomason/packer.nvim", commit="ea0cc3c59f67c440c5ff0bbe4fb9420f4350b9a3"}
  use {"nvim-lua/plenary.nvim", commit="50012918b2fc8357b87cff2a7f7f0446e47da174"}
  
  -- autopair parens, quotes, etc.
  use {"windwp/nvim-autopairs", commit="0f04d78619cce9a5af4f355968040f7d675854a1"}
 
  -- autocomment
  use {"numToStr/Comment.nvim", commit="0236521ea582747b58869cb72f70ccfa967d2e89"}
  use {"JoosepAlviste/nvim-ts-context-commentstring", commit="92e688f013c69f90c9bbd596019ec10235bc51de"}
 
  -- ui
  use {"kyazdani42/nvim-web-devicons", commit="5de460ca7595806044eced31e3c36c159a493857"}
  use {"akinsho/bufferline.nvim", commit="9e8d2f695dd50ab6821a6a53a840c32d2067a78a"}
  use {"moll/vim-bbye", commit="25ef93ac5a87526111f43e5110675032dbcacf56"}
  use {"nvim-lualine/lualine.nvim", commit="2248ef254d0a1488a72041cfb45ca9caada6d994"}
  use {"akinsho/toggleterm.nvim", commit="c80844fd52ba76f48fabf83e2b9f9b93273f418d"}
  use {"lewis6991/impatient.nvim", commit="47302af74be7b79f002773011f0d8e85679a7618"}
  use {"lukas-reineke/indent-blankline.nvim", main="ibl", commit="29be0919b91fb59eca9e90690d76014233392bef"}
  use {"folke/todo-comments.nvim", commit="4a6737a8d70fe1ac55c64dfa47fcb189ca431872"}
  use {"mg979/vim-visual-multi", commit="aec289a9fdabaa0ee6087d044d75b32e12084344"}
 
  -- theme
  use {"catppuccin/nvim", as="catppuccin", commit="40dc9f0621c55bd40da4ad0731fac44d15bb393a"}
 
  -- cmp and lsp
  use {
    "VonHeikemen/lsp-zero.nvim",
    commit = "c51a9104de7fddff2351361d2dbcbd8d08600ef4",
    branch = "v1.x",
    requires = {
      -- lsp
      {"neovim/nvim-lspconfig", commit="d0467b9574b48429debf83f8248d8cee79562586"},
      {"williamboman/mason.nvim", commit="eabf6d347fdb75be360d4c0ced1145670a171453"},
      {"williamboman/mason-lspconfig.nvim", commit="40301e1c74bc0946eece13edf2b1c561cc497491"},
 
      -- autocmp 
      {"hrsh7th/nvim-cmp", commit="51260c02a8ffded8e16162dcf41a23ec90cfba62"},
      {"hrsh7th/cmp-buffer", commit="3022dbc9166796b644a841a02de8dd1cc1d311fa"},
      {"hrsh7th/cmp-path", commit="91ff86cd9c29299a64f968ebb45846c485725f23"},
      {"saadparwaiz1/cmp_luasnip", commit="05a9ab28b53f71d1aece421ef32fee2cb857a843"},
      {"hrsh7th/cmp-nvim-lsp", commit="44b16d11215dce86f253ce0c30949813c0a90765"},
      {"hrsh7th/cmp-nvim-lua", commit="f12408bdb54c39c23e67cab726264c10db33ada8"},
 
      -- code snippets 
      {"L3MON4D3/LuaSnip", commit="80a8528f084a97b624ae443a6f50ff8074ba486b"},
      {"rafamadriz/friendly-snippets", commit="43727c2ff84240e55d4069ec3e6158d74cb534b6"},
      {"simrat39/rust-tools.nvim", commit="0cc8adab23117783a0292a0c8a2fbed1005dc645"},
      {"zah/nim.vim", commit="a15714fea392b0f06ff2b282921a68c7033e39a2"},
      {"ray-x/lsp_signature.nvim", commit="33250c84c7a552daf28ac607d9d9e82f88cd0907"},

      -- react
      {"maxmellon/vim-jsx-pretty", commit="6989f1663cc03d7da72b5ef1c03f87e6ddb70b41"},
      {"windwp/nvim-ts-autotag", commit="6be1192965df35f94b8ea6d323354f7dc7a557e4"},
    }
  }
 
  -- telescope
  use {"nvim-telescope/telescope.nvim", commit="4522d7e3ea75ffddabdc39957168a8a7060b5df0"}
  use {"nvim-telescope/telescope-file-browser.nvim", commit="6e51d0cd6447cf2525412220ff0a2885eef9039c"}
 
  -- treesitter
  use {"nvim-treesitter/nvim-treesitter", commit="c5a7533113b2deb7db899d387b877389cc8b6113"}
  use {"nvim-treesitter/nvim-treesitter-context", commit="2806d83e3965017382ce08792ee527e708fa1bd4"}

  -- git
  use {"lewis6991/gitsigns.nvim", commit="af0f583cd35286dd6f0e3ed52622728703237e50"}

  -- whichKey
  use {"folke/which-key.nvim", commit="4433e5ec9a507e5097571ed55c02ea9658fb268a"}

  -- undo tree
  use {"mbbill/undotree", commit="170aa9e516b6926e6bddfe21bbf01f2283a00e7d"}

  -- preview definition
  use {"rmagatti/goto-preview", commit="b428db4d2a5b7c06e149a020e31b2121fbf57a67"}

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

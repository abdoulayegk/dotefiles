return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ":TSUpdate",
    event = "BufWinEnter",
    config = "require('treesitter-config')"
  }
  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
    event = "BufWinEnter",
    config = "require('lualine-config')"
  }
  -- use {
  --   'akinsho/bufferline.nvim',
  --   requires = 'kyazdani42/nvim-web-devicons',
  --   event = "BufWinEnter",
  --   config = "require('bufferline-config')"
  -- }
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    cmd = "NvimTreeToggle",
    config = "require('nvim-tree-config')"
  }
  use {'windwp/nvim-ts-autotag', event = "InsertEnter", after = "nvim-treesitter"}
  use {'p00f/nvim-ts-rainbow', after = "nvim-treesitter"}
  use {'windwp/nvim-autopairs', config = "require('autopairs-config')", after = "nvim-cmp"}
  use {'folke/which-key.nvim', event = "BufWinEnter", config = "require('whichkey-config')"}
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/plenary.nvim'}},
    cmd = "Telescope",
    config = "require('telescope-config')"
  }
  use {'neovim/nvim-lspconfig', config = "require('lsp')"}
  use {'hrsh7th/cmp-nvim-lsp'}
  use {'hrsh7th/cmp-buffer'}
  use {'hrsh7th/nvim-cmp'}
  use {'hrsh7th/cmp-vsnip'}
  use {'hrsh7th/vim-vsnip'}
  use {'onsails/lspkind-nvim'}
  use {'norcalli/nvim-colorizer.lua', config = "require('colorizer-config')", event = "BufRead"}
  use {
    'lewis6991/gitsigns.nvim',
    requires = {'nvim-lua/plenary.nvim'},
    config = function()
      require('gitsigns').setup {current_line_blame = true}
    end
  }
  use {'glepnir/dashboard-nvim', event = "BufRead", config = "require('dashboard-config')"}
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = "require('blankline-config')",
    event = "BufRead"
  }
  use {"akinsho/toggleterm.nvim", config = "require('toggleterm-config')"}
  use {"terrortylor/nvim-comment", config = "require('comment-config')"}
  use {'tami5/lspsaga.nvim', config = "require('lspsaga-config')"}
  use {'williamboman/nvim-lsp-installer'}
  use {'jose-elias-alvarez/null-ls.nvim', config = "require('null-ls-config')"}
  use {"folke/zen-mode.nvim", config = 'require("zen-mode-config")'}
  use {"folke/twilight.nvim", config = "require('twilight-config')"}
--> code snippets
  use("L3MON4D3/LuaSnip") --> Snippets plugin
  use("rafamadriz/friendly-snippets" )-- a bunch of snippets to use


  --> Markdwon preview
    use {
    'iamcco/markdown-preview.nvim',
     ft = 'markdown',
     run = 'cd app && yarn install'
     }

     --> colorschemes
    use {'ellisonleao/gruvbox.nvim'}

    use {"romgrk/barbar.nvim"} --> tabs for neovim
    use{"kyazdani42/nvim-web-devicons"} --> enable iconsj

    use 'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim' --> toggle diagnostics


end)

local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Apperance
  use('scrooloose/nerdtree')
  use('morhetz/gruvbox')
  use('nvim-tree/nvim-web-devicons')
  use('nvim-lualine/lualine.nvim')
  use('onsails/lspkind-nvim')
  use('norcalli/nvim-colorizer.lua')
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})


  -- Searching & Navigating
  use('rking/ag.vim')
  use('ThePrimeagen/harpoon')
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.1',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Action
  use('phaazon/hop.nvim')
  use('tpope/vim-commentary')
  use({
    "Pocco81/auto-save.nvim",
    config = function()
      require("auto-save").setup {}
    end,
  })
  use('windwp/nvim-autopairs')

  -- Operator
  use('vim-scripts/ReplaceWithRegister')
  use('tpope/vim-surround')
  use('tpope/vim-repeat')

  -- Text Object
  use('michaeljsmith/vim-indent-object')
  use('machakann/vim-textobj-delimited')

  -- Git
  use('tpope/vim-fugitive')
  use('airblade/vim-gitgutter')

  -- Tmux
  use('christoomey/vim-tmux-navigator')
  use('benmills/vimux')

  -- Coding
  use('folke/zen-mode.nvim')

  use('tpope/vim-projectionist')

  use 'neovim/nvim-lspconfig' -- LSP
  use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
  use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
  use 'hrsh7th/nvim-cmp' -- Completion
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use('SirVer/ultisnips')
  use('honza/vim-snippets')
  use('quangnguyen30192/cmp-nvim-ultisnips')

  use('vim-test/vim-test')
  use('mattn/emmet-vim')
  use('Glench/Vim-Jinja2-Syntax')
  use('mfussenegger/nvim-dap')
  use('mfussenegger/nvim-dap-python')
  use('rcarriga/nvim-dap-ui')
  -- use('python-mode/python-mode')
  -- use('puremourning/vimspector')

  use('wakatime/vim-wakatime')

  -- Markdown
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })
end)
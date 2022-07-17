vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
  use { 'antoinemadec/FixCursorHold.nvim' }
  use { 'wbthomason/packer.nvim', opt = true } -- Let Paq manage itself
  use {
    "williamboman/nvim-lsp-installer",
    "neovim/nvim-lspconfig",
    "jose-elias-alvarez/nvim-lsp-ts-utils",
    "jose-elias-alvarez/null-ls.nvim",
  } -- lsp package
  use "b0o/schemastore.nvim"
  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'
  use 'nvim-lua/plenary.nvim'
  use 'f-person/git-blame.nvim'
  use 'christoomey/vim-tmux-navigator' -- switch between panes
  use 'jiangmiao/auto-pairs' -- auto open/close pairs
  use 'tpope/vim-repeat' -- repeating for vim-surround
  use 'tpope/vim-surround' -- work with bracket, html tags,...
  -- use "terrortylor/nvim-comment" -- commenter
  use { 'numToStr/Comment.nvim' }
  -- use {'neoclide/coc.nvim', branch='release'} -- COC
  use 'mfussenegger/nvim-dap' -- debug
  use { 'tpope/vim-abolish' } -- search & replace
  -- telescope
  use { 'nvim-lua/popup.nvim' }
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-dap.nvim'
  use { 'nvim-telescope/telescope-ui-select.nvim' }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use { 'BenGH28/neo-runner.nvim', run = ':UpdateRemotePlugins' } -- C/C++
  -- fugitive seach
  -- use {'junegunn/fzf', run = function() vim.fn['fzf#install']() end}
  use 'junegunn/fzf.vim'
  -- use 'Yggdroot/indentLine' -- show vertical line
  use 'hoob3rt/lualine.nvim'
  -- use 'ervandew/supertab' -- easy use tab
  -- use "chr4/nginx.vim"
  use 'ryanoasis/vim-devicons'
  use 'xiyaowong/nvim-transparent'
  use "EdenEast/nightfox.nvim"
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-treesitter/nvim-treesitter-angular'

  -- markdown preview
  use { 'iamcco/markdown-preview.nvim', run = 'cd app && yarn install' }

  -- git diff tools
  use 'sindrets/diffview.nvim'

  --snippets
  -- use "SirVer/ultisnips"
  use 'honza/vim-snippets'

  -- autocompletions
  use { 'kkoomen/vim-doge', run = ':call doge#install()' }
  use {
    'hrsh7th/nvim-cmp',
    requires = { 'L3MON4D3/LuaSnip', 'hrsh7th/cmp-nvim-lsp' }
  }

  -- image viewer
  use { 'edluffy/hologram.nvim' }

  use {
    'romgrk/barbar.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' }
  }

end)

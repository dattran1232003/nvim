vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
    use {'wbthomason/packer.nvim', opt = true} -- Let Paq manage itself

    -- must have packages
    use "neovim/nvim-lspconfig" -- lsp package

    use 'kyazdani42/nvim-web-devicons'
    use  'kyazdani42/nvim-tree.lua'


    use 'nvim-lua/plenary.nvim'

    use 'christoomey/vim-tmux-navigator' -- switch between panes

    use 'liuchengxu/vista.vim' -- View and search LSP symbols, tags in Vim/NeoVim.

    use 'jiangmiao/auto-pairs' -- auto open/close pairs
    use 'tpope/vim-repeat'   -- repeating for vim-surround
    use 'tpope/vim-surround' -- work with bracket, html tags,...

    use "terrortylor/nvim-comment" -- commenter

    use {'neoclide/coc.nvim', branch='release'} -- COC
    use 'mfussenegger/nvim-dap' -- debug

    use { 'tpope/vim-abolish' } -- search & replace

    -- telescope
    use { 'nvim-lua/popup.nvim' }
    use 'nvim-telescope/telescope.nvim'
    use  'nvim-telescope/telescope-dap.nvim'

    -- #must have packages

    -- use 'jose-elias-alvarez/nvim-lsp-ts-utils'
    use { 'BenGH28/neo-runner.nvim',run=':UpdateRemotePlugins' } -- C/C++

    -- fugitive seach
    -- use {'junegunn/fzf', run = function() vim.fn['fzf#install']() end}
    use 'junegunn/fzf.vim'

    -- use 'Yggdroot/indentLine' -- show vertical line
    use 'hoob3rt/lualine.nvim'
    use 'ervandew/supertab'        -- easy use tab


    -- syntax highlight, colors & icons
    use "chr4/nginx.vim"
    use 'ryanoasis/vim-devicons'
    -- use 'xiyaowong/nvim-transparent'

    -- use 'tanvirtin/monokai.nvim'
    use "EdenEast/nightfox.nvim"

    use {'nvim-treesitter/nvim-treesitter', run=':TSUpdate'}
    use 'nvim-treesitter/nvim-treesitter-angular'
    -- use 'nvim-treesitter/nvim-tree-docs'

    -- markdown preview
    use { 'iamcco/markdown-preview.nvim', run='cd app && yarn install' }

    -- git diff tools
    use 'sindrets/diffview.nvim'

    --snippets
    use "SirVer/ultisnips"
    use 'honza/vim-snippets'

    -- autocompletions
    use {'kkoomen/vim-doge', run = vim.fn['doge#install']}

    -- image viewer
    use {'edluffy/hologram.nvim'}

    use {
      'romgrk/barbar.nvim',
      requires = {'kyazdani42/nvim-web-devicons'}
    }

end)

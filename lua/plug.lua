vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
    use {'wbthomason/packer.nvim', opt = true} -- Let Paq manage itself

    -- must have packages
    use "neovim/nvim-lspconfig" -- lsp package

    use 'nvim-lua/plenary.nvim'

    use 'christoomey/vim-tmux-navigator' -- switch between panes
    -- use {'knubie/vim-kitty-navigator', run='cp ./*.py ~/.config/kitty/'} -- switch between kitty panes

    use 'liuchengxu/vista.vim' -- View and search LSP symbols, tags in Vim/NeoVim.

    use 'jiangmiao/auto-pairs' -- auto open/close pairs
    use 'tpope/vim-repeat'   -- repeating for vim-surround
    use 'tpope/vim-surround' -- work with bracket, html tags,...

    use 'preservim/nerdtree' -- file management
    use "terrortylor/nvim-comment" -- commenter

    use {'neoclide/coc.nvim', branch='release'} -- COC

    use 'mfussenegger/nvim-dap' -- debug
    -- #must have packages

    -- use 'jose-elias-alvarez/nvim-lsp-ts-utils'

    -- fugitive seach
    use {'junegunn/fzf', run = function() vim.fn['fzf#install']() end}
    use 'junegunn/fzf.vim'

    use 'Yggdroot/indentLine' -- show vertical line
    use 'hoob3rt/lualine.nvim'
    use 'ervandew/supertab'        -- easy use tab


    -- syntax highlight, colors & icons
    use "chr4/nginx.vim"
    use 'ryanoasis/vim-devicons'
    use 'kyazdani42/nvim-web-devicons'
    use 'xiyaowong/nvim-transparent'
    use { "morhetz/gruvbox" }

    use 'tanvirtin/monokai.nvim'

    use 'tiagofumo/vim-nerdtree-syntax-highlight' -- syntax highlight for nerdtree
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

    -- autocompletions & snippets
    -- use {
    --   "hrsh7th/nvim-cmp",
    --   requires = {
    --     "hrsh7th/vim-vsnip",
    --     "hrsh7th/cmp-buffer",
    --     'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
    --     'saadparwaiz1/cmp_luasnip', -- Snippets source for nvim-cmp
    --     'L3MON4D3/LuaSnip', -- snippet
    --     'hrsh7th/vim-vsnip', -- vscode snippet
    --     'hrsh7th/vim-vsnip-integ',
    --   }
    -- }

end)

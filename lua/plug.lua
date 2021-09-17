vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
    use {'wbthomason/packer.nvim', opt = true} -- Let Paq manage itself

    -- must have packages
    use "neovim/nvim-lspconfig" -- lsp package
    use 'nvim-lua/completion-nvim' -- autocomplete


    use 'christoomey/vim-tmux-navigator' -- switch between panes

    use 'liuchengxu/vista.vim' -- View and search LSP symbols, tags in Vim/NeoVim.

    use 'jiangmiao/auto-pairs' -- auto open/close pairs
    use 'tpope/vim-repeat'   -- repeating for vim-surround
    use 'tpope/vim-surround' -- work with bracket, html tags,...

    use 'preservim/nerdtree' -- file management
    use 'preservim/nerdcommenter' -- commenter

    use {'neoclide/coc.nvim', branch='release'} -- COC
    -- #must have packages

    use 'jose-elias-alvarez/nvim-lsp-ts-utils'

    -- fugitive seach
    use {'junegunn/fzf', run = function() vim.fn['fzf#install']() end}
    use 'junegunn/fzf.vim'

    use 'Yggdroot/indentLine' -- show vertical line
    use 'hoob3rt/lualine.nvim'
    use 'ervandew/supertab'        -- easy use tab


    -- syntax highlight, colors & icons
    use 'tanvirtin/monokai.nvim'
    use 'ryanoasis/vim-devicons'

    use 'tiagofumo/vim-nerdtree-syntax-highlight' -- syntax highlight for nerdtree
    use {'nvim-treesitter/nvim-treesitter', run='TSUpdate'}
    use 'nvim-treesitter/nvim-treesitter-angular'

    -- virtual text
    use 'haringsrob/nvim_context_vt' -- show end of function text

    -- autocompletions & snippets
    use {
      "hrsh7th/nvim-cmp",
      requires = {
        "hrsh7th/vim-vsnip",
        "hrsh7th/cmp-buffer",
        'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
        'saadparwaiz1/cmp_luasnip', -- Snippets source for nvim-cmp
        'L3MON4D3/LuaSnip', -- snippet
        'hrsh7th/vim-vsnip', -- vscode snippet
        'hrsh7th/vim-vsnip-integ',
      }
    }
    use "SirVer/ultisnips"
    use 'honza/vim-snippets'

end)

vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
    use({ "antoinemadec/FixCursorHold.nvim" })
    use({ "wbthomason/packer.nvim", opt = true }) -- Let Paq manage itself
    use({
        "williamboman/nvim-lsp-installer",
        "neovim/nvim-lspconfig",
        "jose-elias-alvarez/nvim-lsp-ts-utils",
        "jose-elias-alvarez/null-ls.nvim",
    }) -- lsp package
    use("b0o/schemastore.nvim")
    use("kyazdani42/nvim-web-devicons")
    use("kyazdani42/nvim-tree.lua")
    use("nvim-lua/plenary.nvim")
    use("christoomey/vim-tmux-navigator") -- switch between panes
    use("windwp/nvim-autopairs") -- auto open/close pairs
    use("windwp/nvim-ts-autotag")
    use("tpope/vim-repeat") -- repeating for vim-surround
    use("tpope/vim-surround") -- work with bracket, html tags,...
    -- use "terrortylor/nvim-comment" -- commenter
    use({ "numToStr/Comment.nvim" })
    -- use {'neoclide/coc.nvim', branch='release'} -- COC
    use("mfussenegger/nvim-dap") -- debug
    use({ "tpope/vim-abolish" }) -- search & replace
    -- telescope
    use({ "nvim-lua/popup.nvim" })
    use("nvim-telescope/telescope.nvim")
    use("nvim-telescope/telescope-dap.nvim")
    use({ "nvim-telescope/telescope-ui-select.nvim" })
    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
    use({ "BenGH28/neo-runner.nvim", run = ":UpdateRemotePlugins" }) -- C/C++
    -- fugitive seach
    use("junegunn/fzf.vim")
    use("hoob3rt/lualine.nvim")
    use("ryanoasis/vim-devicons")
    use("xiyaowong/nvim-transparent")
    use("EdenEast/nightfox.nvim")
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
    use("nvim-treesitter/nvim-treesitter-angular")

    -- markdown preview
    use({ "iamcco/markdown-preview.nvim", run = "cd app && yarn install" })

    -- goto preview
    use({ "rmagatti/goto-preview" })
    -- git diff tools
    use("sindrets/diffview.nvim")

    -- git
    -- use 'f-person/git-blame.nvim'
    use({
        "lewis6991/gitsigns.nvim",
    })

    --snippets & code completion
    -- use "SirVer/ultisnips"
    use({ "kkoomen/vim-doge", run = ":call doge#install()" })
    use({ "hrsh7th/nvim-cmp", "hrsh7th/cmp-nvim-lsp" })
    use({ "saadparwaiz1/cmp_luasnip" })
    use({ "L3MON4D3/LuaSnip" })
    use("onsails/lspkind.nvim")

    -- image viewer
    use({ "edluffy/hologram.nvim" })

    -- tabs
    use({ "akinsho/bufferline.nvim", tag = "v2.*", requires = "kyazdani42/nvim-web-devicons" })
end)

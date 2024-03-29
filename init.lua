--[[
  ██╗███╗   ██╗██╗████████╗██╗     ██╗   ██╗ █████╗
  ██║████╗  ██║██║╚══██╔══╝██║     ██║   ██║██╔══██╗
  ██║██╔██╗ ██║██║   ██║   ██║     ██║   ██║███████║
  ██║██║╚██╗██║██║   ██║   ██║     ██║   ██║██╔══██║
  ██║██║ ╚████║██║   ██║██╗███████╗╚██████╔╝██║  ██║
  ╚═╝╚═╝  ╚═══╝╚═╝   ╚═╝╚═╝╚══════╝ ╚═════╝ ╚═╝  ╚═╝
Neovim init file
Version: 0.12.0_alpha - 2021/09/06
Maintainer: Brainf+ck
Website: https://github.com/brainfucksec/neovim-lua
--]]


-----------------------------------------------------------
-- Import Lua modules
-----------------------------------------------------------
--
require('keymaps') -- keymapsrequire('plug')
require('plug') -- plugins

--CUSTOM PLUGINS
require('plugins/p_bufferline') -- Tab config for neovim
require('plugins/plualine') -- statusline
require('plugins/nvim-treesitter') -- hightlight better
require('plugins/nvim-lspconfig') -- native lsp configuration
require('plugins/nvim-cmp') -- completion
require('plugins/p_diffview') -- git diff viewing tools
require('plugins/markdown-preview') -- markdown preview
require('plugins/p_supertab') -- supertab
require('plugins/nvim-dap') -- debug tools
require('plugins/telescope-nvim') -- telescope
require('plugins/neo-runner') -- Runner for C++ in Neovim
require('plugins/nvim-tree') -- Nvim File Tree
-- require('plugins/barbar') -- Tab config for neovim
require('plugins/p_vim-doge')
require('plugins/comment-nvim') -- commenter
require('plugins/gitsigns')
require('plugins/nvim-ts-autotag')
require('plugins/nvim-autopairs')
require('plugins/goto-preview')

require('settings') -- settings

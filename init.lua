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
require('plug')                     -- plugins
require('settings')                 -- settings
require('keymaps')                  -- keymapsrequire('plug')

--CUSTOM PLUGINS

-- require('plugins/nvim-cmp')         -- autocomplete
-- require('plugins/nvim-lspconfig')   -- language server configure

require('plugins/plualine')          -- statusline
require('plugins/vista')            -- tag viewer
require('plugins/fzf')              -- fugitive search

require('plugins/nerdtree')         -- file management
require('plugins/nerdcommenter')    -- commenter

require('plugins/nvim-treesitter')  -- hightlight better

require('plugins/coc-nvim')         -- use coc.nvim, native LSP is not stable yet

require('plugins/p_diffview')       -- git diff viewing tools
require('plugins/p_nvim-transparent')
require('plugins/markdown-preview') -- markdown preview
require('plugins/p_supertab')       -- supertab
require('plugins/nvim-comment')     -- commenter
require('plugins/nvim-dap')         -- debug tools
require('plugins/telescope-nvim')   -- telescope

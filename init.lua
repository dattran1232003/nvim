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
require('settings')                 -- settings
require('keymaps')                  -- keymapsrequire('plug')
require('plug')                     -- plugins

--CUSTOM PLUGINS
require('plugins/lualine')          -- statusline
require('plugins/nvim-cmp')         -- autocomplete
require('plugins/vista')            -- tag viewer
require('plugins/nvim-lspconfig')   -- language server configure
require('plugins/fzf')              -- fugitive search

require('plugins/nerdtree')         -- file management
require('plugins/nerdcommenter')    -- commenter

require('plugins/nvim-treesitter')  -- hightlight better

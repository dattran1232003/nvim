local map = vim.api.nvim_set_keymap

-- nvim-telescope/telescope-dap.nvim
require('telescope').load_extension('dap')

-- key mappings
local opts = { noremap = true }

map('n', '<leader>ds', ':Telescope dap frames<CR>', opts)
-- map('n', '<leader>dc', ':Telescope dap commands<CR>', opts)
map('n', '<leader>db', ':Telescope dap list_breakpoints<CR>', opts)

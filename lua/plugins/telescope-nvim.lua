local map = vim.api.nvim_set_keymap

-- nvim-telescope/telescope-dap.nvim
require('telescope').load_extension('dap')

-- key mappings
local opts = { noremap = true, silent=true}

map('n', '<leader>ds', ':Telescope dap frames<CR>', opts)
-- map('n', '<leader>dc', ':Telescope dap commands<CR>', opts)
map('n', '<leader>db', ':Telescope dap list_breakpoints<CR>', opts)

map('n', '<c-p>', "<cmd>Telescope find_files hidden=true<cr>", opts)
map('n', '<c-n>', '<cmd>Telescope live_grep<cr>', opts)
map('n', 'fb', '<cmd>Telescope buffers<cr>', opts)
map('n', 'fh', '<cmd>Telescope help_tags<cr>', opts)


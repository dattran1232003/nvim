-----------------------------------------------------------
-- Keymaps configuration file: keymaps of neovim
--- and plugins.
-----------------------------------------------------------

local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true, silent = true}

-----------------------------------------------------------
-- Neovim shortcuts:
-----------------------------------------------------------
-- source lua file
map('n', '<leader>sv', ':luafile ~/.config/nvim/init.lua<cr>', { noremap = true })

-- clear search highlighting
map('n', '<leader>c', ':nohl<CR>', default_opts)

-- map Esc to kk
map('i', 'kk', '<Esc>', {noremap = true})

-- don't use arrow keys
map('', '<up>', '<nop>', {noremap = true})
map('', '<down>', '<nop>', {noremap = true})
map('', '<left>', '<nop>', {noremap = true})
map('', '<right>', '<nop>', {noremap = true})

-- fast saving with <leader> and s
map('n', '<leader>s', ':w<CR>', default_opts)
map('i', '<leader>s', '<C-c>:w<CR>', default_opts)

-- move around splits using Ctrl + {h,j,k,l}
map('n', '<C-h>', '<C-w>h', default_opts)
map('n', '<C-j>', '<C-w>j', default_opts)
map('n', '<C-k>', '<C-w>k', default_opts)
map('n', '<C-l>', '<C-w>l', default_opts)

-- Close all windows and exit from neovim
map('n', '<leader>q', ':quitall<CR>', default_opts)

-- Quick exit using jk
map('i', 'jk', '<ESC>', { noremap=true })

-- move line up/down
map('n', '˚', ':m .-2<CR>==', { noremap = true })
map('n', '∆', ':m .+1<CR>==', { noremap = true })

map('i', '∆', '<Esc>:m .+1<CR>==gi', { noremap = true })
map('i', '˚', '<Esc>:m .-2<CR>==gi', { noremap = true })

map ('v', '∆', ":m '>+1<CR>gv=gv", { noremap = true })
map ('v', '˚', ":m '<-2<CR>gv=gv", { noremap = true })

-- tabs
map('n', '<Leader>te', ':tabe%:h<CR>', { noremap = true })
map('n', '<Leader>tc', ':tabclose<CR>', { noremap = true })
map('n', '<Leader>tm', ':tabmove<CR>', { noremap = true })
map('n', '<Leader>tn', ':tabnew .<CR>', { noremap = true })
map('n', '<Leader>n' , ':tabnext<CR>', { noremap = true })
map('n', '<Leader>p' , ':tabprevious<CR>', { noremap = true })
map('n', '<Leader>td', ':DuplicateTabpane<CR>', { noremap = true })

-- switch tab using leander + number
map('n', '<leader>1', '1gt', { noremap=true })
map('n', '<leader>3', '3gt', { noremap=true })
map('n', '<leader>2', '2gt', { noremap=true })
map('n', '<leader>4', '4gt', { noremap=true })
map('n', '<leader>5', '5gt', { noremap=true })
map('n', '<leader>6', '6gt', { noremap=true })
map('n', '<leader>7', '7gt', { noremap=true })
map('n', '<leader>8', '8gt', { noremap=true })
map('n', '<leader>9', '9gt', { noremap=true })

-- new line in normal mode
map('n',   '<space>', 'o<ESC>', { noremap = true })
map('n', '<c-space>', 'O<ESC>', { noremap = true })

-- quick save
map('n', '<c-s>', ':w<cr>', { noremap = true })
map('i', '<c-s>', '<ESC>:w<cr>', { noremap = true })


-----------------------------------------------------------
-- Plugins shortcuts:
-----------------------------------------------------------

-- Vista
map('', '<C-m>', ':Vista<CR>', default_opts)  -- open/close vista window

-- vim-tmux-navigator
map('n', '<c-h>', ':TmuxNavigateLeft<cr>', default_opts)
map('n', '<c-j', ':TmuxNavigateDown<cr>', default_opts)
map('n', '<c-k', ':TmuxNavigateUp<cr>', default_opts)
map('n', '<c-h', ':TmuxNavigateRight<cr>', default_opts)
map('n', '<c-\\', ':TmuxNavigatePrevios<cr>', default_opts)
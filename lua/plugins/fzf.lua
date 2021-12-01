local map = vim.api.nvim_set_keymap
local g = vim.g

g.fzf_layout = { down='40%' }
g.fzf_preview_window = {'right:50%', 'ctrl-/'}

vim.api.nvim_exec(
[[
let g:fzf_action = { 'ctrl-t': 'tab split', 'ctrl-i': 'split', 'ctrl-s': 'vsplit' }
]],
false)


-----------------------------------------------------------
-- Key bindings for FZF plugin.
-----------------------------------------------------------
map('n', '<c-p>', ':Files<CR>', { noremap=true })
map('n', '<c-n>', '<cmd>:Rg<CR>', { noremap=true }) -- Search for word
map('n', '<c-m>', '<cmd>:Lines<CR>', { noremap=true}) -- Search for word in file



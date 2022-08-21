-- local status, bufferline = pcall(require, "bufferline")
-- if (not status) then return end
local bufferline = require('bufferline')

vim.opt.termguicolors = true
bufferline.setup({
  options = {
    mode = "tabs",
    separator_style = 'slant',
    always_show_bufferline = false,
    show_buffer_close_icons = false,
    show_close_icon = false,
    color_icons = true,
    numbers = function(opts)
      return string.format('%s.', (opts.ordinal))
    end,
  },
  highlights = {
    separator = {
      fg = '#073642',
      bg = '#002b36',
    },
    separator_selected = {
      fg = '#073642',
    },
    background = {
      fg = '#657b83',
      bg = '#002b36'
    },
    buffer_selected = {
      fg = '#fdf6e3',
      -- gui = "bold",
    },
    fill = {
      bg = '#073642'
    }
  },
})

vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})

-- for debian linux (pop_os, ubuntu,...)
vim.keymap.set('n', '<M-1>', ':BufferLineGoToBuffer 1<CR>', { silent = true })
vim.keymap.set('n', '<M-2>', ':BufferLineGoToBuffer 2<CR>', { silent = true })
vim.keymap.set('n', '<M-3>', ':BufferLineGoToBuffer 3<CR>', { silent = true })
vim.keymap.set('n', '<M-4>', ':BufferLineGoToBuffer 4<CR>', { silent = true })
vim.keymap.set('n', '<M-5>', ':BufferLineGoToBuffer 5<CR>', { silent = true })
vim.keymap.set('n', '<M-6>', ':BufferLineGoToBuffer 6<CR>', { silent = true })
vim.keymap.set('n', '<M-7>', ':BufferLineGoToBuffer 7<CR>', { silent = true })
vim.keymap.set('n', '<M-8>', ':BufferLineGoToBuffer 8<CR>', { silent = true })
vim.keymap.set('n', '<M-9>', ':BufferLineGoToBuffer 9<CR>', { silent = true })

vim.keymap.set('n', '<M-t>', ':tabnew<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<M-w>', ':tabclose<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<M-W>', ':BufferLineCloseLeft<CR>:BufferLineCloseRight<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<M-R>', ':BufferLineCloseRight<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<M-L>', ':BufferLineCloseLeft<CR>', { noremap = true, silent = true })

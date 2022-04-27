local map = vim.api.nvim_set_keymap
local telescope = require('telescope')

-- nvim-telescope/telescope-dap.nvim
telescope.setup {
  defaults = {
    path_display = { 'smart' }
  },
  pickers ={
    grep_string = {
      path_display = { 'shorten' }
    }
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
    }
  }
}

telescope.load_extension('dap')
telescope.load_extension('fzf')

-- key mappings
local opts = { noremap = true, silent=true }

map('n', '<leader>ds', ':Telescope dap frames<CR>', opts)
map('n', '<leader>db', ':Telescope dap list_breakpoints<CR>', opts)

map('n', '<c-p>', "<cmd>Telescope find_files hidden=true<cr>", opts)
map('n', '<c-n>', "<cmd>lua require'telescope.builtin'.grep_string({ search='' })<cr>", opts)
map('n', '<cr>', "<cmd>lua require'telescope.builtin'.current_buffer_fuzzy_find({ sorter = require('telescope.sorters').get_substr_matcher({})})<cr>", { noremap=false, silent=true })
map('n', 'fb', '<cmd>Telescope buffers<cr>', opts)
map('n', 'fh', '<cmd>Telescope help_tags<cr>', opts)


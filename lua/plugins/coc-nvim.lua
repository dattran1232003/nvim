-----------------------------------------------------------
-- Coc Neovim configuration file
-----------------------------------------------------------

local g = vim.g
local exec = vim.api.nvim_exec
local map = vim.api.nvim_set_keymap

local opts = { noremap=false, silent=true  }

g.coc_global_extensions = {
  'coc-pyright',
  'coc-tsserver',
  'coc-git',
  'coc-emmet',
  'coc-css',
  'coc-html',
  'coc-json',
  'coc-yank',
  'coc-docthis',
  'coc-prettier',
  'coc-eslint'
}

-----------------------------------------------------------
-- Coc Neovim key bindings
-----------------------------------------------------------
map('n', '[g', '<Plug>(coc-diagnostic-prev)', opts)
map('n', ']g', '<Plug>(coc-diagnostic-next)', opts)

-- GoTo code navigation.
map('n', 'gd', '<Plug>(coc-definition)', opts)
map('n', 'gy', '<Plug>(coc-type-definition)', opts)
map('n', 'gi', '<Plug>(coc-implementation)', opts)
map('n', 'gr', '<Plug>(coc-references)', opts)

-- Hover
map('n', 'K', ':call Show_documentation()<CR>', { noremap=true, silent=true })

-- rename
map('n', '<leader>rn', '<Plug>(coc-rename)', opts)

-- action
map('n', '<leader>a', '<Plug>(coc-codeaction)', opts)

-- navigate chunks of current buffer
map( 'n', '[g', '<Plug>(coc-git-prevchunk)', { noremap=false } )
map('n' , ']g', '<Plug>(coc-git-nextchunk)', { noremap=false } )
-- navigate conflicts of current buffer
map('n' , '[c', '<Plug>(coc-git-prevconflict)', { noremap=false } )
map('n' , ']c', '<Plug>(coc-git-nextconflict)', { noremap=false } )

-----------------------------------------------------------
-- Auto Commands
-----------------------------------------------------------
exec([[
autocmd CursorHold * silent call CocActionAsync('highlight')
]], false)


exec([[
autocmd FileType scss setl iskeyword+=@-@
]], false)

-- exec([[
-- " Always show the signcolumn, otherwise it would shift the text each time
-- " diagnostics appear/become resolved.
-- if has("nvim-0.5.0") || has("patch-8.1.1564")
--   " Recently vim can merge signcolumn and number column into one
--   set signcolumn=number
-- else
--   set signcolumn=yes
-- endif
--
-- ]],false)
-----------------------------------------------------------
-- Custom func
-----------------------------------------------------------
exec([[

function! Show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

]], false)


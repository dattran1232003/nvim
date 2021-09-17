-----------------------------------------------------------
-- Coc Neovim configuration file
-----------------------------------------------------------

local g = vim.g
local exec = vim.api.nvim_exec
local map = vim.api.nvim_set_keymap

local opts = { silent=true  }

g.coc_global_extensions = {
  'coc-git',
  'coc-tsserver',
  'coc-emmet',
  'coc-css',
  'coc-html',
  'coc-json',
  'coc-yank',
  'coc-docthis',
}

-----------------------------------------------------------
-- Coc Neovim key bindings
-----------------------------------------------------------
map('n', '[g', '<Plug>(coc-diagnostic-prev)', opts)
map('n', ']g', '<Plug>(coc-diagnostic-next)', opts)

map('n', 'gd', '<Plug>(coc-definition)', opts)
map('n', 'gy', '<Plug>(coc-type-definition)', opts)
map('n', 'gi', '<Plug>(coc-implementation)', opts)
map('n', 'gr', '<Plug>(coc-references)', opts)

-- Hover
map('n', 'K', ':call <SID>show_documentation()<CR>', { noremap=true, silent=true })

-- rename
map('n', '<leader>rn', '<Plug>(coc-rename)', opts)

-- action
map('n', '<leader>do', '<Plug>(coc-codeaction)', opts)

-- Remap <C-f> and <C-b> for scroll float windows/popups.
exec([[
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  endif
]], false)

-----------------------------------------------------------
-- Auto Commands
-----------------------------------------------------------
exec([[
autocmd CursorHold * silent call CocActionAsync('highlight')
]], false)

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

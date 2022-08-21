-----------------------------------------------------------
-- Neovim settings
--- General Neovim settings
-----------------------------------------------------------

----------------------------------------------------------- Neovim API aliases
-----------------------------------------------------------
--local map = vim.api.nvim_set_keymap  -- set global keymap
local cmd = vim.cmd -- execute Vim commands
local exec = vim.api.nvim_exec -- execute Vimscript
local fn = vim.fn -- call Vim functions
local g = vim.g -- global variables
local opt = vim.opt -- lobal/buffer/windows-scoped options

-----------------------------------------------------------
-- General
-----------------------------------------------------------
opt.laststatus = 3 -- 3 is global status bar
opt.mouse = 'nicr' -- enable mouse for all modes except visual
opt.clipboard = 'unnamedplus' -- copy/paste to system clipboard
opt.swapfile = false -- don't use swapfile
g.shortmess = 'a' -- avoid 'Hit ENTER to continue' prompt
g.cursorhold_updatetime = 500 -- milisecondsq

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
opt.syntax = 'enable' -- enable syntax highlighting
opt.relativenumber = true -- show relative line number
opt.number = true -- show line number
opt.showmatch = true -- highlight matching parenthesis
opt.foldmethod = 'marker' -- enable folding (default 'foldmarker')
opt.colorcolumn = '80' -- line lenght marker at 80 columns
opt.splitright = true -- vertical split to the right
opt.splitbelow = true -- orizontal split to the bottom
opt.ignorecase = true -- ignore case letters when search
opt.smartcase = true -- ignore lowercase for the whole pattern

-- prevent break long line
opt.wrap = false
opt.linebreak = true

-- enable vertical and horizontal line for cursor
opt.cursorline = true
opt.cursorcolumn = true

-- remove whitespace on save
cmd [[au BufWritePre * :%s/\s\+$//e]]

-- highlight on yank
exec([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
  augroup end
]], false)

-- show tab numbers
-- exec([[
-- fu! MyTabLabel(n)
-- let buflist = tabpagebuflist(a:n)
-- let winnr = tabpagewinnr(a:n)
-- let string = fnamemodify(bufname(buflist[winnr - 1]), ':t')
-- return empty(string) ? '[unnamed]' : string
-- endfu
--
-- fu! MyTabLine()
-- let s = ''
-- for i in range(tabpagenr('$'))
-- " select the highlighting
--     if i + 1 == tabpagenr()
--     let s .= '%#TabLineSel#'
--     else
--     let s .= '%#TabLine#'
--     endif
--
--     " set the tab page number (for mouse clicks)
--     "let s .= '%' . (i + 1) . 'T'
--     " display tabnumber (for use with <count>gt, etc)
--     let s .= ' '. (i+1) . ' '
--
--     " the label is made by MyTabLabel()
--     let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
--
--     if i+1 < tabpagenr('$')
--         let s .= ' |'
--     endif
-- endfor
-- return s
-- endfu
-- set tabline=%!MyTabLine()
-- ]], false)


vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = false,
  float = {
    border = 'rounded'
  },
})

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
  vim.lsp.handlers.hover,
  { border = 'rounded' }
)

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
  vim.lsp.handlers.signature_help,
  { border = 'rounded' }
)

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hidden = true -- enable background buffers
opt.history = 100 -- remember n lines in history
opt.lazyredraw = true -- faster scrolling
opt.synmaxcol = 240 -- max column for syntax highlight

-----------------------------------------------------------
-- Colorscheme
-----------------------------------------------------------
opt.termguicolors = true -- enable 24-bit RGB colors

-- configs for gruvbox theme
-- g.gruvbox_italic=1
-- g.gruvbox_invert_selection=0

cmd [[colorscheme nightfox]] -- set colorscheme

-- cursor line block color
-- ref: https://stackoverflow.com/questions/6230490/how-i-can-change-cursor-color-in-color-scheme-vim
exec([[
 if &term =~ "xterm\\|rxvt"
  " use an orange cursor in insert mode
  let &t_SI = "\<Esc>]12;orange\x7"
  " use a red cursor otherwise
  let &t_EI = "\<Esc>]12;red\x7"
  silent !echo -ne "\033]12;red\007"
  " reset cursor when vim exits
  autocmd VimLeave * silent !echo -ne "\033]112\007"
  " use \003]12;gray\007 for gnome-terminal
endif
]], false)

exec([[
if has('autocmd')
  augroup coloroverride
  autocmd!
  autocmd ColorScheme * highlight LineNr  ctermfg=DarkGrey guifg=DarkGrey " Override LineNr
  augroup END
  endif
]], false)

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.expandtab = true -- use spaces instead of tabs
opt.shiftwidth = 2 -- shift 4 spaces when tab
opt.tabstop = 1 -- 1 tab == 4 spaces
opt.smartindent = true -- autoindent new lines

-- don't auto commenting new lines
cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]

-- remove line lenght marker for selected filetypes
cmd [[autocmd FileType text,markdown,xml,html,xhtml,javascript setlocal cc=0]]

-- 2 spaces for selected filetypes
cmd [[
  autocmd FileType xml,html,xhtml,css,scss,javascript,lua,yaml setlocal shiftwidth=2 tabstop=2
]]

-- IndentLine
--g.indentLine_setColors = 0  -- set indentLine color
g.indentLine_char = '|' -- set indentLine character

-- disable IndentLine for markdown files (avoid concealing)
cmd [[autocmd FileType markdown let g:indentLine_enabled=0]]


-----------------------------------------------------------
-- Vertical navigation height
-----------------------------------------------------------
exec([[
augroup SetScrollHeight
autocmd!
autocmd BufEnter * silent! set scroll=10
augroup end
]], false)
-----------------------------------------------------------
-- Autocompletion
-----------------------------------------------------------
opt.completeopt = 'menuone,noselect,noinsert' -- completion options
opt.shortmess = 'c' -- don't show completion messages
opt.laststatus = 3 -- 3 is global status bar

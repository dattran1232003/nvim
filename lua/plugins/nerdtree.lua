-----------------------------------------------------------
-- Nerdtree configuration file
-----------------------------------------------------------
local g = vim.g
local opt = vim.opt
local exec = vim.api.nvim_exec
local map = vim.api.nvim_set_keymap

g.NERDCreateDefaultMappings = 1

-- quit on open
g.NERDTreeQuitOnOpen=1

-- show line number
g.NERDTreeShowLineNumbers=1

-- Add spaces after comment delimiters by default
g.NERDSpaceDelims = 1

-- Use compact syntax for prettified multi-line comments
g.NERDCompactSexyComs = 1

-- Align line-wise comment delimiters flush left instead of following code indentation
g.NERDDefaultAlign = 'left'

-- Set a language to use its alternate delimiters by default
g.NERDAltDelims_java = 1

-- Add your own custom formats or override the defaults
g.NERDCustomDelimiters = { c = { left = '/**', right = '*/' } }

-- Allow commenting and inverting empty lines (useful when commenting a region)
g.NERDCommentEmptyLines = 1

-- Enable trimming of trailing whitespace when uncommenting
g.NERDTrimTrailingWhitespace = 1

-- Enable NERDCommenterToggle to check all selected lines is commented or not
g.NERDToggleCheckAllLines = 1

-- fix navigator jumping
g.NERDTreeMapJumpPrevSibling = ""
g.NERDTreeMapJumpNextSibling = ""

-- Bar font
g.airline_powerline_fonts = 1
g.NERDTreeDirArrowExpandable = '▸'
g.NERDTreeDirArrowCollapsible = '▾'

-----------------------------------------------------------
-- Nerdtree key bindings
-----------------------------------------------------------
exec([[
function! CurrentDirNERDTreeToggle()
    if &filetype == 'nerdtree' || exists("g:NERDTree") && g:NERDTree.IsOpen()
        :NERDTreeToggle
    else
        :NERDTreeFind
    endif
endfunction
]], true)

map('n', '`', ':NERDTreeToggle<CR>', { noremap = false })
map('n', '<F4>', ':call CurrentDirNERDTreeToggle()<CR>', { noremap = false })


-----------------------------------------------------------
-- Nerdtree auto CMD
-----------------------------------------------------------

exec([[
augroup nerdtree_cmds
  autocmd!
" auto-cmd here
augroup end
]], true)

local  telescope_builtin = require'telescope.builtin'

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)

require("nvim-lsp-installer").setup {}

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local default_on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'vim.lsp.omnifunc')
  client.resolved_capabilities.document_formatting = false

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', telescope_builtin.lsp_definitions, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', telescope_builtin.lsp_implementations, bufopts)
  vim.keymap.set('n', 'gy', telescope_builtin.lsp_type_definitions, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', telescope_builtin.lsp_references, bufopts)
  vim.keymap.set('n', '<leader>f', vim.lsp.buf.formatting, bufopts)

  vim.api.nvim_exec([[
  autocmd CursorHold * lua vim.diagnostic.open_float()
  ]], false)
end


local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local lsp_defaults = {
  flags = {
    debounce_text_changes = 130,
  },
  capabilities = capabilities,
  on_attach = default_on_attach,
}

local lspconfig = require('lspconfig')

lspconfig.util.default_config = vim.tbl_deep_extend(
  'force',
  lspconfig.util.default_config,
  lsp_defaults
)

-- Python
require('lspconfig')['pyright'].setup {}

-- Typescript
require('lspconfig')['tsserver'].setup {}

-- Rust
require('lspconfig')['rust_analyzer'].setup{
    -- Server-specific settings...
    settings = {
      ["rust-analyzer"] = {}
    }
}

-- Golang
require'lspconfig'.golangci_lint_ls.setup{
    cmd = { "golangci-lint-langserver" },
    filetypes = { "go", "gomod" },
}
require'lspconfig'.gopls.setup{
}

-- Lua (not working yet)
require'lspconfig'.sumneko_lua.setup{
    cmd = { "lua-language-server" },
    filetypes = { "lua" }
}




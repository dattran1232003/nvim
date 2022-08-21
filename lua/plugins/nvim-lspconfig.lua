-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)

require("nvim-lsp-installer").setup {}
require('modules.config.lsp.null-ls').setup()
require('modules.config.lsp.handlers').enable_format_on_save()

local lspconfig = require('lspconfig')
local lsp_installer = require 'nvim-lsp-installer'
local handlers = require('modules.config.lsp.handlers')
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer


local servers = {
  'pyright',
  'cssls',
  'emmet_ls',
  -- 'eslint',
  'jsonls',
  'sumneko_lua',
  'tailwindcss',
  'tsserver',
  'rust_analyzer',
  'gopls',
  'golangci_lint_ls'
}

local servers_config = {
  -- https://github.com/pedro757/emmet
  -- npm i -g ls_emmet (In order to override the default emmet-ls)
  emmet_ls = {
    filetypes = { 'html', 'css', 'scss', 'sass', 'javascript', 'javascriptreact', 'typescriptreact' },
  },
  jsonls = {
    settings = {
      json = {
        schemas = require('schemastore').json.schemas(),
      },
    },
  },
  sumneko_lua = {
    settings = {
      Lua = {
        diagnostics = {
          globals = { 'vim' },
        },
      },
    },
  },
  rust_analyzer = {
    -- Server-specific settings...
    settings = {
      ["rust-analyzer"] = {}
    }
  }
}

local lsp_defaults = {
  flags = {
    debounce_text_changes = 130,
  },
  capabilities = handlers.capabilities,
  on_attach = handlers.on_attach,
}

lspconfig.util.default_config = vim.tbl_deep_extend(
  'force',
  lspconfig.util.default_config,
  lsp_defaults
)
for _, name in pairs(servers) do
  local server_is_found, server = lsp_installer.get_server(name)
  if server_is_found and not server:is_installed() then
    server:install()
  end
  local config = servers_config[server.name] or {}
  lspconfig[name].setup(config)
end

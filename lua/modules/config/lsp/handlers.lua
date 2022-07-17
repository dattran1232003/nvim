local M  = {}

function M.enable_format_on_save()
  vim.cmd [[
    augroup format_on_save
      au!
      " au BufWritePre *.js,*.jsx,*.ts,*.tsx EslintFixAll
      au BufWritePre * lua vim.lsp.buf.formatting_sync(nil, 2000)
    augroup end
  ]]
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
local cmp_nvim_lsp = require 'cmp_nvim_lsp'
if cmp_nvim_lsp then
  capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
end
M.capabilities = capabilities

function M.toggle_format_on_save()
  if vim.fn.exists '#format_on_save#BufWritePre' == 0 then
    M.enable_format_on_save()
    vim.notify 'Enabled format on save'
  else
    vim.cmd 'au! format_on_save'
    vim.notify 'Disabled format on save'
  end
end

M.on_attach = function(client, bufnr)
  local telescope_builtin = require'telescope.builtin'
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'vim.lsp.omnifunc')
  -- client.resolved_capabilities.document_formatting = false

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
  autocmd CursorHold * lua vim.diagnostic.open_float(nil, {focus=false})
  ]], false)
end



vim.cmd ([[command! LspToggleAutoFormat execute 'lua require("modules.config.lsp.handlers").toggle_format_on_save()']], false)

return M

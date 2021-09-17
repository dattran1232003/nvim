local nvim_lsp = require("lspconfig")

local system_name
if vim.fn.has("mac") == 1 then
  system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
  system_name = "Linux"
elseif vim.fn.has('win32') == 1 then
  system_name = "Windows"
else
  print("Unsupported system for sumneko")
end

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { noremap=true, silent=true }

  vim.cmd("command! LspDef lua vim.lsp.buf.definition()")
  vim.cmd("command! LspFormatting lua vim.lsp.buf.formatting()")
  vim.cmd("command! LspCodeAction lua vim.lsp.buf.code_action()")
  vim.cmd("command! LspHover lua vim.lsp.buf.hover()")
  vim.cmd("command! LspRename lua vim.lsp.buf.rename()")
  vim.cmd("command! LspOrganize lua lsp_organize_imports()")
  vim.cmd("command! LspRefs lua vim.lsp.buf.references()")
  vim.cmd("command! LspTypeDef lua vim.lsp.buf.type_definition()")
  vim.cmd("command! LspImplementation lua vim.lsp.buf.implementation()")
  vim.cmd("command! LspDiagPrev lua vim.lsp.diagnostic.goto_prev()")
  vim.cmd("command! LspDiagNext lua vim.lsp.diagnostic.goto_next()")
  vim.cmd("command! LspDiagLine lua vim.lsp.diagnostic.show_line_diagnostics()")
  vim.cmd("command! LspSignatureHelp lua vim.lsp.buf.signature_help()")

  -- buf_set_keymap("n", "gi", ":LspImplementation<CR>", opts)
  buf_set_keymap("n", "gd", ":LspDef<CR>", opts)
  buf_set_keymap("n", "gr", ":LspRename<CR>", opts)
  buf_set_keymap("n", "gR", ":LspRefs<CR>", opts)
  buf_set_keymap("n", "gy", ":LspTypeDef<CR>", opts)
  buf_set_keymap("n", "K", ":LspHover<CR>", opts)
  buf_set_keymap("n", "gs", ":LspOrganize<CR>", opts)
  buf_set_keymap("n", "[a", ":LspDiagPrev<CR>", opts)
  buf_set_keymap("n", "]a", ":LspDiagNext<CR>", opts)
  buf_set_keymap("n", "ga", ":LspCodeAction<CR>", opts)
  buf_set_keymap("n", "<Leader>a", ":LspDiagLine<CR>", opts)
  buf_set_keymap("i", "<C-x><C-x>", "<cmd> LspSignatureHelp<CR>", opts)

  if client.resolved_capabilities.document_formatting then
    vim.api.nvim_exec([[
    augroup LspAutocommands
    autocmd! * <buffer>
    autocmd BufWritePost <buffer> LspFormatting
    augroup END
    ]], true)
  end

end


-- LSPs
local servers = {
  'pyright',
  'tsserver',
  'dockerls',
  -- 'angularls',
  -- 'sumneko_lua',
  'rust_analyzer',
}

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    },
    init_options = {
      onlyAnalyzeProjectsWithOpenFiles = true,
      suggestFromUnimportedLibraries = false,
      closingLabels = true,
    }
  }
end

local format_async = function(err, _, result, _, bufnr)
  if err ~= nil or result == nil then return end
  if not vim.api.nvim_buf_get_option(bufnr, "modified") then
    local view = vim.fn.winsaveview()
    vim.lsp.util.apply_text_edits(result, bufnr)
    vim.fn.winrestview(view)
    if bufnr == vim.api.nvim_get_current_buf() then
      vim.api.nvim_command("noautocmd :update")
    end
  end
end

_G.lsp_organize_imports = function()
  local params = {
    command = "_typescript.organizeImports",
    arguments = {vim.api.nvim_buf_get_name(0)},
    title = ""
  }
  vim.lsp.buf.execute_command(params)
end

local filetypes = {
  typescript = "eslint",
  typescriptreact = "eslint",

  javascript = 'eslint',
  javascriptreact = "eslint",
}
local linters = {
  eslint = {
    sourceName = "eslint",
    command = "eslint_d",
    rootPatterns = {".eslintrc.json", ".eslintrc.js", "package.json"},
    debounce = 100,
    args = {"--stdin", "--stdin-filename", "%filepath", "--format", "json"},
    parseJson = {
      errorsRoot = "[0].messages",
      line = "line",
      column = "column",
      endLine = "endLine",
      endColumn = "endColumn",
      message = "${message} [${ruleId}]",
      security = "severity"
    },
    securities = {[2] = "error", [1] = "warning"}
  }
}
local formatters = {
  prettier = {command = "prettier", args = {"--stdin-filepath", "%filepath"}}
}
local formatFiletypes = {
  typescript = "prettier",
  typescriptreact = "prettier"

}

-----------------------------------------------------------
-- Language Configs
-----------------------------------------------------------
nvim_lsp.diagnosticls.setup {
  on_attach = on_attach,
  filetypes = vim.tbl_keys(filetypes),
  init_options = {
    filetypes = filetypes,
    linters = linters,
    formatters = formatters,
    formatFiletypes = formatFiletypes
  }
}

nvim_lsp.tsserver.setup {
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
    on_attach(client)
  end
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

nvim_lsp.html.setup {
  capabilities = capabilities,
  on_attach = on_attach
}

-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
local sumneko_root_path = vim.fn.stdpath('cache')..'/lspconfig/sumneko_lua/lua-language-server'
local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

nvim_lsp.sumneko_lua.setup {
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}


nvim_lsp.angularls.setup {
  on_attach = on_attach,
}

-----------------------------------------------------------
-- handlers
-----------------------------------------------------------
vim.lsp.handlers["textDocument/formatting"] = format_async
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = {
      prefix = "»",
      spacing = 4,
    }
  }
)

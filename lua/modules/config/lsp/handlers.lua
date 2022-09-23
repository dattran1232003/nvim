local M = {}

function M.enable_format_on_save()
    vim.cmd([[
    augroup format_on_save
      au!
      " au BufWritePre *.js,*.jsx,*.ts,*.tsx EslintFixAll
      au BufWritePre * lua vim.lsp.buf.formatting_sync({ async = false, timeout_ms = 5000 }, 5000)
    augroup end
  ]])
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local cmp_nvim_lsp = require("cmp_nvim_lsp")
local goto_preview = require("goto-preview")

if cmp_nvim_lsp then
    capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
end
M.capabilities = capabilities

function M.toggle_format_on_save()
    if vim.fn.exists("#format_on_save#BufWritePre") == 0 then
        M.enable_format_on_save()
        vim.notify("Enabled format on save")
    else
        vim.cmd("au! format_on_save")
        vim.notify("Disabled format on save")
    end
end

M.on_attach = function(client, bufnr)
    client.server_capabilities.document_formatting = false
    local telescope_builtin = require("telescope.builtin")
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "vim.lsp.omnifunc")
    -- client.resolved_capabilities.document_formatting = false

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
    -- jump_type: "tab", "split", "vsplit", "never"
    vim.keymap.set("n", "gd", function()
        telescope_builtin.lsp_definitions({ jump_type = "tab" })
    end, bufopts)
    vim.keymap.set("n", "gpd", goto_preview.goto_preview_definition, bufopts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
    vim.keymap.set("n", "gi", telescope_builtin.lsp_implementations, bufopts)
    vim.keymap.set("n", "gpi", goto_preview.goto_preview_implementation, bufopts)
    vim.keymap.set("n", "gy", telescope_builtin.lsp_type_definitions, bufopts)
    vim.keymap.set("n", "gpy", goto_preview.goto_preview_type_definition, bufopts)
    vim.keymap.set("n", "gP", goto_preview.close_all_win, bufopts)
    vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set("n", "<leader>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
    vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, bufopts)
    vim.keymap.set("n", "gr", telescope_builtin.lsp_references, bufopts)
    vim.keymap.set("n", "gpr", goto_preview.goto_preview_references, bufopts)
    vim.keymap.set("n", "<leader>f", vim.lsp.buf.formatting, bufopts)

    vim.api.nvim_exec(
        [[
  autocmd CursorHold * silent lua vim.diagnostic.open_float(nil, {focus=false})
  ]],
        false
    )

    client.server_capabilities.document_formatting = true -- 0.7 and earlier
    client.resolved_capabilities.document_formatting = false
    client.server_capabilities.documentFormattingProvider = false -- 0.8 and later
    client.server_capabilities.documentRangeFormattingProvider = false

    if client.name == "tsserver" then
        client.server_capabilities.document_formatting = true -- 0.7 and earlier
        client.resolved_capabilities.document_formatting = false
        client.server_capabilities.documentFormattingProvider = false -- 0.8 and later
        client.server_capabilities.documentRangeFormattingProvider = false

        M.enable_format_on_save()
        -- vim.cmd([[command! LspToggleAutoFormat execute 'lua require("modules.config.lsp.handlers").toggle_format_on_save()']]
        --   ,
        --   false)
    end

    if client.name == "sumneko_lua" then
        M.enable_format_on_save()
    end

    if (client.name == "golangci_lint_ls") or (client.name == "gopls") then
        M.enable_format_on_save()
    end
end

return M

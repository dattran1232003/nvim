local M = {}

M.setup = function()
  local null_ls = require 'null-ls'
  if not null_ls then
    return
  end

  local format = null_ls.builtins.formatting
  local code_actions = null_ls.builtins.code_actions
  local diagnostics = null_ls.builtins.diagnostics
  local completion = null_ls.builtins.completion

  null_ls.setup {
    sources = {
      format.prettierd,
      format.stylua,

      code_actions.eslint_d,
      code_actions.gitsigns,

      completion.luasnip,

      diagnostics.eslint_d.with({
        diagnostics_format = '[eslint] #{m}\n(#{c})'
      }),
      diagnostics.fish,
    },
  }
end

return M

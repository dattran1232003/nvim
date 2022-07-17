local M = {}

M.setup = function()
  local null_ls = require 'null-ls'
  if not null_ls then
    return
  end

  local format = null_ls.builtins.formatting
  local code_action = null_ls.builtins.code_actions
  local diagnostics = null_ls.builtins.diagnostics

  null_ls.setup {
    sources = {
      format.prettierd,
      format.stylua,
    },
  }
end

return M

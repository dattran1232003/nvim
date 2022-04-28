-- ref: https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#Javascript

local dap = require('dap')
local map = vim.api.nvim_set_keymap


-- NodeJS
dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = {os.getenv('HOME') .. '/debug-adapters/vscode-node-debug2/out/src/nodeDebug.js'},
}
dap.configurations.javascript = {
  {
    name = 'Launch',
    type = 'node2',
    request = 'launch',
    program = '${file}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    console = 'integratedTerminal',
  },
  {
    -- For this to work you need to make sure the node process is started with the `--inspect` flag.
    name = 'Attach to process',
    type = 'node2',
    request = 'attach',
    processId = require'dap.utils'.pick_process,
  },
}


-- Chrome JavaScript
dap.adapters.chrome = {
    type = "executable",
    command = "node",
    args = {os.getenv("HOME") .. "/debug-adapters/vscode-chrome-debug/out/src/chromeDebug.js"} -- TODO adjust
}

dap.configurations.javascriptreact = { -- change this to javascript if needed
    {
        type = "chrome",
        request = "attach",
        program = "${file}",
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = "inspector",
        port = 9222,
        webRoot = "${workspaceFolder}"
    }
}

dap.configurations.typescriptreact = { -- change to typescript if needed
    {
        type = "chrome",
        request = "attach",
        program = "${file}",
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = "inspector",
        port = 9222,
        webRoot = "${workspaceFolder}"
    }
}

-- styles
 require('dap')
vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})

-- key mappings

local opts = { noremap=true }

map('n', '<leader>dt', ':lua require"dap".toggle_breakpoint()<CR>', opts)
map('n', '<leader>dG', ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opts)
-- map('n', '<leader>dL', ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", opts)
-- map('n', '<c-k>', ':lua require"dap".step_out()<CR>', opts)
-- map('n', "<c-l>", ':lua require"dap".step_into()<CR>', opts)
-- map('n', '<c-j>', ':lua require"dap".step_over()<CR>', opts)
-- map('n', '<c-h>', ':lua require"dap".continue()<CR>', opts)
map('n', '<leader>dn', ':lua require"dap".run_to_cursor()<CR>', opts)
map('n', '<leader>dk', ':lua require"dap".up()<CR>zz', opts)
map('n', '<leader>dj', ':lua require"dap".down()<CR>zz', opts)
map('n', '<leader>dc', ':lua require"dap".terminate()<CR>', opts)
map('n', '<leader>dr', ':lua require"dap".repl.toggle({}, "vsplit")<CR><C-w>l', opts)
map('n', '<leader>dR', ':lua require"dap".clear_breakpoints()<CR>', opts)
map('n', '<leader>de', ':lua require"dap".set_exception_breakpoints({"all"})<CR>', opts)
map('n', '<leader>da', ':lua require"helpers/debug-helper".attach()<CR>', opts)
map('n', '<leader>dA', ':lua require"helpers/debug-helper".attachToRemote()<CR>', opts)
map('n', '<leader>di', ':lua require"dap.ui.widgets".hover()<CR>', opts)
map('n', '<leader>d?', ':lua local widgets=require"dap.ui.widgets";widgets.centered_float(widgets.scopes)<CR>', opts)

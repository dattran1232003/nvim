local g = vim.g
local map = vim.api.nvim_set_keymap

-- C/C++
g.runner_c_compiler = 'gcc'
g.runner_cpp_compiler = 'g++'
g.runner_c_options = '-std=c99'
g.runner_cpp_options = '-std=c++17'

-- Python
g.runner_python_ex = 'python3'
g.runner_python_options = ''


-- KEY BINDINGS
map('n', '<F5>', ':NeoRunner<CR>', { silent=true })

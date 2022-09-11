local map = vim.api.nvim_set_keymap
local telescope = require("telescope")
local builtin = require("telescope.builtin")

-- nvim-telescope/telescope-dap.nvim
telescope.setup({
    defaults = {
        file_ignore_patterns = {
            "cache-loader",
            -- images
            ".svg$",
            ".png$",
            ".jpeg$",
            ".jpg$",
            ".gif$",
            "*.ico$",
            -- git folder
            ".git",
        },
        path_display = { "smart" },
    },
    pickers = {
        grep_string = {
            path_display = { "shorten" },
        },
    },
    extensions = {
        fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
        },
    },
    ["ui-select"] = {
        require("telescope.themes").get_dropdown({}),
    },
})
telescope.load_extension("ui-select")
telescope.load_extension("dap")
telescope.load_extension("fzf")

-- key mappings
local opts = { noremap = true, silent = true }

map("n", "<leader>ds", ":Telescope dap frames<CR>", opts)

map("n", "<leader>db", ":Telescope dap list_breakpoints<CR>", opts)

map("n", "<c-p>", "<cmd>Telescope find_files hidden=true<cr>", opts)

map("n", "<c-n>", "<cmd>lua require'telescope.builtin'.grep_string({ search='' })<cr>", opts)

vim.keymap.set("n", "<leader>d", function()
    builtin.diagnostics()
end)

vim.keymap.set("n", "<leader>rr", function()
    builtin.live_grep()
end)

vim.keymap.set("n", "<leader><leader>", function()
    builtin.resume()
end)

map(
    "n",
    "<cr>",
    "<cmd>lua require'telescope.builtin'.current_buffer_fuzzy_find({ sorter = require('telescope.sorters').get_substr_matcher({})})<cr>",
    { noremap = false, silent = true }
)

map("n", "fb", "<cmd>Telescope buffers<cr>", opts)

map("n", "fh", "<cmd>Telescope help_tags<cr>", opts)

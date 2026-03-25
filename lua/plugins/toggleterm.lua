return {
  "akinsho/toggleterm.nvim",
  version = "*",
  keys = {
    { "<C-/>", desc = "Toggle Horizontal Terminal (count for #)" },
    { [[<C-\>]], desc = "Toggle Vertical Terminal" },
  },
  opts = {
    size = function(term)
      if term.direction == "horizontal" then
        return 15
      elseif term.direction == "vertical" then
        return vim.o.columns * 0.4
      end
    end,
    direction = "horizontal",
    shade_terminals = true,
    shading_factor = 2,
    persist_size = true,
    persist_mode = true,
    close_on_exit = true,
    shell = vim.o.shell,
    float_opts = {
      border = "curved",
      winblend = 3,
    },
  },
  config = function(_, opts)
    require("toggleterm").setup(opts)

    -- <C-/> = horizontal terminals (1<C-/>, 2<C-/>, 3<C-/>)
    vim.keymap.set({ "n", "t" }, "<C-/>", function()
      require("toggleterm").toggle(vim.v.count1, nil, nil, "horizontal")
    end, { desc = "Toggle Horizontal Terminal #" })

    -- <C-\> = vertical terminal
    vim.keymap.set({ "n", "t" }, [[<C-\>]], function()
      require("toggleterm").toggle(0, nil, nil, "vertical")
    end, { desc = "Toggle Vertical Terminal" })

    -- Terminal mode keymaps
    function _G.set_terminal_keymaps()
      local kopts = { buffer = 0 }
      vim.keymap.set("t", "<Esc><Esc>", [[<C-\><C-n>]], kopts)
      vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], kopts)
      vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], kopts)
      vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], kopts)
      vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], kopts)
      -- Resize terminal splits
      vim.keymap.set("t", "<C-Up>", [[<Cmd>resize +2<CR>]], kopts)
      vim.keymap.set("t", "<C-Down>", [[<Cmd>resize -2<CR>]], kopts)
      vim.keymap.set("t", "<C-Right>", [[<Cmd>vertical resize +2<CR>]], kopts)
      vim.keymap.set("t", "<C-Left>", [[<Cmd>vertical resize -2<CR>]], kopts)
    end

    vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
  end,
}

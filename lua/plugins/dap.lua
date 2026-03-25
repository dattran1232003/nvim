return {
  -- DAP UI
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    keys = {
      { "<leader>du", function() require("dapui").toggle() end, desc = "Dap UI" },
      { "<leader>de", function() require("dapui").eval() end, desc = "Eval", mode = { "n", "v" } },
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
      dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
      dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end
    end,
  },

  -- JavaScript/TypeScript debug adapter (vscode-js-debug)
  {
    "mxsdev/nvim-dap-vscode-js",
    ft = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
    dependencies = {
      "mfussenegger/nvim-dap",
      {
        "microsoft/vscode-js-debug",
        version = "1.*",
        build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && rm -rf out && mv dist out",
      },
    },
    config = function()
      require("dap-vscode-js").setup({
        debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
        adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "pwa-extensionHost" },
      })

      local dap = require("dap")
      local js_filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" }

      -- Alias adapters so launch.json "type" values resolve correctly
      dap.adapters.chrome = dap.adapters["pwa-chrome"]
      dap.adapters["node"] = dap.adapters["pwa-node"]
      dap.adapters["node-terminal"] = dap.adapters["pwa-node"]

      -- Default configurations for JS/TS filetypes
      for _, ft in ipairs(js_filetypes) do
        if not dap.configurations[ft] then
          dap.configurations[ft] = {}
        end
        vim.list_extend(dap.configurations[ft], {
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch file",
            program = "${file}",
            cwd = "${workspaceFolder}",
          },
          {
            type = "pwa-node",
            request = "attach",
            name = "Attach",
            processId = require("dap.utils").pick_process,
            cwd = "${workspaceFolder}",
          },
          {
            type = "pwa-chrome",
            request = "launch",
            name = "Launch Chrome",
            url = "http://localhost:3000",
            webRoot = "${workspaceFolder}/src",
          },
        })
      end

      -- Load .vscode/launch.json if it exists
      local vscode = require("dap.ext.vscode")
      vscode.load_launchjs(nil, {
        chrome = js_filetypes,
        ["pwa-chrome"] = js_filetypes,
        ["pwa-node"] = js_filetypes,
        ["node"] = js_filetypes,
        ["node-terminal"] = js_filetypes,
      })
    end,
  },
}

return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "leoluz/nvim-dap-go",
      "rcarriga/nvim-dap-ui",
      "suketa/nvim-dap-ruby",
    },
    config = function()
      require("dapui").setup()
      require("dap-go").setup()
      require("dap-ruby").setup()

      local dap, dapui = require("dap"), require("dapui")

      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end

      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end

      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end

      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end

      -- Mappings: edit: e, expand: <CT> or left click, open: o, remove: d, repl: r,
      -- toggle: t
      vim.keymap.set("n", "<F9>", ":DapToggleBreakpoint<CR>", { desc = "Toggle breakpoint" })
      vim.keymap.set("n", "<F5>", ":DapContinue<CR>", { desc = "Continue debugging" })
      vim.keymap.set("n", "<S-F5>", ":DapTerminate<CR>", { desc = "Quit debugging" })
      vim.keymap.set("n", "<F10>", ":DapStepOver<CR>", { desc = "Step over" })
      vim.keymap.set("n", "<F11>", ":DapStepInto<CR>", { desc = "Step into" })
      vim.keymap.set("n", "<S-F11>", ":DapStepOut<CR>", { desc = "Step out" })
    end
  },
}

return {
    "rcarriga/nvim-dap-ui",
    dependencies = {
        "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"
    },
    config = function ()
        local dap, dapui = require("dap"), require("dapui")
        local map = vim.keymap.set

        dapui.setup()

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

        map("n", "<leader>dut", dapui.toggle, { desc = "Toggle nvim-dap-ui" })


    end
}

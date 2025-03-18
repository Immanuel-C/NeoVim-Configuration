return {
    "mfussenegger/nvim-dap",
    config = function ()
        local dap = require("dap")

        local map = vim.keymap.set
        map("n", "<leader>db", dap.toggle_breakpoint, {});
        map("n", "<leader>dr", dap.continue, {});
        map("n", "<leader>ds", dap.step_over, {});
        map("n", "<leader>di", dap.step_into, {});
        map("n", "<leader>do", dap.step_out, {});
        map("n", "<leader>dl", dap.run_last, {});
        map("n", "<leader>dt", dap.terminate, {});

        dap.adapters.codelldb = {
            type = "executable",
            command = "codelldb",
        }

        local pickers = require("telescope.pickers")
        local finders = require("telescope.finders")
        local conf = require("telescope.config").values
        local actions = require("telescope.actions")
        local action_state = require("telescope.actions.state")

        dap.configurations.cpp = {
            {
                name = "Launch Program",
                type = "codelldb",
                request = "launch",
                program = function()
                  return coroutine.create(function(coro)
                    local opts = {}
                    pickers
                      .new(opts, {
                        prompt_title = "Path to executable",
                        finder = finders.new_oneshot_job({ "fd", "--hidden", "--no-ignore", "--type", "x" }, {}),
                        sorter = conf.generic_sorter(opts),
                        attach_mappings = function(buffer_number)
                          actions.select_default:replace(function()
                            actions.close(buffer_number)
                            coroutine.resume(coro, action_state.get_selected_entry()[1])
                          end)
                          return true
                        end,
                      })
                      :find()
                  end)
                end,
                cwd = '${workspaceFolder}',
                stopOnEntry = false,
            }
        }

        dap.configurations.c = dap.configurations.cpp;
        dap.configurations.rust = dap.configurations.cpp;
    end
}

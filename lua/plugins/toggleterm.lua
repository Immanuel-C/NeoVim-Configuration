return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
        require("toggleterm").setup({
            size = 100,
            open_mapping = "<C-t>",
            hide_numbers = true,
            shade_filetypes = { "*.cpp" },
            shader_terminal = true,
            shader_factor = 2,
            start_in_insert = true,
            persist_size = true,
            direction = "vertical",
            close_on_exit = true,
            shell = vim.o.shell,
            float_opts = {
                border = "curved",
                winblend = 0,
                highlights = {
                    border = "Normal",
                    background = "Normal"
                }
            },
        })

        local lazygit_term = require("toggleterm.terminal").Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })

        function __LAZYGIT_TOGGLE()
            lazygit_term:toggle()
        end

        vim.keymap.set("n", "<C-l>", "<cmd>lua __LAZYGIT_TOGGLE()<CR>", { noremap = true, silent = true })

        local c_cpp_build_term = require("toggleterm.terminal").Terminal:new({
            cmd = "cmake -G \"Unix Makefiles\" && make",
            dir = ".",
            hidden = true,
            direction = "float",
            close_on_exit = false
        })

        function __C_CPP_BUILD_TOGGLE()
            c_cpp_build_term:toggle()
        end

        vim.keymap.set("n", "<C-b>", "<cmd>lua __C_CPP_BUILD_TOGGLE()<CR>", { noremap = true, silent = true })

    end,
}

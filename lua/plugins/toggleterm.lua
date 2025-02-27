return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
        require("toggleterm").setup({
            size = 100,
            open_mapping = "<C-t>",
            hide_numbers = true,
            shade_filetypes = {},
            shader_terminal = true,
            shader_factor = 2,
            start_in_insert = true,
            persist_size = true,
            direction = "vertical",
            close_on_exit = true,
            shell = vim.o.shell,
        })
    end,
}

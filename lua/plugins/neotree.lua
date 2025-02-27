return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        local map = vim.keymap.set
        map("n", "<leader>n", ":Neotree toggle<CR>", { noremap = true, silent = true })

        require("neo-tree").setup({
            window = {
                position = "bottom"
            }
        })
    end
}

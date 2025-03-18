return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function ()
        require("lualine").setup({
            options = {
                fmt = string.lower,
                icons_enabled = true,
                theme = "gruvbox",
                component_separators = { left = '', right = ''},
                section_separators = { left = '', right = ''},
                s = {
                    statusline = {},
                    winbar = {},
                },
                ignore_focus = {},
                always_divide_middle = true,
                always_show_tabline = true,
                globalstatus = false,
                refresh = {
                  statusline = 100,
                  tabline = 100,
                  winbar = 100,
                }
            },
            sections = {
                lualine_a = {'mode'},
                lualine_b = {'branch', 'diff', 'diagnostics'},
                lualine_c = {
                    {
                        'filename',
                        path = 1,
                        file_status = true,
                        -- No lower case on file paths.
                        fmt = function (str)
                            return str
                        end
                    }
                },


                lualine_x = { "os.date('%A %B %d, %Y %I:%M:%S %p')" },
                lualine_y = {
                    'encoding',
                    {
                        "filename",
                        -- Just wanted to override the default with a funny penguin icon.
                        fmt = function()
                            return ' ';
                        end,
                    },
                    "filetype"
                },
                lualine_z = {'progress', "location" }
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {'filename'},
                lualine_x = {'location'},
                lualine_y = {},
                lualine_z = {}
            },
            tabline = {},
            winbar = {},
            inactive_winbar = {},
            extensions = {
                "toggleterm",
                "nvim-dap-ui",
                "neo-tree",
                "mason",
                "lazy",
            }
        })
    end
}

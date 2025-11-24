require("core.options")
require("core.keymaps")

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)



vim.g.rustaceanvim = {
  server = {
    default_settings = {
      ["rust-analyzer"] = {
        rustup = {
          enabled = true,
        },
        cargo = {
          sysroot = vim.fn.systemlist("rustc --print sysroot")[1],
        },
        diagnostics = {
          disabled = { "unlinked-file" }, -- allow standalone files
        },
        files = {
          excludeDirs = {}, -- ensure nothing extra is excluded
        },
      },

    },
    settings = {
      ["rust-analyzer"] = {
        diagnostics = {
          disabled = { "unlinked-file" }, -- allow standalone files
        },
        files = {
          excludeDirs = {}, -- ensure nothing extra is excluded
        },
      detectDetachedFiles = true,
      },
    },
  },
}

require("lazy").setup({
    require("plugins.neotree"),
    require("plugins.gruvbox"),
    require("plugins.treesitter"),
    require("plugins.telescope"),
    require("plugins.lsp"),
    require("plugins.autocompletion"),
    require("plugins.autopairs"),
    require("plugins.toggleterm"),
    require("plugins.dap"),
    require("plugins.rustaceanvim"),
    require("plugins.dap-ui"),
    require("plugins.todo-comments"),
    require("plugins.lualine"),
    require("plugins.leetcode"),
})


-- local cmp_capabilities = require('cmp_nvim_lsp').default_capabilities()
--
-- vim.g.rustaceanvim = {
--   server = {
--     default_settings = {
--       ["rust-analyzer"] = {
--         rustup = {
--           enabled = true,
--         },
--         cargo = {
--           sysroot = vim.fn.systemlist("rustc --print sysroot")[1],
--         },
--       },
--
--     },
--
--     capabilities = cmp_capabilities,
--   },
-- }


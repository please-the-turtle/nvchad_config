local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  --------------------------
  -- My plugins additions --
  --------------------------

  -- Saving/loading sessions
  {
    'rmagatti/auto-session',
    config = function()
      require("auto-session").setup {
        log_level = "error",
        auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
      }
    end
  },

  -- Running live server
  -- Use :LiveServerStart and :LiveServerStop
  {
    'barrett-ruth/live-server.nvim',
    build = 'yarn global add live-server',
    cmd = { 'LiveServerStart', 'LiveServerStop' },
    config = true
  },

  -- Used for vim.input, vim.select drawing UI panels
  {
    'stevearc/dressing.nvim',
  },

  -- Sets vim.ui.select to telescope
  {
    'nvim-telescope/telescope-ui-select.nvim',
  },

  {
    'nvim-telescope/telescope.nvim',
    opts = overrides.telescope
  },

  -- Go language server
  {
    "ray-x/go.nvim",
    dependencies = {  -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()
      vim.cmd("autocmd FileType go nnoremap <buffer> <Leader>lk <Cmd>GoDoc<CR>")
      vim.cmd("autocmd FileType go nnoremap <buffer> <Leader>le <Cmd>GoIfErr<CR>")
    end,
    event = {"CmdlineEnter"},
    ft = {"go", 'gomod'},
    build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
  },

  -- {
  --   'Wansmer/langmapper.nvim',
  --   lazy = false,
  --   priority = 1, -- High priority is needed if you will use `autoremap()`
  --   config = function()
  --     require('langmapper').setup({--[[ your config ]]})
  --   end,
  -- },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs

  {
    "hrsh7th/nvim-cmp",
    opts = overrides.cmp
  },

  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "stevearc/conform.nvim",
    --  for users those who want auto-save conform + lazyloading!
    -- event = "BufWritePre"
    config = function()
      require "custom.configs.conform"
    end,
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins

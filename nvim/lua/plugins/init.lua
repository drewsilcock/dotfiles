return {
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "html-lsp",
        "css-lsp",
        "prettier",
        "jdtls",
        "pyright",
        "yamlls",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
      },
    },
  },

  {
    "williamboman/mason-lspconfig.nvim",
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      animate = { enabled = true },
      bigfile = { enabled = true },
      input = { enabled = true },
      picker = { enabled = false },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      scope = { enabled = true },
      statuscolumn = { enabled = true },
      lazygit = { enabled = true },
      terminal = { enabled = true },
      explorer = { enabled = false },
      dashboard = { enabled = false },
    },
  },
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
    config = function()
      require("dashboard").setup {
        theme = "hyper",
        config = {
          header = {
            "██╗    ██╗ ██████╗ ██████╗ ██╗  ██╗",
            "██║    ██║██╔═══██╗██╔══██╗██║ ██╔╝",
            "██║ █╗ ██║██║   ██║██████╔╝█████╔╝ ",
            "██║███╗██║██║   ██║██╔══██╗██╔═██╗ ",
            "╚███╔███╔╝╚██████╔╝██║  ██║██║  ██╗",
            " ╚══╝╚══╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝",
          },
          footer = {},
          week_header = {
            enable = true,
          },
          shortcut = {
            { desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u" },
            {
              icon = " ",
              icon_hl = "@variable",
              desc = "Files",
              group = "Label",
              action = "Telescope find_files",
              key = "f",
            },
            {
              desc = ' Search',
              group = 'DiagnosticHint',
              action = 'Telescope live_grep',
              key = 'w',
            },
            {
              desc = '󰋖 Help',
              group = 'Number',
              action = 'Telescope help_tags',
              key = 'd',
            },
          },
        },
      }
    end,
  },
}

return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "css-lsp",
        "eslint-lsp",
        "google-java-format",
        "gopls",
        "html-lsp",
        "intelephense",
        "jdtls",
        "json-lsp",
        "lua-language-server",
        "prettierd",
        "pyright",
        "stylua",
        "tailwindcss-language-server",
        "typescript-language-server",
      },
      automatic_installation = true,
    },
  },
  {
    "mg979/vim-visual-multi",
    branch = "master",
    enabled = true,
    lazy = false,
    config = function() end,
    init = function()
      vim.g.VM_maps = {
        ["Find Under"] = "<leader>a",
      }
    end,
  },
  {
    "petertriho/nvim-scrollbar",
    config = function()
      require("scrollbar").setup()
    end,
  },
  {
    "numToStr/Comment.nvim",
    opts = {},
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
    config = function()
      require("ibl").setup()
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "tsx",
        "json",
        "javascript",
        "java",
        "typescript",
        "go",
        "lua",
        "vimdoc",
        "python",
        "html",
        "css",
      },
    },
  },
  {
    "mfussenegger/nvim-jdtls",
  },
}

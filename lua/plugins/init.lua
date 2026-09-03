-- ~/.config/nvim/lua/plugins.lua
return {
  -- 1. Formatting on save via Conform
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- run on buffer write
    opts = require "configs.conform",
  },

  -- 2. Mason: external-tool manager
  {
    "williamboman/mason.nvim",
    cmd = "Mason", -- lazy‑load when you run :Mason
    config = function()
      require("mason").setup()
    end,
  },

  -- 3. mason‑lspconfig: bridges Mason ↔︎ nvim‑lspconfig
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      local mlc = require "mason-lspconfig"

      mlc.setup {
        -- exactly the lspconfig names you asked for:
        ensure_installed = {
          "ts_ls",
          "biome",
          "dockerls",
          "clangd",
          "tailwindcss",
          "html",
          "remark_ls",
          "pylsp",
          "rust_analyzer",
          "terraformls",
          "arduino_language_server",
          "prismals",
        },
        automatic_installation = true, -- install servers on demand
      }

      -- default handler: calls lspconfig[server].setup({})
      mlc.setup_handlers {
        function(server_name)
          require("lspconfig")[server_name].setup {}
        end,

        ["clangd"] = function()
          require("lspconfig").clangd.setup {
            cmd = {
              "clangd",
              "--query-driver=/opt/homebrew/bin/g++*",
              "--clang-tidy",
              "--completion-style=detailed",
            },
          }
        end,
      }
    end,
  },

  -- 4. Core LSP configuration
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      -- any shared on_attach / capabilities can go here
      local opts = {
        -- on_attach = require("configs.lspconfig").on_attach,
        -- capabilities = require("configs.lspconfig").capabilities,
      }

      -- If you need server‑specific overrides, do it here:
      -- e.g. custom settings for ts_ls
      require("lspconfig").ts_ls.setup(vim.tbl_deep_extend("force", opts, {
        -- your tsserver settings…
      }))

      -- All other servers from ensure_installed will be set up automatically
      -- by the mason‑lspconfig default handler above.
    end,
  },

  -- 5. Optional: blink.nvim import
  { import = "nvchad.blink.lazyspec" },
}

-- AstroLSP allows you to customize the features in AstroNvim's LSP configuration engine
-- Configuration documentation can be found with `:h astrolsp`
---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    automatic_installation = true,
    features = {
      codelens = true,
      semantic_tokens = true,
    },
    formatting = {
      format_on_save = {
        enabled = true,
        allow_filetypes = {
          "rust",
          "go",
        },
        ignore_filetypes = {},
      },
      disabled = {},
      timeout_ms = 1000,
    },
    config = {
      rust_analyzer = {
        settings = {
          ["rust-analyzer"] = {
            checkOnSave = {
              command = "clippy",
            },
            cargo = {
              allFeatures = true,
            },
            procMacro = {
              enable = true,
            },
          },
        },
      },
      gopls = {
        settings = {
          gopls = {
            analyses = {
              unusedparams = true,
              shadow = true,
              fieldalignment = true,
              nilness = true,
              unusedwrite = true,
              useany = true,
            },
            staticcheck = true,
            gofumpt = true,
            usePlaceholders = true,
            hints = {
              assignVariableTypes = true,
              compositeLiteralFields = true,
              compositeLiteralTypes = true,
              constantValues = true,
              functionTypeParameters = true,
              parameterNames = true,
              rangeVariableTypes = true,
            },
            importShortcut = "Definition",
            completeUnimported = true,
            semanticTokens = true,
          },
        },
      },
    },
    handlers = {
      gopls = function(_, opts)
        require("lspconfig").gopls.setup(opts)
      end,
    },
    autocmds = {
      go = {
        { event = "BufWritePre", command = "lua vim.lsp.buf.format()" },
      },
    },
    mappings = {
      n = {
        ["<leader>gtj"] = { "<cmd>GoAddTag json<cr>", desc = "Add json struct tags" },
        ["<leader>gty"] = { "<cmd>GoAddTag yaml<cr>", desc = "Add yaml struct tags" },
        ["<leader>gt-"] = { "<cmd>GoRemoveTags<cr>", desc = "Remove all struct tags" },
        ["<leader>gif"] = { "<cmd>GoIfErr<cr>", desc = "Add if err != nil" },
      },
    },
    on_attach = function(client, bufnr)
    end,
    logging = {
      enabled = false,
      level = "warn",
    },
  },
}


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
    -- customize lsp formatting options
    formatting = {
      format_on_save = {
        enabled = true,
        allow_filetypes = {
          "rust",
          "go",
          "svelte",
          "move"
        },
        ignore_filetypes = {},
      },
      disabled = {},
      timeout_ms = 1000,
    },
    config = {
      svelte = {
        settings = {
          svelte = {
            plugin = {
              html = {
                completions = {
                  enable = true,
                  emmet = true,
                },
              },
              svelte = {
                defaultScriptLanguage = "typescript",
                diagnostics = {
                  enable = true,
                },
              },
            },
          },
        }
      },
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
      move_analyzer = {
        settings = {
          ["move-analyzer"] = {
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
            -- Enable auto-imports
            importShortcut = "Definition",
            completeUnimported = true,
            semanticTokens = true,
          },
        },
      },
    },
    -- customize how language servers are attached
    handlers = {
      gopls = function(_, opts)
        require("lspconfig").gopls.setup(opts)
      end,
    },
    -- Configure buffer local auto commands to add when attaching a language server
    autocmds = {
      -- Add Go-specific autocmds
      go = {
        { event = "BufWritePre", command = "lua vim.lsp.buf.format()" },
        { event = "BufWritePre", command = "lua require('go.format').goimport()" },
      },
    },
    -- mappings to be set up on attaching of a language server
    mappings = {
      n = {
        -- Add Go-specific mappings
        ["<leader>gtj"] = { "<cmd>GoAddTag json<cr>", desc = "Add json struct tags" },
        ["<leader>gty"] = { "<cmd>GoAddTag yaml<cr>", desc = "Add yaml struct tags" },
        ["<leader>gt-"] = { "<cmd>GoRemoveTags<cr>", desc = "Remove all struct tags" },
        ["<leader>gif"] = { "<cmd>GoIfErr<cr>", desc = "Add if err != nil" },
      },
    },
    -- A custom `on_attach` function to be run after the default `on_attach` function
    on_attach = function(client, bufnr)
    end,
    logging = {
      enabled = false,
      level = "warn",
    },
  },
}

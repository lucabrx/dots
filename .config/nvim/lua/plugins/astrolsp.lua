-- AstroLSP allows you to customize the features in AstroNvim's LSP configuration engine
-- Configuration documentation can be found with `:h astrolsp`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing
---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    -- Configuration table of features provided by AstroLSP
    features = {
      codelens = true, -- enable/disable codelens refresh on start
      inlay_hints = true, -- enable inlay hints for Rust
      semantic_tokens = true, -- enable/disable semantic token highlighting
    },
    -- customize lsp formatting options
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = true, -- enable or disable format on save globally
        allow_filetypes = {
          "rust", -- enable format on save for Rust
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- "rust_analyzer", -- Uncomment this line if you want to use rustfmt separately
      },
      timeout_ms = 1000, -- default format timeout
    },
    -- enable servers that you already have installed without mason
    servers = {
      "rust_analyzer", -- Add rust_analyzer here
    },
    -- customize language server configuration options passed to `lspconfig`
    ---@diagnostic disable: missing-fields
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
    },
    -- customize how language servers are attached
    handlers = {
      -- You can add a custom handler for rust_analyzer if needed
      -- rust_analyzer = function(_, opts) require("lspconfig").rust_analyzer.setup(opts) end
    },
    -- Configure buffer local auto commands to add when attaching a language server
    autocmds = {
      -- Keep existing autocmds and add Rust-specific ones if needed
    },
    -- mappings to be set up on attaching of a language server
    mappings = {
      n = {
        -- Keep existing mappings
        -- Add Rust-specific mappings here if needed
      },
    },
    -- A custom `on_attach` function to be run after the default `on_attach` function
    on_attach = function(client, bufnr)
      -- Add Rust-specific on_attach logic here if needed
    end,
    -- Disable LSP logging
    logging = {
      enabled = false,
    },
  },
}

return {
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "stylua",
        "luacheck",
        "html-lsp",
        "css-lsp",
        "emmet-language-server",
        "gomodifytags",
        "java-debug-adapter",
        "java-test",
        "lemminx",
      })
    end,
  },
  -- lsp servers
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = {
        enabled = false,
      },
      codelens = {
        enabled = true,
      },
      servers = {
        emmet_language_server = {
          filetypes = {
            "css",
            "eruby",
            "html",
            "javascript",
            "javascriptreact",
            "less",
            "sass",
            "scss",
            "svelte",
            "pug",
            "typescriptreact",
          },
        },
        cssls = {
          settings = {
            css = {
              validate = true,
              lint = {
                unknownAtRules = "ignore",
              },
            },
            scss = {
              validate = true,
              lint = {
                unknownAtRules = "ignore",
              },
            },
            less = {
              validate = true,
              lint = {
                unknownAtRules = "ignore",
              },
            },
          },
          filetypes = {
            "css",
            "eruby",
            "html",
            "less",
            "sass",
            "scss",
            "pug",
          },
        },
        vtsls = {
          settings = {
            vtsls = {
              enableMoveToFileCodeAction = true,
              autoUseWorkspaceTsdk = false,
              experimental = {
                completion = {
                  enableServerSideFuzzyMatch = true,
                  entriesLimit = 30,
                },
              },
            },
          },
        },
        gopls = {
          settings = {
            gopls = {
              gofumpt = true,
              codelenses = {
                gc_details = false,
                generate = true,
                regenerate_cgo = true,
                run_govulncheck = true,
                test = true,
                tidy = true,
                upgrade_dependency = true,
                vendor = true,
                references = true,
              },
              hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
              },
              analyses = {
                nilness = true,
                unusedparams = true,
                unusedwrite = true,
                useany = true,
                ST1000 = false,
                ST1003 = false,
              },
              usePlaceholders = true,
              completeUnimported = true,
              staticcheck = true,
              directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
              semanticTokens = true,
            },
          },
        },
        lemminx = {
          settings = {
            xml = {
              server = {
                workDir = vim.fn.expand("~/.cache/lemminx"),
              },
              externalResources = {
                enabled = true,
              },
            },
          },
        },
        jdtls = {},
      },
      setup = {
        gopls = function(_, _)
          Snacks.util.lsp.on({ name = "gopls" }, function(bufnr, client)
            if client.supports_method("textDocument/codeLens", bufnr) then
              vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
                buffer = bufnr,
                callback = vim.lsp.codelens.refresh,
              })
            end
          end)
        end,
        jdtls = function()
          return true -- avoid duplicate servers
        end,
      },
    },
  },
}

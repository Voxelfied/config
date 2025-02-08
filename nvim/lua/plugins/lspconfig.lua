return {
    {
        "folke/neodev.nvim",
        opts = {} ,
    },

    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "css-lsp",
                "cssmodules-language-server",
                "emmet-ls",
                "dockerfile-language-server",
                "yaml-language-server",
                "arduino-language-server",
                "codelldb",
                "eslint-lsp",
                "html-lsp",
                "java-language-server",
                "json-lsp",
                "lua-language-server",
                "prettier",
                "black",
                "pyright",
                "rust-analyzer",
                "selene",
                "shfmt",
                "stylua",
                "tailwindcss-language-server",
                "taplo",
                "typescript-language-server",
            },
        },
    },

    {
        "williamboman/mason-lspconfig.nvim",
    },

    {
        "neovim/nvim-lspconfig",
        config = function()

            local lspconfig = require('lspconfig')

            local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
            end

            vim.diagnostic.config({
                virtual_text = {
                    prefix = '●',
                },
                severity_sort = true,
                float = {
                    source = "always",
                },
            })

            lspconfig.cssls.setup{}
            lspconfig.cssmodules_ls.setup{}
            lspconfig.emmet_ls.setup{}
            lspconfig.dockerls.setup{}
            lspconfig.yamlls.setup{}
            lspconfig.arduino_language_server.setup{}
            lspconfig.eslint.setup{}
            lspconfig.html.setup{}
            lspconfig.jdtls.setup{}
            lspconfig.jsonls.setup{}
            lspconfig.lua_ls.setup{
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = {'vim'},
                        },
                    },
                },
            }
            lspconfig.pyright.setup{}
            lspconfig.rust_analyzer.setup{}
            lspconfig.ts_ls.setup{}
            lspconfig.tailwindcss.setup{}
        end,
    }
}

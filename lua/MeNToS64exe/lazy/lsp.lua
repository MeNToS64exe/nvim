return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗",
                    },
                },
            })
        end,
    },
    --[[
    -- TODO: If this is uncommented, two LSP clients will be created in the editor.
             Not sure if this piece of code is actually needed.
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "clangd", "pyright" },
                handlers = {},
                automatic_installation = false,
            })
        end,
    },
    --]]
    {
        "neovim/nvim-lspconfig",
        config = function()
            vim.diagnostic.config({
                virtual_text = true,
                signs = true,
                underline = true,
                update_in_insert = false,
                severity_sort = true,
                float = {
                    source = "always",
                    border = "rounded",
                },
            })

            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            capabilities.offsetEncoding = { "utf-16" }

            vim.lsp.config["lua_ls"] = {
                capabilities = capabilities,
            }

            vim.lsp.config["clangd"] = {
                capabilities = capabilities,
                cmd = {
                    "clangd",
                    "--background-index",
                    "--clang-tidy",
                    "--completion-style=detailed",
                    "--header-insertion=never",
                },
                init_options = {
                    fallbackFlags = { "-std=c++20", },
                },
            }

            vim.lsp.config["cmake"] = {
                capabilities = capabilities,
            }

            vim.lsp.config["pyright"] = {
                capabilities = capabilities,
            }

            vim.lsp.config["verible"] = {
                capabilities = capabilities,
            }

            vim.lsp.config["haskell-language-server"] = {
                capabilities = capabilities,
            }

            vim.lsp.config["r-languageserver"] = {
                capabilities = capabilities,
            }

            vim.lsp.enable("lua_ls")
            vim.lsp.enable("clangd")
            vim.lsp.enable("cmake")
            vim.lsp.enable("pyright")
            vim.lsp.enable("verible")
            vim.lsp.enable("haskell-language-server")
            vim.lsp.enable("r-languageserver")
        end,
    },
}

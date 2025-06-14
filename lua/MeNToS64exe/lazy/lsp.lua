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
             Not sure if this piece of code is actually needed
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

            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            capabilities.offsetEncoding = { "utf-16" }

            lspconfig.lua_ls.setup({
                capabilities = capabilities,
            })
            lspconfig.clangd.setup({
                capabilities = capabilities,
                init_options = {
                    fallbackFlags = { "--std=c++20" },
                },
            })
            lspconfig.pyright.setup({
                capabilities = capabilities,
            })
        end,
    },
}

return {
    {
        "williamboman/mason.nvim",
        config = function() 
            require("mason").setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                    },
                },
            })
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "clangd", "pyright" },
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function() 
            local lspconfig = require('lspconfig')
            lspconfig.rust_analyzer.setup({
                settings = {
                    ['rust-analyzer'] = {},
                },
            })
            lspconfig.lus_ls.setup({})
            lspconfig.clangd.setup({})
            lspconfig.pyright.setup({})
        end
    },
}

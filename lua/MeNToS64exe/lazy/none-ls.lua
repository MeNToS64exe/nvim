return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")

        -- Fix conflict with clangd on encoding positions
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities.offsetEncoding = { "utf-8" }

        null_ls.setup({
            capabilities = capabilities,
            sources = {
                -- Lua (stylua)
                null_ls.builtins.formatting.stylua.with({
                    extra_args = { "--indent-type", "Spaces", "--indent-width", "4" },
                }),

                -- Python (yapf)
                null_ls.builtins.formatting.yapf.with({
                    extra_args = {
                        "--style",
                        "{based_on_style: pep8, indent_width: 4}",
                    },
                }),

                -- C++ (clang-format)
                null_ls.builtins.formatting.clang_format.with({
                    extra_args = {
                        [[--style={
                            "BasedOnStyle": "LLVM",
                            "IndentAccessModifiers": false,
                            "IndentWidth": 4,
                            "UseTab": "Never",
                            "TabWidth": 4,
                            "BracedInitializerIndentWidth": 4,
                            "BreakBeforeBraces": "Attach",
                            "BreakBeforeConceptDeclarations": "Always",
                            "EmptyLineBeforeAccessModifier": "Leave",
                            "AccessModifierOffset": -4
                        }]],
                    },
                }),
            },
        })
    end,
}

return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")
        configs.setup({
            ensure_installed = {
                "c",
                "cpp",
                "lua",
                "python",
                "vim",
                "vimdoc",
                "query",
                "make",
                "cmake",
                "bash",
                "asm",
            },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end,
}

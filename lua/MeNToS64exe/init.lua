require("MeNToS64exe.mappings")
require("MeNToS64exe.init_lazy")
require("MeNToS64exe.set")

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local saveFileGroup = augroup("MeNToS64exeGroup", {})

autocmd({ "BufWritePre" }, {
    group = saveFileGroup,
    pattern = "*",
    callback = function()
        local pos = vim.api.nvim_win_get_cursor(0)

        vim.cmd([[%s/\s\+$//e]])

        pcall(function()
            vim.api.nvim_win_set_cursor(0, pos)
        end)

        vim.lsp.buf.format({
            async = false,
            filter = function(client)
                return client.name == "null-ls"
            end,
        })
    end,
})

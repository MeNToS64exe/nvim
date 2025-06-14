require("MeNToS64exe.mappings")
require("MeNToS64exe.init_lazy")
require("MeNToS64exe.set")

local augroup = vim.api.nvim_create_augroup("MeNToS64exeGroup", { clear = true })

vim.api.nvim_create_autocmd("BufWritePre", {
    group = augroup,
    pattern = "*",
    callback = function()
        local pos = vim.api.nvim_win_get_cursor(0)
        vim.cmd([[%s/\s\+$//e]])
        pcall(vim.api.nvim_win_set_cursor, 0, pos)
    end,
})

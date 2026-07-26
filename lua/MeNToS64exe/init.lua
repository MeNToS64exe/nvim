require("MeNToS64exe.mappings")
require("MeNToS64exe.init_lazy")
require("MeNToS64exe.set")
require("MeNToS64exe.filetypes")
require("MeNToS64exe.lsp-highlight")

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

vim.api.nvim_create_autocmd("BufReadPost", {
    group = augroup,
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local line_count = vim.api.nvim_buf_line_count(0)
        if mark[1] <= 0 or mark[1] > line_count then
            return
        end
        pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end,
})

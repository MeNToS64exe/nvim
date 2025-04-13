require("MeNToS64exe.mappings")
require("MeNToS64exe.init_lazy")
require("MeNToS64exe.set")

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local delSpacesGroup = augroup('MeNToS64exeGroup', {})

autocmd({"BufWritePre"}, {
    group = delSpacesGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

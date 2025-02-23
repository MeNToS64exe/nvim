require("MeNToSexe.mappings")
require("MeNToSexe.init_lazy")
require("MeNToSexe.set")

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local delSpacesGroup = augroup('MeNToSexeGroup', {})

autocmd({"BufWritePre"}, {
    group = delSpacesGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

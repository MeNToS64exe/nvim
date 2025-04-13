vim.opt.tabstop=4
vim.opt.shiftwidth=4
vim.opt.expandtab=true

vim.opt.number=true
vim.cmd("set clipboard+=unnamedplus")

vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("state") .. "/undo"

vim.opt.list = true
vim.opt.listchars = {
    tab = "→ ",
    trail = "·",
    extends = "»",
    precedes = "«",
    eol = "↵",
    space = " ",
}

vim.opt.shell = "/bin/zsh"

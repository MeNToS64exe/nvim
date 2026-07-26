vim.g.mapleader = "\\"

-- Open Terminal
vim.keymap.set("n", "<leader>t", function()
    local term_buf = nil
    local term_win = nil

    for _, win in ipairs(vim.api.nvim_list_wins()) do
        local buf = vim.api.nvim_win_get_buf(win)
        if vim.api.nvim_buf_get_option(buf, "buftype") == "terminal" then
            term_buf = buf
            term_win = win
            break
        end
    end

    if term_win and vim.api.nvim_win_is_valid(term_win) then
        vim.api.nvim_set_current_win(term_win)
        vim.cmd("startinsert")
    elseif term_buf and vim.api.nvim_buf_is_valid(term_buf) then
        vim.cmd("rightbelow vsplit")
        vim.cmd("vertical resize 60")
        vim.api.nvim_win_set_buf(0, term_buf)
        vim.cmd("startinsert")
    else
        vim.cmd("rightbelow vsplit")
        vim.cmd("vertical resize 60")
        vim.cmd("terminal")
        vim.cmd("startinsert")
    end
end)

vim.keymap.set("n", "<A-Left>", "<C-w>h")
vim.keymap.set("n", "<A-Down>", "<C-w>j")
vim.keymap.set("n", "<A-Up>", "<C-w>k")
vim.keymap.set("n", "<A-Right>", "<C-w>l")

vim.keymap.set("n", "<A-h>", "<C-w>h")
vim.keymap.set("n", "<A-j>", "<C-w>j")
vim.keymap.set("n", "<A-k>", "<C-w>k")
vim.keymap.set("n", "<A-l>", "<C-w>l")

-- Diagnostics
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic", })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Diagnostics location list", })
vim.keymap.set("n", "[d", function()
    vim.diagnostic.jump({
        count = -1,
    })
end, { desc = "Previous diagnostic", })

vim.keymap.set("n", "]d", function()
    vim.diagnostic.jump({
        count = 1,
    })
end, { desc = "Next diagnostic", })

-- LSP mappings are only enabled for buffers with an attached LSP.
local lsp_group = vim.api.nvim_create_augroup( "MeNToS64exeLspMappings", { clear = true, } )
vim.api.nvim_create_autocmd("LspAttach", {
    group = lsp_group,

    callback = function(event)
        local opts = {
            buffer = event.buf,
            silent = true,
        }

        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
        vim.keymap.set({"n", "v"}, "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    end,
})

vim.keymap.set({ "n", "v" }, "<leader><A-l>", function()
    vim.lsp.buf.format({
        async = true,
        filter = function(client)
            return client.name == "null-ls"
        end,
    })
end)

-- Build and quickfix
vim.keymap.set("n", "<leader>mm", "<cmd>make<CR>", { desc = "Run make", })
vim.keymap.set("n", "<leader>mq", "<cmd>copen<CR>", { desc = "Open quickfix", })
vim.keymap.set("n", "<leader>mc", "<cmd>cclose<CR>", { desc = "Close quickfix", })
vim.keymap.set("n", "]q", "<cmd>cnext<CR>", { desc = "Next quickfix item", })
vim.keymap.set("n", "[q", "<cmd>cprevious<CR>", { desc = "Previous quickfix item", })

-- Telescope
-- for telescope mappings check telescope.lua

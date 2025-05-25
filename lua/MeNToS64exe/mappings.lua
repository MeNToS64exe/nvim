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

-- LSP
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

vim.keymap.set({ "n", "v" }, "<leader><A-l>", function()
	vim.lsp.buf.format({
		async = true,
		filter = function(client)
			return client.name == "null-ls"
		end,
	})
end)
-- Telescope
-- vim.keymap.set("n", "<leader>fs", require("telescope.builtin").lsp_document_symbols)
-- vim.keymap.set("n", "<leader>fS", require("telescope.builtin").lsp_workspace_symbols)

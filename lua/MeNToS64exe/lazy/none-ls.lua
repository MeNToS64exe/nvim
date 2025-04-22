return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				-- Lua
				null_ls.builtins.formatting.stylua.with({
					extra_args = { "--indent-width", "4" },
				}),

				-- Python
				null_ls.builtins.formatting.yapf.with({
					extra_args = { "--style", "{based_on_style: pep8, indent_width: 4}" },
				}),

				-- C++
				null_ls.builtins.formatting.clang_format.with({
					extra_args = {
						"--style",
						"{BasedOnStyle: LLVM, IndentWidth: 4, TabWidth: 4, UseTab: Never, BreakBeforeBraces: Attach}",
					},
				}),
			},
		})
	end,
}

local function find_project_root()
    local current_buffer = vim.api.nvim_get_current_buf()

    local clients = vim.lsp.get_clients({ bufnr = current_buffer, })

    for _, client in ipairs(clients) do
        local root_dir = client.config.root_dir

        if type(root_dir) == "string" and root_dir ~= "" then
            return root_dir
        end
    end

    local git_root = vim.fs.root(current_buffer, ".git")

    if git_root then
        return git_root
    end

    return vim.fn.getcwd()
end

return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",

        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-ui-select.nvim",
        },

        config = function()
            local telescope = require("telescope")
            local builtin = require("telescope.builtin")
            local themes = require("telescope.themes")
            local actions = require("telescope.actions")

            telescope.setup({
                defaults = {
                    path_display = { "smart", },
                    mappings = {
                        i = {
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-k>"] = actions.move_selection_previous,
                        },

                        n = {
                            ["j"] = actions.move_selection_next,
                            ["k"] = actions.move_selection_previous,
                        },
                    },
                },

                pickers = {
                    find_files = { hidden = true, },
                    buffers = {
                        sort_mru = true,
                        ignore_current_buffer = true,
                    },
                },
                extensions = { ["ui-select"] = themes.get_dropdown({}), },
            })

            telescope.load_extension("ui-select")
            vim.keymap.set("n", "<leader>ff", function()
                builtin.find_files({
                    cwd = find_project_root(),
                    hidden = true,
                })
            end, { desc = "Find project files", })

            vim.keymap.set("n", "<leader>fF", function()
                local current_file_directory = vim.fn.expand("%:p:h")

                builtin.find_files({
                    cwd = current_file_directory,
                    hidden = true,
                })
            end, { desc = "Find files near current file", })

            vim.keymap.set("n", "<leader>fg", function()
                builtin.live_grep({
                    cwd = find_project_root(),
                })
            end, { desc = "Grep project", })

            vim.keymap.set("n", "<leader>fw", function()
                builtin.grep_string({
                    cwd = find_project_root(),
                    search = vim.fn.expand("<cword>"),
                })
            end, { desc = "Find word under cursor", })

            vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers", })
            vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Recent files", })
            vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "Document symbols", })
            vim.keymap.set("n", "<leader>fS", builtin.lsp_workspace_symbols, { desc = "Workspace symbols", })
            vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Diagnostics", })
            vim.keymap.set("n", "<C-g>", builtin.git_files, { desc = "Git files", })
        end,
    },
}

local attach_group = vim.api.nvim_create_augroup("MeNToS64exeLspHighlightAttach", { clear = true, })
vim.api.nvim_create_autocmd("LspAttach", {
    group = attach_group,

    callback = function(event)
        local client = vim.lsp.get_client_by_id(event.data.client_id)

        if not client then
            return
        end

        if not client:supports_method("textDocument/documentHighlight") then
            return
        end

        local highlight_group = vim.api.nvim_create_augroup( "MeNToS64exeLspHighlight" .. event.buf, { clear = true, })

        vim.api.nvim_create_autocmd({
            "CursorHold",
            "CursorHoldI",
        }, {
            group = highlight_group,
            buffer = event.buf,
            callback = vim.lsp.buf.document_highlight,
        })

        vim.api.nvim_create_autocmd({
            "CursorMoved",
            "CursorMovedI",
        }, {
            group = highlight_group,
            buffer = event.buf,
            callback = vim.lsp.buf.clear_references,
        })

        vim.api.nvim_create_autocmd("LspDetach", {
            group = highlight_group,
            buffer = event.buf,

            callback = function()
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds({
                    group = highlight_group,
                    buffer = event.buf,
                })
            end,
        })
    end,
})

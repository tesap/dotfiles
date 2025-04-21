
vim.lsp.config["tinymist"] = {
    cmd = { "tinymist" },
    filetypes = { "typst" },
    settings = {
	formatterMode = "typstyle",
        exportPdf = "onType",
        semanticTokens = "disable"
    }
}


vim.lsp.enable('tinymist')

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client.name == "tinymist" then
            -- Example: Export PDF on <leader>tp
            vim.keymap.set("n", "<leader>tp", 
            function()
                vim.lsp.buf_request(bufnr, "workspace/executeCommand", {
                    command = "tinymist.exportPdf",
                    arguments = { vim.api.nvim_buf_get_name(0) },
                })
            end,
            { buffer = args.buf, desc = "Export Typst to PDF" })
        end
    end,
})

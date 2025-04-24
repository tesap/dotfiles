
    -- Fix multi-file projects
vim.lsp.config["tinymist"] = {
    cmd = { "tinymist" },
    filetypes = { "typst" },
    settings = {
	formatterMode = "typstyle",
        exportPdf = "onType",
        semanticTokens = "disable",
	watchDebounceMs = 1000,
	partialRendering = false,
	rootDir = "${workspaceFolder}",
	-- invertColors = "off",
	-- preview = {
	--     invertColors = false,
	--     theme = "light"
	-- }
    },
    on_attach = function(client, bufnr)
        vim.keymap.set("n", "<leader>tp", function()
            client:exec_cmd({
                title = "pin",
                command = "tinymist.pinMain",
                arguments = { vim.api.nvim_buf_get_name(0) },
            }, { bufnr = bufnr })
        end, { desc = "[P]in File", noremap = true })

        vim.keymap.set("n", "<leader>tu", function()
            client:exec_cmd({
                title = "unpin",
                command = "tinymist.pinMain",
                arguments = { vim.v.null },
            }, { bufnr = bufnr })
        end, { desc = "[U]npin File", noremap = true })
    end,
}

-- vim.lsp.buf.execute_command({ command = 'tinymist.pinMain', arguments = { vim.api.nvim_buf_get_name(0) } })

vim.lsp.enable('tinymist')

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client.name == "tinymist" then
            local function tinymist_cmd(key, cmd, desc)
                vim.keymap.set("n", key, function()
                    vim.lsp.buf_request(args.buf, "workspace/executeCommand", {
                        command = "tinymist." .. cmd,
                        arguments = { vim.api.nvim_buf_get_name(args.buf) },
                    })
                end, { buffer = args.buf, desc = desc })
            end
           
            tinymist_cmd("<leader>tp", "exportPdf", "[E]xport to PDF")
            tinymist_cmd("<leader>ts", "startDefaultPreview", "[S]tart Browser Preview")
        end
    end,
})

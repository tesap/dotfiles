
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
        local function tinymist_cmd(key, cmd, desc, arguments)
            -- vim.keymap.set("n", key, function()
            --     vim.lsp.buf_request(args.buf, "workspace/executeCommand", {
            --         command = "tinymist." .. cmd,
            --         arguments = { vim.api.nvim_buf_get_name(args.buf) },
            --     })
            -- end, { buffer = args.buf, desc = desc })

            vim.keymap.set("n", key, function()
                client:exec_cmd({
                    -- title = "pin",
                    command = cmd,
                    -- arguments = { vim.api.nvim_buf_get_name(0) },
                    arguments = arguments,
                }, { bufnr = bufnr })
            end, { desc = desc, noremap = true })
        end
        tinymist_cmd("<leader>tpp", "tinymist.pinMain", "[P]in File", { vim.api.nvim_buf_get_name(0) })
        tinymist_cmd("<leader>tpu", "tinymist.pinMain", "[U]npin File", { vim.v.null })
        tinymist_cmd("<leader>te", "tinymist.exportPdf", "[E]xport to PDF", { vim.api.nvim_buf_get_name(0) })
        tinymist_cmd("<leader>ts", "tinymist.startDefaultPreview", "[S]tart Browser Preview", { vim.api.nvim_buf_get_name(0) })
    end,
}

-- vim.lsp.buf.execute_command({ command = 'tinymist.pinMain', arguments = { vim.api.nvim_buf_get_name(0) } })

vim.lsp.enable('tinymist')

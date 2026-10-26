
require("which-key").setup()
require("which-key").add({
    { "<leader>f", group = "File" },
    { "<leader>s", group = "Search" },
    { "<leader>b", group = "Buffers" },
    { "<leader>l", group = "LSP" },
    { "<leader>t", group = "Typst" },
 --    {
	-- "<leader>b",
	-- group = "buffer",
	-- expand = function()
	--     return require("which-key.extras").expand.buf()
	-- end,
	-- -- map("n", "<leader>b", "<cmd>FzfLua buffers<cr>", { desc = "[B]uffers" })
 --    },
    {
	"<leader>w",
	group = "windows",
	proxy = "<c-w>",
	expand = function()
	    return require("which-key.extras").expand.win()
	end,
    },
    -- better descriptions
    { "gx", desc = "Open with system app" },
})

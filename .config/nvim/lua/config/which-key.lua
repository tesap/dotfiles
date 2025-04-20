
require("which-key").setup()
require("which-key").add({
    { "<leader>f", group = "Fuzzy" },
    {
	"<leader>b",
	group = "buffer",
	expand = function()
	    return require("which-key.extras").expand.buf()
	end,
    },
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

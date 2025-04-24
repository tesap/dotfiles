
return { 
    {
	"ellisonleao/gruvbox.nvim", 
	lazy = false,
	priority = 1000,
	config = function()
	    vim.cmd([[colorscheme gruvbox]])
	end,
    },

    {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
	    require("config.which-key")
	end,
    },

    { "nvim-treesitter/nvim-treesitter", lazy = true },

    {
	"hrsh7th/nvim-cmp",
	-- load cmp on InsertEnter
	event = "InsertEnter",
	-- these dependencies will only be loaded when cmp loads
	-- dependencies are always lazy-loaded unless specified otherwise
	dependencies = {
	    "hrsh7th/cmp-nvim-lsp",
	    "hrsh7th/cmp-buffer",
	    "hrsh7th/cmp-path",
	},
	config = function()
	    require("config.nvim-cmp")
	end,
    },

    -- if some code requires a module from an unloaded plugin, it will be automatically loaded.
    -- So for api plugins like devicons, we can always set lazy=true
    { "nvim-tree/nvim-web-devicons", lazy = true },

    -- you can use the VeryLazy event for things that can
    -- load later and are not important for the initial UI
    -- { "stevearc/dressing.nvim", event = "VeryLazy" },
 
    -- {"folke/twilight.nvim", lazy = true},
    {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
	-- bigfile = { enabled = true },
	terminal = { enabled = true },
	-- dashboard = { enabled = true },
	-- explorer = { enabled = true },
	-- indent = { enabled = true },
	-- input = { enabled = true },
	-- picker = { enabled = true },
	-- notifier = { enabled = true },
	-- quickfile = { enabled = true },
	scope = { enabled = true },
	-- scroll = { enabled = true },
	-- statuscolumn = { enabled = true },
	-- words = { enabled = true },
	},
    },

    { 
	"akinsho/bufferline.nvim",
	dependencies = "nvim-tree/nvim-web-devicons",
	opts = {},
    },

    {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	pin = true,
	lazy = true,
	cmd = { "FzfLua" },
	opts = {}
    },
    {
	'nvim-telescope/telescope.nvim',
	dependencies = { 'nvim-lua/plenary.nvim' }
    },


    -- { "tpope/vim-commentary" },
    { "numToStr/Comment.nvim", opts = {} },
    { "preservim/nerdtree", config = function() end, },
    -- { "nvim-tree/nvim-tree.lua", opts = {}, },

    -- show and trim trailing whitespaces
    -- { "jdhao/whitespace.nvim", event = "VeryLazy" },

    {
      "Wansmer/treesj",
      keys = {
          { "J", "<cmd>TSJToggle<cr>", desc = "Join Toggle" },
      },
      opts = {
	  use_default_keymaps = false, 
	  max_join_length = 150
      },
    },

    
    {
	'chomosuke/typst-preview.nvim',
	ft = 'typst',
	version = '1.*',
	opts = {},
    },
    {
	"Myriad-Dreamin/tinymist",
	config = function()
	    require("config.tinymist")
	end,
    },

    {
	"williamboman/mason.nvim",
	opts = {
	    ensure_installed = {
		"tinymist",
	    },
	},
    }
}

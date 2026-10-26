
-- ################################################################################
-- # ----------------------------        PACK       ----------------------------- #
-- ################################################################################

local pack = require('vim.pack')

pack.add({"https://github.com/ellisonleao/gruvbox.nvim"})
pack.add({"https://github.com/folke/which-key.nvim"})
pack.add({"https://github.com/nvim-treesitter/nvim-treesitter"})
pack.add({"https://github.com/hrsh7th/nvim-cmp"})
pack.add({"https://github.com/hrsh7th/cmp-path"})
pack.add({"https://github.com/hrsh7th/cmp-buffer"})
pack.add({"https://github.com/nvim-tree/nvim-web-devicons"})
pack.add({"https://github.com/akinsho/bufferline.nvim"})
pack.add({"https://github.com/numToStr/Comment.nvim"})
pack.add({"https://github.com/Wansmer/treesj"})

local opt = vim.opt
local g = vim.g
local map = vim.keymap.set 

vim.cmd([[colorscheme gruvbox]])

vim.opt.clipboard = "unnamedplus"
opt.ignorecase = true
opt.smartcase = true

-- opt.showmatch = true

opt.smartindent = true
-- opt.tabstop = 4
opt.shiftwidth = 4

opt.fixeol = true
opt.termguicolors = true

vim.cmd [[set nu]]
vim.cmd [[set undofile]]
vim.cmd [[set noswapfile]]

-- /// Add line continuation indent for bullet lists
opt.breakindent = true
vim.opt.breakindentopt = { 'list:2', 'sbr', 'min:40' }
-- // proper breaks at EOL
vim.opt.breakat = ' \t;:,!?'
opt.linebreak = true
-- ///

-- /// Formatting for proper line continuation in bullet lists
vim.opt.formatoptions = 'tcqn'
-- vim.opt.textwidth = 100
vim.g.autoformat = false
-- vim.opt.formatprg = 'fmt'
-- vim.opt.formatlistpat = [[^\s*[\d\+\-\*]\+[\.\)]*\s\+]]
-- ///

-- /// Set title to editing file
vim.opt.title = true
vim.opt.titlestring = [[nvim %{expand("%:p")}]]
-- ///

-- vim.cmd [[map <C-_> :Commentary<CR>]]

-- Preserving selection after shifting lines
map("v", ">", ">gv")
map("v", "<", "<gv")

-- map("n", "q", "qa")

-- ################################################################################
-- # ---------------------------      BUFFERLINE      --------------------------- #
-- ################################################################################

map("n", "L", "<cmd>bnext<cr>", { desc = "Next tab" })
map("n", "H", "<cmd>bprev<cr>", { desc = "Previous tab" })

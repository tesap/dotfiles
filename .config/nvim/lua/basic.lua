local opt = vim.opt
local g = vim.g
local map = vim.keymap.set 

opt.ignorecase = true
opt.smartcase = true

-- opt.showmatch = true

opt.smartindent = true
-- opt.tabstop = 4
opt.shiftwidth = 4

opt.fixeol = true
opt.termguicolors = true

vim.cmd [[set nu]]

-- vim.cmd [[map <C-_> :Commentary<CR>]]

-- Preserving selection after shifting lines
map("v", ">", ">gv")
map("v", "<", "<gv")

-- ################################################################################
-- # ---------------------------      BUFFERLINE      --------------------------- #
-- ################################################################################

map("n", "L", "<cmd>bnext<cr>", { desc = "Next tab" })
map("n", "H", "<cmd>bprev<cr>", { desc = "Previous tab" })

-- ################################################################################
-- # ----------------------------      TERMINAL      ---------------------------- #
-- ################################################################################

map("n", "<C-/>", function() Snacks.terminal(nil, { cwd = "" }) end, { desc = "Terminal (Root Dir)" })
map("t", "<C-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })


-- ################################################################################
-- # ----------------------------      FZF-LUA      ----------------------------- #
-- ################################################################################

map("n", "<leader>ff", "<cmd>FzfLua files<cr>", { desc = "Fzf: dir files" })
map("n", "<leader>fo", "<cmd>FzfLua oldfiles<cr>", { desc = "Fzf: recent files" })
map("n", "<leader>fg", "<cmd>FzfLua live_grep<cr>", { desc = "Fzf: grep" })
map("n", "<leader>fb", "<cmd>FzfLua buffers<cr>", { desc = "Fzf: buffers" })

-- ################################################################################
-- # ---------------------------      NERD TREE      ---------------------------- #
-- ################################################################################

vim.cmd [[map <C-n> :NERDTreeToggleVCS<CR>]]
-- vim.cmd [[map <C-n> :NvimTreeToggle<CR>]]

vim.cmd [[
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if winnr() == winnr('h') && bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if &buftype != 'quickfix' && getcmdwintype() == '' | silent NERDTreeMirror | endif
]]


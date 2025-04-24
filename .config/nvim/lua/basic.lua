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
vim.cmd [[set undofile]]
vim.cmd [[set noswapfile]]

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

-- ################################################################################
-- # ----------------------------      TERMINAL      ---------------------------- #
-- ################################################################################

map("n", "<C-/>", function() Snacks.terminal(nil, { cwd = "" }) end, { desc = "Terminal (Root Dir)" })
map("t", "<C-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })
-- map("t", "<C-S-/>", "<Esc><Esc><C-w>T", { desc = "Maximize Terminal" })


-- ################################################################################
-- # -----------------------------      TYPST      ------------------------------ #
-- ################################################################################

-- map(
--     "n",
--     "<leader>tc", 
--     function() 
-- 	pwd = vim.loop.cwd()
-- 	file_path = string.gsub(vim.api.nvim_buf_get_name(0), pwd.."/", '')
-- 	shell_exec = "/bin/typst compile --root "..pwd.." "..file_path
-- 	vimscript_exec = "call system('"..shell_exec.."')"
-- 	
-- 	vim.cmd(vimscript_exec)
--     end, 
--     { desc = "Compile current file" }
-- )
--

-- ################################################################################
-- # ----------------------------      FZF-LUA      ----------------------------- #
-- ################################################################################

map("n", "<leader>b", "<cmd>FzfLua buffers<cr>", { desc = "[B]uffers" })
map("n", "<leader>fd", "<cmd>FzfLua files<cr>", { desc = "Find [F]ile in ([D]ir)" })
map("n", "<leader>fr", "<cmd>FzfLua oldfiles<cr>", { desc = "Find [F]ile in ([R]ecent Global)" })

map("n", "<leader>so", "<cmd>FzfLua lines<cr>", { desc = "[S]earch in [O]pen files (Buffers)" })
map("n", "<leader>sg", "<cmd>FzfLua live_grep<cr>", { desc = "[G]rep (Dir)" })
map("n", "<leader>sv", "<cmd>FzfLua grep_visual<cr>", { desc = "[S]earch selection (Dir)" })
map("v", "<leader>sv", "<cmd>FzfLua grep_visual<cr>", { desc = "[S]earch selection (Dir)" })

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


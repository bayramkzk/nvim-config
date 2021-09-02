vim.g.mapleader = " "

-- Stop hightlighting search matches
vim.api.nvim_set_keymap("n", "<ESC>", ":noh<CR>", {noremap = true, silent = true})

-- Switch windows easier
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", {silent = true})
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", {silent = true})
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", {silent = true})
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", {silent = true})

vim.api.nvim_set_keymap("n", "<LEADER>h", "<C-w>h", {silent = true})
vim.api.nvim_set_keymap("n", "<LEADER>j", "<C-w>j", {silent = true})
vim.api.nvim_set_keymap("n", "<LEADER>k", "<C-w>k", {silent = true})
vim.api.nvim_set_keymap("n", "<LEADER>l", "<C-w>l", {silent = true})

-- Close current tab
vim.api.nvim_set_keymap("n", "<LEADER>w", ":BufferClose<CR>", {noremap = true, silent = true})

-- Switch to next/previous tab
vim.api.nvim_set_keymap("n", "<TAB>", ":BufferNext<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<S-TAB>", ":BufferPrevious<CR>", {noremap = true, silent = true})

-- Move current tab to next/previous
vim.api.nvim_set_keymap("n", "<LEADER>]", ":BufferMoveNext<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<LEADER>[", ":BufferMovePrevious<CR>", {noremap = true, silent = true})

-- Jump to tab
vim.api.nvim_set_keymap("n", "<LEADER>1", ":BufferGoto1<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<LEADER>2", ":BufferGoto2<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<LEADER>3", ":BufferGoto3<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<LEADER>4", ":BufferGoto4<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<LEADER>5", ":BufferGoto5<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<LEADER>6", ":BufferGoto6<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<LEADER>7", ":BufferGoto7<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<LEADER>8", ":BufferGoto8<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<LEADER>9", ":BufferGoto9<CR>", {noremap = true, silent = true})

-- Copy/cut/paste to/from system clipboard
vim.api.nvim_set_keymap("n", "<LEADER>p", '"+p', {noremap = true})
vim.api.nvim_set_keymap("v", "<LEADER>p", '"+p', {noremap = true})
vim.api.nvim_set_keymap("n", "<LEADER>P", '"+P', {noremap = true})
vim.api.nvim_set_keymap("v", "<LEADER>P", '"+P', {noremap = true})
vim.api.nvim_set_keymap("n", "<LEADER>y", '"+yy', {noremap = true})
vim.api.nvim_set_keymap("v", "<LEADER>y", '"+y', {noremap = true})
vim.api.nvim_set_keymap("n", "<LEADER>d", '"+dd', {noremap = true})
vim.api.nvim_set_keymap("v", "<LEADER>d", '"+d', {noremap = true})
vim.api.nvim_set_keymap("n", "<LEADER>D", '"+D', {noremap = true})
vim.api.nvim_set_keymap("v", "<LEADER>D", '"+D', {noremap = true})

-- Reselect selected lines after incrementing/decrementing indent level
vim.api.nvim_set_keymap("v", "<", "<gv", {noremap = true, silent = true})
vim.api.nvim_set_keymap("v", ">", ">gv", {noremap = true, silent = true})

-- Toggle nvim-tree
vim.api.nvim_set_keymap("n", "<LEADER>e", ":NvimTreeToggle<CR>", {noremap = true, silent = true})

-- LSP
vim.api.nvim_set_keymap("n", "gd", ":lua vim.lsp.buf.definition()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "gD", ":lua vim.lsp.buf.declaration()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "gr", ":lua vim.lsp.buf.references()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "gi", ":lua vim.lsp.buf.implementation()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "K", ":lua vim.lsp.buf.hover()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<C-n>", ":lua vim.lsp.diagnostic.goto_prev()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<C-p>", ":lua vim.lsp.diagnostic.goto_next()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<LEADER>r", ":lua vim.lsp.buf.rename()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<LEADER>a", ":lua vim.lsp.buf.code_action()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("v", "<LEADER>a", ":lua vim.lsp.buf.range_code_action()<CR>", {noremap = true, silent = true})

-- Formatting
vim.api.nvim_set_keymap("n", "<LEADER>f", ":Format<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("v", "<LEADER>f", ":Format<CR>", {noremap = true, silent = true})

-- Completion
vim.api.nvim_set_keymap("i", "<TAB>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<TAB>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-TAB>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-TAB>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<CR>", "compe#confirm('<CR>')", {expr = true, silent = true, noremap = true})
vim.api.nvim_set_keymap("i", "<C-SPACE>", "compe#complete()", {expr = true})

-- Telescope
vim.api.nvim_set_keymap("n", "<LEADER><LEADER>", ":Telescope find_files<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<LEADER>gc", ":Telescope git_commits<CR>", {noremap = true, silent = true})

-- Jumper
vim.api.nvim_set_keymap("n", "<LEADER>j", ":HopWord<CR>", {noremap = true, silent = true})

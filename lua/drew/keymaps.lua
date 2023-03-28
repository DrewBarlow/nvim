local opts = {silent = true}

vim.keymap.set("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- move highlighted lines up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- disable <S-j> and <C-w> because they suck
vim.keymap.set("n", "<S-j>", "<ESC>", opts)
vim.keymap.set("n", "<C-w>", "<ESC>", opts)

-- disable everything related to q because it is terrible
vim.keymap.set("n", "q", "<NOP>", opts)

-- window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

-- resize windows with arrows
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<C-Left>", ":vertical resize +2<CR>", opts)
vim.keymap.set("n", "<C-Right>", ":vertical resize -2<CR>", opts)

-- shift buffers
vim.keymap.set("n", "<S-l>", ":bnext<CR>", opts)
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", opts)

-- clear highlights
vim.keymap.set("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- close current buffer
vim.keymap.set("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)

-- clipboard paste
vim.keymap.set("v", "p", '"_dP', opts)

-- stay in indent mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- commenting
vim.keymap.set("n", "<C-/>", "<cmd>lua require('Comment.api').toggle.linewise.current()<cr>", {silent = true})
vim.keymap.set("x", "<C-/>", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", {silent = true})

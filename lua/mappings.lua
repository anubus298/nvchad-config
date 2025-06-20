require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
map("t", "<Esc>", [[<C-\><C-n>]], { noremap = true })
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

vim.g.VM_maps = {
  ["Find Under"] = "<leader>m", -- Replace with your preferred key
}

-- Copy to system clipboard with <leader>y
map({ "n", "v" }, "<leader>y", [["+y]])

-- Move selected line(s) down in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- Move selected line(s) up in visual mode
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Scroll down half a page and center cursor
vim.keymap.set("n", "<C-d>", "<C-d>zz")

-- Scroll up half a page and center cursor
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Paste over selection without overwriting unnamed register
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Yank (copy) to system clipboard (normal + visual)
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])

-- Yank (copy) whole line to system clipboard
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Make Ctrl+c behave like Esc in insert ;mode
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Go to next diagnostic
vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next)

-- Go to previous diagnostic
vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev)

-- Show diagnostic in floating window
vim.keymap.set("n", "<leader>df", vim.diagnostic.open_float)

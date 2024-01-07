-- Leader key set to do nothing
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Keybind to exit to Netrw
vim.keymap.set({ "n", "v" }, "<leader>qq", vim.cmd.Ex, { desc = "[Q]uit to Netrw" })

-- Auto center screen when paging up/down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Source current file
vim.keymap.set("n", "<leader><leader>x", ":source %<CR>", { desc = "[S]ource current file" })

-- Misc. Tricks
vim.keymap.set("n", "YY", "va{Vy", { desc = "[Y]ank between brackets" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })

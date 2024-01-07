vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.editorconfig = true

vim.o.clipboard = "unnamedplus"
vim.o.completeopt = "menuone,noselect"
vim.o.mouse = "a"

vim.o.wrap = false
vim.o.textwidth = 100

vim.o.hlsearch = false
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.smartindent = true

vim.o.guicursor = ""
vim.o.scrolloff = 8
vim.o.errorbells = false

vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.termguicolors = true
vim.o.background = "dark"

vim.o.undofile = true
vim.o.swapfile = false
vim.o.backup = false
vim.o.spellfile = vim.fn.stdpath("config") .. "/spell/en.utf-8.add"

vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.signcolumn = "yes"
vim.wo.colorcolumn = "100"

-- Should GitHub Copilot be enabled
vim.g.copilot = true
-- Should Mason be enabled (disable when using NixOS)
vim.g.mason = false

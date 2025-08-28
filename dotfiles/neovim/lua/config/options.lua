-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.o.shell = "/home/kawid/.nix-profile/bin/zsh"

vim.g.clipboard = {
	name = "Clipboard",
	copy = {
		["+"] = "cb copy",
		["*"] = "cb copy",
	},
	paste = {
		["+"] = "cb paste",
		["*"] = "cb paste",
	},
	cache_enabled = false,
}

vim.opt.wrap = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

vim.lsp.enable("omnisharp")
vim.lsp.enable("nil")
vim.lsp.enable("jsonls")

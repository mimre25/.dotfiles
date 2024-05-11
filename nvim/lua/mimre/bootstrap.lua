local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local vim_plug_path = vim.fn.stdpath("data") .. "/site/autoload/plug.vim"
if not vim.loop.fs_stat(vim_plug_path) then
	vim.fn.system({
		"git",
		"clone",
		"https://github.com/junegunn/vim-plug.git",
		"--branch=master",
		vim_plug_path,
	})
end

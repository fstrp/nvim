vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.o.number = true
vim.o.relativenumber = not vim.o.diff
vim.o.mouse = "a"
vim.o.mousescroll = "ver:6"
vim.o.nrformats = "blank,bin,hex"

vim.o.laststatus = 3
vim.o.confirm = true
vim.o.winborder = "rounded"

vim.o.wrap = false
vim.o.smoothscroll = true
vim.o.fillchars = "diff: ,eob: ,fold: ,foldopen:,foldsep: ,foldinner: ,foldclose:"
vim.o.foldcolumn = "1"
vim.opt.diffopt:append({ "iwhite", "algorithm:histogram", "context:30" })

vim.o.title = true
if not vim.o.diff then
    vim.o.titlestring = "nvim: %{split(split(getcwd(), '\\')[-1], '/')[-1]}"
else
    vim.o.titlestring = "diff: %{argv()}"
end

vim.o.showmode = false
vim.o.signcolumn = "yes"
vim.o.inccommand = "split"
vim.o.cursorline = true
vim.o.breakindent = true

vim.o.undofile = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.updatetime = 250
vim.o.timeoutlen = 400

vim.o.splitright = true
vim.o.splitbelow = true

vim.o.list = true
vim.opt.listchars = { tab = "· ", trail = "·", nbsp = "␣" }

vim.o.scrolloff = 8
vim.o.sidescrolloff = 20

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

if vim.g.neovide then
    vim.g.neovide_cursor_animation_length = 0.04
    vim.g.neovide_cursor_short_animation_length = 0
    vim.g.neovide_cursor_trail_size = 0
    vim.g.neovide_cursor_animate_in_insert_mode = false
end

if vim.fn.executable("rg") == 1 then
    vim.o.grepprg = "rg --vimgrep --smart-case"
end

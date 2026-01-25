vim.o.number = true
vim.o.relativenumber = not vim.o.diff
vim.o.mouse = "a"

vim.o.laststatus = 3
vim.o.confirm = true
vim.o.winborder = "rounded"

vim.o.wrap = false
vim.o.smoothscroll = true
vim.opt.fillchars:append({ diff = " " })
vim.opt.diffopt:append({ "iwhite", "linematch:60", "indent-heuristic", "algorithm:histogram", "context:30" })

vim.o.title = true
if not vim.o.diff then
    vim.o.titlestring = "nvim: %{split(split(getcwd(), '\\')[-1], '/')[-1]}"
else
    vim.o.titlestring = "diff: %{argv()}"
end

-- Don't show the mode, since it's already in the status line
vim.o.showmode = false

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.o.signcolumn = "yes"

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 400

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
vim.o.list = true
vim.opt.listchars = { tab = "· ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
vim.o.inccommand = "split"

-- Show which line your cursor is on
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
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

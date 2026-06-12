vim.pack.add({
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
})

vim.o.foldlevel = 99
vim.o.foldlevelstart = 99

---@param buf integer
---@param language string
local function treesitter_try_attach(buf, language)
    if not vim.treesitter.language.add(language) then
        return
    end

    vim.treesitter.start(buf, language) -- highlighting

    if vim.treesitter.query.get(language, "folds") then
        vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
        vim.wo[0][0].foldmethod = "expr"
    end

    if vim.treesitter.query.get(language, "indents") then
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
end

local available_parsers = require("nvim-treesitter").get_available()

vim.api.nvim_create_autocmd("FileType", {
    desc = "auto-install and enable treesitter",
    group = vim.api.nvim_create_augroup("custom.treesitter.file-type", { clear = true }),
    callback = function(args)
        local buf, filetype = args.buf, args.match

        local exclude_filetypes = { "csv", "dockerfile" }
        if vim.tbl_contains(exclude_filetypes, filetype) then
            return
        end

        local language = vim.treesitter.language.get_lang(filetype)
        if not language then
            return
        end

        local installed_parsers = require("nvim-treesitter").get_installed("parsers")

        if vim.tbl_contains(installed_parsers, language) then
            -- enable the parser if it is installed
            treesitter_try_attach(buf, language)
        elseif vim.tbl_contains(available_parsers, language) then
            -- if a parser is available in `nvim-treesitter` enable it after ensuring it is installed
            require("nvim-treesitter").install(language):await(function()
                treesitter_try_attach(buf, language)
            end)
        else
            -- try to enable treesitter features in case the parser exists but is not available from `nvim-treesitter`
            treesitter_try_attach(buf, language)
        end
    end,
})

require("nvim-treesitter").install({
    "bash",
    "c",
    "diff",
    "gitcommit",
    "html",
    "lua",
    "luadoc",
    "markdown",
    "markdown_inline",
    "query",
    "vim",
    "vimdoc",
})

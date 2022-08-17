local status, ident_blankline = pcall(require, "indent_blankline")
if not status then
    vim.notify("没有找到 indent_blankline")
    return
end

ident_blankline.setup({
    -- -- 空行占位
    -- space_char_blankline = " ",
    -- -- 用 treesitter 判断上下文
    -- show_current_context = true,
    -- show_current_context_start = true,
    -- context_patterns = {
        -- "class",
        -- "function",
        -- "method",
        -- "element",
        -- "^if",
        -- "^while",
        -- "^for",
        -- "^object",
        -- "^table",
        -- "block",
        -- "arguments",
    -- },
    -- -- :echo &filetype
    -- filetype_exclude = {
        -- "dashboard",
        -- "packer",
        -- "terminal",
        -- "help",
        -- "log",
        -- "markdown",
        -- "TelescopePrompt",
        -- "lsp-installer",
        -- "lspinfo",
        -- "toggleterm",
    -- },
    -- -- 竖线样式
    -- -- char = '¦'
    -- -- char = '┆'
    -- -- char = '│'
    -- -- char = "⎸",
    -- char = "▏",
    char = "│",
    show_first_indent_level = true,
    filetype_exclude = {
        "startify",
        "dashboard",
        "dotooagenda",
        "log",
        "fugitive",
        "gitcommit",
        "packer",
        "vimwiki",
        "markdown",
        "json",
        "txt",
        "vista",
        "help",
        "todoist",
        "NvimTree",
        "peekaboo",
        "git",
        "TelescopePrompt",
        "undotree",
        "flutterToolsOutline",
        "", -- for all buffers without a file type
    },
    buftype_exclude = { "terminal", "nofile" },
    show_trailing_blankline_indent = false,
    show_current_context = true,
    context_patterns = {
        "class",
        "function",
        "method",
        "block",
        "list_literal",
        "selector",
        "^if",
        "^table",
        "if_statement",
        "while",
        "for",
        "type",
        "var",
        "import",
    },
    space_char_blankline = " ",
})

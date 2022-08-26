--[[
 THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
 `lvim` is the global options object
]]

-- Enable powershell as your default shell
vim.opt.shell = "pwsh.exe -NoLogo"
vim.opt.shellcmdflag =
"-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
vim.cmd [[
		let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
		let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
		set shellquote= shellxquote=
  ]]

-- Set a compatible clipboard manager
vim.g.clipboard = {
    copy = {
        ["+"] = "win32yank.exe -i --crlf",
        ["*"] = "win32yank.exe -i --crlf",
    },
    paste = {
        ["+"] = "win32yank.exe -o --lf",
        ["*"] = "win32yank.exe -o --lf",
    },
}

-- general
lvim.log.level = "warn"
lvim.format_on_save = false
lvim.colorscheme = "dracula"
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<C-z>"] = "u"
lvim.keys.insert_mode["<C-z>"] = "<ESC>u"
lvim.keys.insert_mode["<C-s>"] = "<ESC>:w<CR>"

lvim.keys.normal_mode["qq"] = ":q!<CR>"
lvim.keys.normal_mode["q"] = ":q<CR>"
lvim.keys.normal_mode["Q"] = ":qa!<CR>"

lvim.keys.normal_mode["<A-o>"] = ":ClangdSwitchSourceHeader<CR>"
lvim.keys.insert_mode["<A-o>"] = "<ESC>:ClangdSwitchSourceHeader<CR>"

lvim.keys.normal_mode["<C-p>"] = "<cmd>Telescope find_files<CR>"
lvim.keys.normal_mode[";e"] = "<cmd>NvimTreeToggle<CR>"

lvim.keys.normal_mode["<leader><leader><tab>"] = "<cmd>BufferLineCyclePrev<cr>"
lvim.keys.normal_mode["<leader><tab>"] = "<cmd>BufferLineCycleNext<cr>"

lvim.keys.insert_mode["<C-h>"] = "<ESC>I"
lvim.keys.insert_mode["<C-l>"] = "<ESC>A"
lvim.keys.normal_mode["<C-h>"] = "^"
lvim.keys.normal_mode["<C-l>"] = "$"
lvim.keys.normal_mode["<leader>p"] = "<C-o>"
lvim.keys.normal_mode["<leader>n"] = "<C-i>"

lvim.keys.normal_mode["<C-h>"] = "<C-w>h"
lvim.keys.normal_mode["<C-l>"] = "<C-w>l"
lvim.keys.normal_mode["<C-j>"] = "<C-w>j"
lvim.keys.normal_mode["<C-k>"] = "<C-w>k"

lvim.keys.normal_mode[">"] = "<C-w>>"
lvim.keys.normal_mode["<"] = "<C-w><"
lvim.keys.normal_mode[","] = "<C-w>+"
lvim.keys.normal_mode["."] = "<C-w>-"

lvim.keys.normal_mode["<C-c>"] = "y"

lvim.keys.normal_mode["<leader>t"] = "<cmd>FloatermNew<cr>"

-- todo
--lvim.keys.normal_mode["<C-/>"] = "<cmd>comment_toggle_linewise_current"

lvim.keys.normal_mode["<leader>sF"] = '<cmd>Telescope file_browser<cr>'
lvim.builtin.which_key.mappings.f.name = "Find"
lvim.builtin.which_key.mappings.f = { c = { require("lvim.core.telescope.custom-finders").find_project_files,
    "Find Project files" } }

-- ====for live_grep args====:
-- for rp usage: reference: https://segmentfault.com/a/1190000016170184
-- -i ignore case
-- -s 大小写敏感
-- -w match word
-- -e 正则表达式匹配
-- -v 反转匹配
-- -g 通配符文件或文件夹，可以用!来取反
lvim.builtin.which_key.mappings.f = { a = { "<cmd>Telescope live_grep_args<cr>", "live_grep_args" } }

lvim.keys.normal_mode["vv"] = "<C-v>"
-- lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
-- lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

-- 不可见字符的显示，这里只把空格显示为一个点
vim.opt.list = true
vim.opt.listchars:append("space:·")
vim.opt.listchars:append("tab:⚑☛")
vim.opt.listchars:append("trail:☠")
--vim.opt.listchars:append("eol:↴")

-- 设置缩进
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.bo.tabstop = 4
vim.opt.shiftwidth = 4
vim.bo.shiftwidth = 4

vim.opt.expandtab = true
vim.bo.expandtab = true

lvim.builtin.bufferline.options.numbers = "ordinal"
lvim.builtin.telescope.pickers.find_files.theme = "dropdown"
lvim.builtin.telescope.pickers.find_files.find_command = { "fd" }

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
-- }

-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
-- lvim.builtin.terminal.shell = "pwsh.exe -NoLogo"

-- nvim-tree has some performance issues on windows, see kyazdani42/nvim-tree.lua#549
lvim.builtin.nvimtree.setup.diagnostics.enable = nil
lvim.builtin.nvimtree.setup.filters.custom = nil
lvim.builtin.nvimtree.setup.git.enable = nil
lvim.builtin.nvimtree.setup.update_cwd = nil
lvim.builtin.nvimtree.setup.update_focused_file.update_cwd = nil
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.highlight_git = nil
lvim.builtin.nvimtree.setup.renderer.icons.show.git = nil

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
    "c",
    "lua",
    "cpp",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.treesitter.rainbow.enable = true
lvim.builtin.treesitter.rainbow.colors = { "#ddaaaa", "#ab6985", "#D6A760", "#7794f4", "#b38bf5", "#7cc7fe" }

lvim.builtin.which_key.mappings.l = vim.tbl_extend("keep", lvim.builtin.which_key.mappings.l,
    { o = { "<cmd>SymbolsOutline<cr>", "Open Outline" } })

-- generic LSP settings

-- -- make sure server will always be installed even if the server is in skipped_servers list
-- lvim.lsp.installer.setup.ensure_installed = {
--     "sumeko_lua",
--     "jsonls",
-- }
-- -- change UI setting of `LspInstallInfo`
-- -- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
-- lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- lvim.lsp.installer.setup.ui.border = "rounded"
-- lvim.lsp.installer.setup.ui.keymaps = {
--     uninstall_server = "d",
--     toggle_server_expand = "o",
-- }

-- ---@usage disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- vim.tbl_map(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "black", filetypes = { "python" } },
--   { command = "isort", filetypes = { "python" } },
--   {
--     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--print-with", "100" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--severity", "warning" },
--   },
--   {
--     command = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }

-- Additional Plugins
-- lvim.plugins = {
--     {"folke/tokyonight.nvim"},
--     {
--       "folke/trouble.nvim",
--       cmd = "TroubleToggle",
--     },
-- }
vim.opt.fillchars = {
    vert = "▕", -- alternatives │
    fold = " ",
    eob = " ", -- suppress ~ at EndOfBuffer
    diff = "╱", -- alternatives = ⣿ ░ ─
    msgsep = "‾",
    foldopen = "▾",
    foldsep = "│",
    foldclose = "▸",
}

lvim.plugins = {
    { "folke/tokyonight.nvim" },
    {
        "folke/trouble.nvim",
        cmd = "TroubleToggle",
    },
    { 'Mofiqul/dracula.nvim' },
    { "p00f/nvim-ts-rainbow" },
    { "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("indent_blankline").setup {
                space_char_blankline = " ",
                show_current_context = true,
                show_current_context_start = true,
            }
        end },

    { "simrat39/symbols-outline.nvim", cmd = "SymbolsOutline", config = function()
        require("symbols-outline").setup({})
    end
    },
    { 'voldikss/vim-floaterm' },
    { 'fgheng/winbar.nvim',
        config = function()
            require('winbar').setup({
                enabled = true,

                show_file_path = true,
                show_symbols = true,

                colors = {
                    path = '#c946fd', -- You can customize colors like #c946fd
                    file_name = '#ccddaa',
                    symbols = '#aadddd',
                },

                icons = {
                    file_icon_default = '',
                    seperator = '>',
                    editor_state = '●',
                    lock_icon = '',
                },

                exclude_filetype = {
                    'help',
                    'startify',
                    'dashboard',
                    'packer',
                    'neogitstatus',
                    'NvimTree',
                    'Trouble',
                    'alpha',
                    'lir',
                    'Outline',
                    'spectre_panel',
                    'toggleterm',
                    'qf',
                }
            })
        end
    },
    {
        "SmiteshP/nvim-gps",
        requires = "nvim-treesitter/nvim-treesitter",
        config = function()
            require("nvim-gps").setup()
        end
    },
    { "nvim-telescope/telescope-live-grep-args.nvim",
        config = function()
            require("telescope").load_extension("live_grep_args")
        end
    },
    { 'nvim-telescope/telescope-ui-select.nvim',
        config = function()
            require("telescope").load_extension("ui-select")
        end
    },
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })

-- 基础设置
require('basic')
-- 快捷键
require("keybindings")
-- 插件管理
require("plugins")
-- 主题
require("colorscheme")
-- 自动命令
require("autocmds")

-- 插件配置
require("plugin-config.nvim-tree")
require("plugin-config.bufferline")
require("plugin-config.lualine")
require("plugin-config.telescope")
require("plugin-config.dashboard")
require("plugin-config.project")
require("plugin-config.nvim-treesitter")
require("plugin-config.comment")
require("plugin-config.toggleterm")
require("plugin-config.surround")
require("plugin-config.nvim-autopairs")
require("plugin-config.gitsign")
require("plugin-config.diffview")
require("plugin-config.indent-blankline")
require("plugin-config.which-key")
require("plugin-config.vim-illuminate")
require("plugin-config.fidget")

-- LSP
require("lsp.setup")
--require("lsp.complete")
require("lsp.ui")
require("lsp.cmp")

------------------------------------------- vscode neovim 插件
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- 配置剪切板
--vim.opt.clipboard = "unnamedplus"

local map = vim.api.nvim_set_keymap
local opt = {
    noremap = true,
    silent = true
}

-- 高亮所在行
vim.wo.cursorline = false
-- 显示左侧图标指示列
vim.wo.signcolumn = "yes"
-- 右侧参考线，超过表示代码太长了，考虑换行
vim.wo.colorcolumn = "100"
-- 缩进2个空格等于一个Tab
vim.o.tabstop = 4
vim.bo.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftround = true
-- >> << 时移动长度
vim.o.shiftwidth = 4
vim.bo.shiftwidth = 4
-- 空格替代tab
vim.o.expandtab = true
vim.bo.expandtab = true
-- 新行对齐当前行
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true
-- 搜索大小写不敏感，除非包含大写
vim.o.ignorecase = true
vim.o.smartcase = true
-- 搜索不要高亮
vim.o.hlsearch = false
-- 边输入边搜索
vim.o.incsearch = true
-- 命令行高为2，提供足够的显示空间
vim.o.cmdheight = 2
-- 当文件被外部程序修改时，自动加载
vim.o.autoread = true
vim.bo.autoread = true
-- 禁止折行
vim.wo.wrap = false
-- 光标在行首尾时<Left><Right>可以跳到下一行
vim.o.whichwrap = '<,>,[,]'
-- 允许隐藏被修改过的buffer
vim.o.hidden = true
-- 鼠标支持
vim.o.mouse = "a"
-- 设置 timeoutlen 为等待键盘快捷键连击时间500毫秒，可根据需要设置
vim.o.timeoutlen = 500
-- split window 从下边和右边出现
vim.o.splitbelow = true
vim.o.splitright = true
-- 自动补全不自动选中
vim.g.completeopt = "menu,menuone,noselect,noinsert"
-- 样式
vim.o.background = "dark"
vim.o.termguicolors = true
vim.opt.termguicolors = true

map("n", "vv", "<C-v>", opt)

-- 删除设置
vim.cmd([[nnoremap dd    "_dd]])
vim.cmd([[nnoremap daw   "_daw]])
vim.cmd([[nnoremap dw    "_d2"]])
vim.cmd([[nnoremap D     "_D]])
vim.cmd([[nnoremap di"   "_di"]])
vim.cmd([[nnoremap di(   "_di(]])
vim.cmd([[nnoremap di{   "_di{]])

vim.cmd([[nnoremap <leader>dd    ""dd]])
vim.cmd([[nnoremap <leader>daw   ""daw]])
vim.cmd([[nnoremap <leader>dw    ""d2"]])
vim.cmd([[nnoremap <leader>D     ""D]])
vim.cmd([[nnoremap <leader>di"   ""di"]])
vim.cmd([[nnoremap <leader>di(   ""di(]])
vim.cmd([[nnoremap <leader>di{   ""di{]])

vim.cmd([[vnoremap d     "_d]])
vim.cmd([[vnoremap dd    "_dd]])
vim.cmd([[vnoremap daw   "_daw]])
vim.cmd([[vnoremap dw    "_d2"]])
vim.cmd([[vnoremap D     "_D]])
vim.cmd([[vnoremap di"   "_di"]])
vim.cmd([[vnoremap di(   "_di(]])
vim.cmd([[vnoremap di{   "_di{]])

vim.cmd([[vnoremap <leader>d     ""d]])
vim.cmd([[vnoremap <leader>dd    ""dd]])
vim.cmd([[vnoremap <leader>daw   ""daw]])
vim.cmd([[vnoremap <leader>dw    ""d2"]])
vim.cmd([[vnoremap <leader>D     ""D]])
vim.cmd([[vnoremap <leader>di"   ""di"]])
vim.cmd([[vnoremap <leader>di(   ""di(]])
vim.cmd([[vnoremap <leader>di{   ""di{]])

-- 左右比例控制
map("n", ">", ":vertical resize -2<CR>", opt)
map("n", "<", ":vertical resize +2<CR>", opt)
map("n", "s,", ":vertical resize -20<CR>", opt)
map("n", "s.", ":vertical resize +20<CR>", opt)
-- 上下比例
map("n", "sj", ":resize +10<CR>", opt)
map("n", "sk", ":resize -10<CR>", opt)
-- 等比例
map("n", "s=", "<C-w>=", opt)

if vim.g.vscode then
    local rangeHandler = vim.api.nvim_exec([[
        function! s:vscodeFormat(...) abort
            if !a:0
                let &operatorfunc = matchstr(expand('<sfile>'), '[^. ]*$')
                return 'g@'
            elseif a:0 > 1
                let [line1, line2] = [a:1, a:2]
            else
                let [line1, line2] = [line("'["), line("']")]
            endif
        
            call VSCodeCallRange('editor.action.formatSelection', line1, line2, 0)
        endfunction
        
        " Bind format to vscode format selection
        xnoremap <expr> <leader>f <SID>vscodeFormat()
        nnoremap <expr> <leader>f <SID>vscodeFormat()
        nnoremap <expr> == <SID>vscodeFormat() . '_'
        
        ]], true)

    vim.api.nvim_exec([[
            function! s:vscodeCommentary(...) abort
                if !a:0
                    let &operatorfunc = matchstr(expand('<sfile>'), '[^. ]*$')
                    return 'g@'
                elseif a:0 > 1
                    let [line1, line2] = [a:1, a:2]
                else
                    let [line1, line2] = [line("'["), line("']")]
                endif
            
                call VSCodeCallRange('editor.action.commentLine', line1, line2, 0)
            endfunction
            
            " Bind C-/ to vscode commentary since calling from vscode produces double comments due to multiple cursors
            xnoremap <expr> gc <SID>vscodeCommentary()
            nnoremap <expr> gc <SID>vscodeCommentary()
            nnoremap <expr> gC <SID>vscodeCommentary() . '_'
        ]], true)

    vim.api.nvim_exec([[
        " 复制后高亮
        augroup highlight_yank
            autocmd!
            au TextYankPost * silent! lua vim.highlight.on_yank()
        augroup END
          ]], true)

    -- 转到文件中上一个问题
    map("n", "g[", "<Cmd>call VSCodeNotify('editor.action.marker.prevInFiles')<CR>", opt)
    -- 转到文件中下一个问题
    map("n", "g]", "<Cmd>call VSCodeNotify('editor.action.marker.nextInFiles')<CR>", opt)
    -- 使用vscode的undo替换nvim的undo
    map("n", "u", "<Cmd>call VSCodeNotify('undo')<CR>", opt)
    -- easymotion相关配置
    -- let g:EasyMotion_smartcase = 0
    -- easymotion前缀 leader leader
    -- map <Leader> <Plug>(easymotion-prefix)

    map("n", ";", "<Cmd>call VSCodeNotify('whichkey.show')<cr>", opt)

    map("n", "<leader><tab>", "<Cmd>call VSCodeNotify('workbench.action.nextEditor')<cr>", opt)
    map("n", "<leader><leader><tab>",
        "<Cmd>call VSCodeNotify('workbench.action.previousEditor')<cr>", opt)

    map("n", "<leader>n", "<Cmd>call VSCodeNotify('workbench.action.navigateForward')<cr>", opt)
    map("n", "<leader>p", "<Cmd>call VSCodeNotify('workbench.action.navigateBack')<cr>", opt)

    map("n", "<leader>f", "<Cmd>call VSCodeNotify('editor.action.formatDocument')<cr>", opt)

    map("n", "<leader>u", "<Cmd>call VSCodeNotify('editor.action.referenceSearch.trigger')<cr>", opt)
    map("n", "<leader>U", "<Cmd>call VSCodeNotify('references-view.findReferences')<cr>", opt)
    map("n", "<leader>ch", "<Cmd>call VSCodeNotify('references-view.showCallHierarchy')<cr>", opt)

    map("v", ">", ">gv", opt)
    map("v", "<", "<gv", opt)
    -- 在visual 模式里粘贴不要复制
    map("v", "p", '"_dP', opt)

    map("n", "<leader>q", "<Cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<cr>", opt)
    map("n", "<leader>w", "<Cmd>call VSCodeNotify('workbench.action.files.save')<cr>", opt)
end

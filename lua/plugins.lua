local fn = vim.fn

local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {"git", "clone", "--depth", "1",
                                  "https://github.com/wbthomason/packer.nvim", install_path}
    print("Installing packer close and reopen NeoVim🏀")
    vim.cmd [[packadd packer.nvim]]
end

local packer = require("packer")
packer.startup(function(use)
    -- Packer 可以管理自己本身
    use 'wbthomason/packer.nvim'

    -- 浮动窗口进行插件安装
    config = {
        display = {
            open_fn = function()
                return require("packer.util").float({
                    border = "single"
                })
            end
        }
    }

    -- 你的插件列表...
    -- 主题
    use("folke/tokyonight.nvim")
    -- 侧边文件浏览
    use({
        "kyazdani42/nvim-tree.lua",
        requires = "kyazdani42/nvim-web-devicons"
    })
    -- 标签栏
    use({
        "akinsho/bufferline.nvim",
        requires = {"kyazdani42/nvim-web-devicons", "moll/vim-bbye"}
    })
    -- 底部状态栏
    use({
        "nvim-lualine/lualine.nvim",
        requires = {"kyazdani42/nvim-web-devicons"}
    })
    use("arkav/lualine-lsp-progress")
    -- 模糊查找
    use {
        'nvim-telescope/telescope.nvim',
        requires = {"nvim-lua/plenary.nvim"}
    }
    -- telescope extensions
    use("LinArcX/telescope-env.nvim")
    use("nvim-telescope/telescope-ui-select.nvim")
    -- project
    use("ahmedkhalf/project.nvim")
    -- 启动页
    use("glepnir/dashboard-nvim")
    -- 代码高亮
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        requires = {"p00f/nvim-ts-rainbow"}
    })
    -- LSP
    use(
        {"williamboman/nvim-lsp-installer" --[[, commit = "36b44679f7cc73968dbb3b09246798a19f7c14e0" --]] })
    use({"neovim/nvim-lspconfig"})
    -- use { "williamboman/mason.nvim" }
    -- use { "williamboman/mason-lspconfig.nvim" }
    -- 补全引擎
    use("hrsh7th/nvim-cmp")
    -- snippet 引擎
    use("hrsh7th/vim-vsnip")
    -- 补全源
    use("hrsh7th/cmp-vsnip")
    use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
    use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
    use("hrsh7th/cmp-path") -- { name = 'path' }
    use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }
    use("hrsh7th/cmp-nvim-lsp-signature-help") -- { name = 'nvim_lsp_signature_help' }
    -- 常见编程语言代码段
    use("rafamadriz/friendly-snippets")

    -- ui(补全变量图标)
    use("onsails/lspkind-nvim")

    -- indent-blankline
    use("lukas-reineke/indent-blankline.nvim")

    use("tami5/lspsaga.nvim")
    use("windwp/nvim-autopairs")

    -- git 
    use("lewis6991/gitsigns.nvim")
    use('sindrets/diffview.nvim')

    use("folke/which-key.nvim")
    use "RRethy/vim-illuminate" -- highlight undercursor word   --  NOTE: 可能造成卡顿

    -- 代码格式化
    use("mhartington/formatter.nvim")
    use({
        "jose-elias-alvarez/null-ls.nvim",
        requires = "nvim-lua/plenary.nvim"
    })

    -- Lua 增强
    use("folke/lua-dev.nvim")

    -- OceanicNext
    use("mhartington/oceanic-next")
    -- gruvbox
    use({
        "ellisonleao/gruvbox.nvim",
        requires = {"rktjmp/lush.nvim"}
    })
    -- zephyr
    -- use("glepnir/zephyr-nvim")
    -- nord
    use("shaunsingh/nord.nvim")
    -- onedark
    use("ful1e5/onedark.nvim")
    -- nightfox
    use("EdenEast/nightfox.nvim")

    use({"akinsho/toggleterm.nvim"})
    -- surround
    use("ur4ltz/surround.nvim")
    -- Comment
    use("numToStr/Comment.nvim")
    -- vimspector
    use("puremourning/vimspector")
    ----------------------------------------------
    use("mfussenegger/nvim-dap")
    use("theHamsta/nvim-dap-virtual-text")
    use("rcarriga/nvim-dap-ui")
    use("j-hui/fidget.nvim")

end)

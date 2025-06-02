-- =========================================================================
-- 插件管理器：lazy
-- =========================================================================

-- 使用前提
-- Neovim >= 0.8.0 (needs to be built with LuaJIT)
-- Git >= 2.19.0 (for partial clones support)
-- a Nerd Font (optional)
-- luarocks to install rockspecs. You can remove rockspec from opts.pkg.sources to disable this feature.

-- 自动安装lazy插件管理器
-- stdpath("data")
-- macOS/Linux: ~/.local/share/nvim
-- Windows: ~/AppData/Local/nvim-data
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end

-- 将lazy的路径添加到运行时路径中，并放在最前
vim.opt.rtp:prepend(lazypath)

-- 管理插件
--[[ 1、lazy_loading文档: https://lazy.folke.io/spec/lazy_loading
Plugins will be lazy-loaded when one of the following is true
1. The plugin only exists as a dependency in your spec
2. It has an event, cmd, ft or keys key
（event中VeryLazy在neovim启动完成且空闲时加载）
（keys mode默认normal）
3. config.defaults.lazy == true ]]
--[[2、说明
1、init：用于vim.g.*配置
2、opts：设置setup的table，替代function config() xxx.setup()... end
3、config：插件setup结束后执行的函数（可用于autocmd，进阶快捷键）
]]
return require('lazy').setup({
    -- 主题
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    -- 文件列表
    {
        -- nvim-tree
        'nvim-tree/nvim-tree.lua',
        dependencies = 'nvim-tree/nvim-web-devicons', -- optional, 会随nvim-tree加载
        cmd = { "NvimTreeToggle", "NvimTreeFindFile", "NvimTreeFocus", "NvimTreeClose" },
        keys = {
            {'<leader>tb', '<cmd>NvimTreeToggle<CR>', mode = 'n', silent = true, desc = '打开/关闭nvim tree' }
        },
        init = function()
            -- 禁用netrw
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1
        end,
        opts = require('plugin-config/nvimtree').opts,
        config = require('plugin-config/nvimtree').configure(),
    },
    -- 图标
    {
        'nvim-tree/nvim-web-devicons',
        lazy = true
    },
    -- 状态栏
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = require('plugin-config/lualine').opts,
        event = "VeryLazy"
    },
    -- 快捷键提示
    {
        "folke/which-key.nvim",
        opts = {},
        cmd = 'WhichKey',
        event = 'VeryLazy'
    },
    -- terminal
    {'akinsho/toggleterm.nvim', version = '*', config = true},
    -- 模糊搜索
    -- telescope, telescope-file-browser: neovim >= 0.9
    {
        'nvim-telescope/telescope.nvim', version = '0.1.8',
        dependencies = {'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-file-browser.nvim'},
        cmd = 'Telescope',
        keys = {
            {'<leader>kk', '<Cmd>Telescope find_files<CR>', silent = true, desc = '查找文件'},
            {'<leader>qq', '<Cmd>Telescope live_grep<CR>', silent = true, desc = '按内容搜索（支持正则）'},
            {'<leader>ss', '<Cmd>Telescope grep_string<CR>', silent = true, desc = '以当前光标所在单词进行搜索'},
            {'<leader>rr', '<Cmd>Telescope oldfiles<CR>', silent = true, desc = '打开历史文件列表'},
            {'<leader>mr', '<Cmd>Telescope marks<CR>', silent = true, desc = '打开书签列表'},
            {'<leader>fb', '<Cmd>Telescope file_browser<CR>', silent = true, desc = '打开文件浏览器'},
            {'<leader>fj', '<Cmd>Telescope jumplist<CR>', silent = true, desc = '打开跳转列表'}
        },
        opts = require('plugin-config/telescope').opts
    },
    -- 编程语言语法高亮
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = require("plugin-config/treesitter").opts
    },
    -- lsp
    {'neovim/nvim-lspconfig', lazy=true},
    -- 快速安装不同语言的lsp的服务端
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
            "mason-org/mason.nvim",
            "neovim/nvim-lspconfig"
        },

    },
    -- 自动补全
    -- nvim-cmp
    {
        'hrsh7th/nvim-cmp',
        event = {"InsertEnter", "CmdlineEnter"},
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            'hrsh7th/cmp-vsnip',
            'hrsh7th/vim-vsnip'
        },
        config = function()
            require("plugin-config/cmp").setup()
        end
    },
    {'hrsh7th/cmp-nvim-lsp', lazy=true},
    {'hrsh7th/cmp-buffer', lazy=true},
    {'hrsh7th/cmp-path', lazy=true},
    {'hrsh7th/cmp-cmdline', lazy=true},
    -- autopairs
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        dependencies = { "nvim-treesitter/nvim-treesitter", "hrsh7th/nvim-cmp" },
        opts = {}
    },
    -- vsnip: vscode(LSP)'s snippets feature in neovim/vim
    {'hrsh7th/cmp-vsnip', lazy=true},
    {'hrsh7th/vim-vsnip', lazy=true},
    {'rafamadriz/friendly-snippets', lazy=true},
    -- lspkind
    'onsails/lspkind-nvim',
    -- LSP美化
    {
        -- lspsaga
        'glepnir/lspsaga.nvim',
        cmd = 'Lspsaga',
        event = 'VeryLazy',
        opts = {}
    },
    -- symbols outline
    {
        'simrat39/symbols-outline.nvim',
        opts = {},
        keys = {
            {'<leader>so', '<cmd>SymbolsOutline<CR>', silent = true, desc = '打开/关闭symbol outline'}
        }
    },
    -- git
    {
        -- gitsigns
        -- 不能用lazy加载
        'lewis6991/gitsigns.nvim',
        opts = require('plugin-config/gitsigns').opts,
    },
    {
        -- diffview
        'sindrets/diffview.nvim',
        dependencies = 'nvim-lua/plenary.nvim',
        event = "VeryLazy"
    },
    -- comments
    {
        'numToStr/Comment.nvim',
        event = 'VeryLazy',
        opts = require('plugin-config/comment').opts
    }
})

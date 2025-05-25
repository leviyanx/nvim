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
return require('lazy').setup({
    -- 主题
    'Mofiqul/vscode.nvim',      -- 对眼睛更友好，但深色模式显示效果差
    'folke/tokyonight.nvim',    -- 对比度更高一点
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    -- 文件列表
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = 'nvim-tree/nvim-web-devicons', -- optional
    },
    -- 状态栏
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    -- 快捷键提示
    "folke/which-key.nvim",
    -- terminal
    {'akinsho/toggleterm.nvim', version = '*', config = true},
    -- 模糊搜索
    -- telescope, telescope-file-browser: neovim >= 0.9
    {
        'nvim-telescope/telescope.nvim', version = '0.1.8',
        dependencies = 'nvim-lua/plenary.nvim'
    },
    'nvim-telescope/telescope-file-browser.nvim',
    -- 编程语言语法高亮
    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
    -- lsp
    'neovim/nvim-lspconfig',
    -- 快速安装不同语言的lsp的服务端
    {"mason-org/mason.nvim", version='^1.0.0'},
    {"mason-org/mason-lspconfig.nvim", version='^1.0.0'},
    -- 自动补全
    -- nvim-cmp
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    -- vsnip
    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',
    'rafamadriz/friendly-snippets',
    -- lspkind
    'onsails/lspkind-nvim',
    -- LSP美化
    'glepnir/lspsaga.nvim',
    -- symbols outline
    'simrat39/symbols-outline.nvim',
    -- git
    'lewis6991/gitsigns.nvim',
    {'sindrets/diffview.nvim', dependencies = 'nvim-lua/plenary.nvim'},
    -- comments
    {
        'numToStr/Comment.nvim',
        config = function()
            require('plugin-config/comment').setup()
        end
    }
})

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
    'Mofiqul/vscode.nvim',      -- 对眼睛更友好
    'folke/tokyonight.nvim',    -- 对比度更高一点
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
    "folke/which-key.nvim"
})

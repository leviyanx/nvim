local M = {}

M.opts = {
    -- LSP服务器安装列表
    ensure_installed = {
        'cmake',
        'clangd',
        'lua_ls',
        'pyright',
        'jsonls',
        'eslint' -- js, ts
    },
    -- 不允许自动安装
    automatic_installation = false,
    automatic_enable = {
        'lua_ls',
        'eslint'
    }
}

return M

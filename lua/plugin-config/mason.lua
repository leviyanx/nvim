require('mason').setup({
    PATH = 'prepend',
    ui = {
        border = 'rounded'
    }
})

-- LSP自动安装配置
require('mason-lspconfig').setup({
    -- LSP服务器安装列表
    ensure_installed = {
        'cmake',
        'clangd',
        'lua_ls',
        'pyright',
        'jsonls'
    },
    -- 允许自动安装
    automatic_installation = true
})

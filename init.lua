require('options')
require('keymappings')
require('autocmd')

-- 插件
require('plugins')
-- 启用主题
require('plugin-config/catppuccin')
-- 启用插件
require('plugin-config/toggleterm')

-- 加载LSP配置
require('lsp/lua')
require('lsp/cpp')
require('lsp/typescript')

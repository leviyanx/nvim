require('options')
require('keymappings')
require('autocmd')

-- 插件
require('plugins')
require('plugin-config/catppuccin') -- 启用主题
require('plugin-config/toggleterm') -- 启用终端
require('plugin-config/vsnip')      -- 配置vsnip

-- 加载LSP配置
require('lsp/lua')
require('lsp/cpp')
require('lsp/typescript')

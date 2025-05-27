require('options')
require('keymappings')
require('autocmd')

-- 插件
require('plugins')
-- 启用主题
-- require('plugin-config/tokyonight')
-- require('plugin-config/theme-vscode')
require('plugin-config/catppuccin')
-- 启用插件
require('plugin-config/toggleterm')
require('plugin-config/treesitter')
require('plugin-config/mason')
require('plugin-config/cmp')

-- 加载LSP配置
require('lsp/keymappings')
require('lsp/lua')
require('lsp/cpp')

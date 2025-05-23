require('options')
require('keymappings')
require('autocmd')

-- 安装插件
require('plugins')
-- 启用主题
-- require('plugin-config/tokyonight')
-- require('plugin-config/theme-vscode')
require('plugin-config/catppuccin')
-- 启用插件
require('plugin-config/nvimtree')
require('plugin-config/lualine')
require('plugin-config/whichkey')
require('plugin-config/toggleterm')
require('plugin-config/telescope')
require('plugin-config/treesitter')
require('plugin-config/mason')
require('plugin-config/cmp')
require('plugin-config/lspsaga')
require('plugin-config/symbols_outline')
require('plugin-config/gitsigns')

-- 加载LSP配置
require('lsp/lua')
require('lsp/cpp')

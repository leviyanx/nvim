require('options')
require('keymaps')
require('autocmd')

-- 安装插件
require('plugins')
-- （主题）插件
require('plugin-config/tokyonight')
require('plugin-config/theme-vscode')
-- 启用插件
require('plugin-config/nvimtree')
require('plugin-config/lualine')
require('plugin-config/whichkey')
require('plugin-config/toggleterm')
require('plugin-config/telescope')
require('plugin-config/treesitter')

-- 启用主题
vim.cmd[[colorscheme vscode]]

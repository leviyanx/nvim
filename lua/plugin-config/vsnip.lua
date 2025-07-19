-- 获取neovim配置目录的路径
local config_path = vim.fn.stdpath('config')

-- 配置g:vsnip_snippet_dir
vim.g.vsnip_snippet_dir = config_path .. '/vsnip_snippets'
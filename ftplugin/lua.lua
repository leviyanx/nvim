-- 设置tab转换为space
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

-- 取消自动注释，当前行是注释时，按下回车键会默认添加一行注释，这里取消这一行为
vim.opt_local.formatoptions = vim.opt_local.formatoptions - {"r", "c", "o"}


-- 加载语言配置
require('lsp/lua')

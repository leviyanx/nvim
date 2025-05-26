-- 注意：
-- api: vim.keymap.set(mode, lhs, rhs, opts) 在nvim 0.7之后才引入
-- 默认：noremap = true


-- =========================================================================
-- leader键
-- =========================================================================
vim.g.mapleader = ","
vim.g.localleader = ","

-- =========================================================================
-- 基础键盘映射
-- =========================================================================

-- ==========
-- normal模式
-- ==========



-- 不鼓励使用方向键进行移动
-- 定义一个函数，用于提示用户使用 h/j/k/l 进行移动
local function notify_use_hjkl()
    vim.notify("请使用 h/j/k/l 进行移动", vim.log.levels.WARN, { title = "导航提示" })
end
-- normal模式下，禁止方向键进行移动
vim.keymap.set('n', '<Left>', notify_use_hjkl, { desc = "提示: 使用 h" })
vim.keymap.set('n', '<Right>', notify_use_hjkl, { desc = "提示: 使用 l" })
vim.keymap.set('n', '<Up>', notify_use_hjkl, { desc = "提示: 使用 k" })
vim.keymap.set('n', '<Down>', notify_use_hjkl, { desc = "提示: 使用 j" })

-- 多窗口操作
-- 窗口分屏操作
vim.opt.splitbelow = true       -- 水平分割窗口时，新窗口出现在下方
vim.opt.splitright = true       -- 垂直分割窗口时，新窗口出现在右侧
vim.keymap.set('n', '<leader>x1', '<C-W>o', { desc = "关闭其他所有窗口 (只保留当前)" })
vim.keymap.set('n', '<leader>x2', ':split<CR>', { desc = "水平分割窗口" })
vim.keymap.set('n', '<leader>x3', ':vsplit<CR>', { desc = "垂直分割窗口" })
vim.keymap.set('n', '<leader>x0', ':q<CR>', { desc = "关闭当前窗口" })
-- 窗口间移动
vim.keymap.set('n', '<C-h>', '<C-W>h', { desc = "移动到左侧窗口" })
vim.keymap.set('n', '<C-l>', '<C-W>l', { desc = "移动到右侧窗口" })
vim.keymap.set('n', '<C-j>', '<C-W>j', { desc = "移动到下方窗口" })
vim.keymap.set('n', '<C-k>', '<C-W>k', { desc = "移动到上方窗口" })
-- <leader> 系列窗口移动快捷键
vim.keymap.set('n', '<leader>wh', '<C-W>h', { desc = "移动到左侧窗口" })
vim.keymap.set('n', '<leader>wl', '<C-W>l', { desc = "移动到右侧窗口" })
vim.keymap.set('n', '<leader>wj', '<C-W>j', { desc = "移动到下方窗口" })
vim.keymap.set('n', '<leader>wk', '<C-W>k', { desc = "移动到上方窗口" })

-- 快速操作
-- buffer
vim.keymap.set({ 'n', 'v', 'o' }, ';', ':', { noremap = true, desc = "进入命令模式" }) -- ; 代替 :
vim.keymap.set('n', 'Q', ':q<CR>', { noremap = true, silent = true, desc = "退出" })
vim.keymap.set('n', 'S', ':w<CR>', { noremap = true, silent = true, desc = "保存" })
vim.keymap.set('n', '<leader>sq', ':vs $MYVIMRC<CR>:source $MYVIMRC<CR>:q <CR>', { silent = true, desc = "应用新配置" })
-- word
-- dw删除当前光标所在单词
vim.api.nvim_set_keymap("n", "dw", "diw", {noremap = true, silent = true})

-- ==========
-- insert模式
-- ==========

-- S-tab减少缩进
vim.keymap.set('i', '<S-Tab>', '<C-d>', { silent = true })

-- =========================================================================
-- LSP快捷键
-- =========================================================================
local lsp_keymappings = {}

lsp_keymappings.set_keymap = function(bufnr)
    print("Setting LSP keymaps for buffer: " .. bufnr) -- 用于检测快捷键是否设置
    vim.keymap.set('n', 'gd', '<cmd>Lspsaga goto_definition<CR>', {buffer = bufnr, silent = true, desc = '跳转到声明'})
    vim.keymap.set('n', 'gD', '<cmd>Lspsaga peek_definition<CR>', {buffer = bufnr, silent = true, desc = '显示声明'})
    vim.keymap.set('n', 'gh', '<cmd>Lspsaga hover_doc<CR>', {buffer = bufnr, silent = true, desc = '显示注释文档'})
    vim.keymap.set('n', 'gi', '<cmd>Lspsaga finder imp<CR>', {buffer = bufnr, silent = true, desc = '跳转到实现'})
    vim.keymap.set('n', 'grn', '<cmd>Lspsaga rename<CR>', {buffer = bufnr, silent = true, desc = '重命名变量'})

    -- 以浮窗形式显示错误
    vim.keymap.set("n", "go", "<cmd>Lspsaga show_buf_diagnostics<CR>", {buffer = bufnr, silent = true, desc = '打开诊断'})
    vim.keymap.set("n", "<leader>go", "<cmd>Lspsaga show_buf_diagnostics ++unfocus<CR>", {buffer = bufnr, silent = true, desc = '打开诊断（unfocus）'})
    vim.keymap.set("n", "gn", "<cmd>Lspsaga diagnostic_jump_next<CR>", {buffer = bufnr, silent = true, desc = '下一个诊断'})
    vim.keymap.set("n", "gp", "<cmd>Lspsaga diagnostic_jump_prev<CR>", {buffer = bufnr, silent = true, desc = '上一个诊断'})
    vim.keymap.set("n", "gl", "<cmd>Lspsaga show_line_diagnostics<CR>", {buffer = bufnr, silent = true, desc = '显示行错误诊断'})
    vim.keymap.set("v", "gl", "<cmd>Lspsaga show_line_diagnostics<CR>", {buffer = bufnr, silent = true, desc = '显示行错误诊断'})
    vim.keymap.set("n", "gc", "<cmd>Lspsaga code_action<CR>", {buffer = bufnr, silent = true, desc = '错误修改建议'})
    vim.keymap.set("v", "gc", "<cmd>Lspsaga code_action<CR>", {buffer = bufnr, silent = true, desc = '错误修改建议'})
end

return lsp_keymappings

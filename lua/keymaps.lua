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

-- 快速应用配置修改
vim.keymap.set('n', '<leader>ss', ':vs $MYVIMRC<CR>:source $MYVIMRC<CR>:q <CR>', { silent = true, desc = "应用新配置" })

-- 定义一个函数，用于提示用户使用 h/j/k/l 进行移动
local function notify_use_hjkl()
  vim.notify("请使用 h/j/k/l 进行移动", vim.log.levels.WARN, { title = "导航提示" })
end

-- 不鼓励使用方向键进行移动
vim.keymap.set('n', '<Left>', notify_use_hjkl, { desc = "提示: 使用 h" })
vim.keymap.set('n', '<Right>', notify_use_hjkl, { desc = "提示: 使用 l" })
vim.keymap.set('n', '<Up>', notify_use_hjkl, { desc = "提示: 使用 k" })
vim.keymap.set('n', '<Down>', notify_use_hjkl, { desc = "提示: 使用 j" })
-- 将函数暴露给全局，以便 <Esc>:lua 调用 (init 是文件名)
_G.notify_use_hjkl = notify_use_hjkl
-- 在插入模式下，按下方向键会先退出插入模式，然后提示，再回到插入模式
vim.keymap.set('i', '<Left>', '<Esc>:lua notify_use_hjkl()<CR>a', { desc = "提示: 使用 h" })
vim.keymap.set('i', '<Right>', '<Esc>:lua notify_use_hjkl()<CR>a', { desc = "提示: 使用 l" })
vim.keymap.set('i', '<Up>', '<Esc>:lua notify_use_hjkl()<CR>a', { desc = "提示: 使用 k" })
vim.keymap.set('i', '<Down>', '<Esc>:lua notify_use_hjkl()<CR>a', { desc = "提示: 使用 j" })

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
vim.keymap.set({ 'n', 'v', 'o' }, ';', ':', { noremap = true, desc = "进入命令模式" }) -- ; 代替 :
vim.keymap.set('n', 'Q', ':q<CR>', { noremap = true, silent = true, desc = "退出" })
vim.keymap.set('n', 'S', ':w<CR>', { noremap = true, silent = true, desc = "保存" })
-- dw删除当前光标所在单词
vim.api.nvim_set_keymap("n", "dw", "diw", {noremap = true, silent = true})


-- 使用空格键来切换折叠状态 (za 是更简单且常用的方式)
vim.keymap.set('n', '<Space>', 'za', { silent = true, desc = "切换代码折叠" })


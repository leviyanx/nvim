-- =========================================================================
-- 基础编辑设置
-- =========================================================================

-- Vim is based on Vi. Setting `nocompatible` switches from the default
-- Vi-compatibility mode and enables useful Vim functionality. This
-- configuration option turns out not to be necessary for the file named " '~/.vimrc', because Vim automatically enters nocompatible mode if that file
-- is present. But we're including it here just in case this config file is
-- loaded some other way (e.g. saved as `foo`, and then Vim started with
-- `vim -u foo`).
vim.opt.compatible = false

-- 设置文件编码格式为 utf-8
vim.g.encoding = "utf-8"

vim.opt.swapfile = false        -- 禁用交换文件
vim.opt.backup = false          -- 不创建备份文件
vim.opt.bufhidden = 'hide'      -- 当 buffer 被丢弃时隐藏它，而不是卸载
vim.opt.hidden = true           -- 允许隐藏有未保存更改的缓冲区 (而不是强制保存或放弃)

-- 显示
vim.opt.number = true           -- 显示行号
vim.opt.relativenumber = true   -- 显示相对行号
vim.o.list = true               -- 显示空白字符
vim.opt.termguicolors = true

-- 高亮
vim.o.syntax = "enable"         -- 打开语法高亮
vim.opt.hlsearch = true         -- 高亮所有搜索匹配项
vim.opt.showmatch = true        -- 高亮匹配的括号 ([{()}])
vim.opt.cursorline = true       -- 高亮显示当前行

-- 搜索
vim.opt.incsearch = true        -- 键入搜索内容时，即时显示匹配结果
vim.opt.ignorecase = true       -- 搜索时忽略大小写
vim.opt.smartcase = true        -- 如果搜索模式串中包含大写字母，则自动切换为大小写敏感搜索

-- 提醒
vim.opt.errorbells = false      -- 关闭错误信息响铃
vim.opt.visualbell = false      -- 关闭使用可视响铃代替呼叫

vim.opt.shortmess:append('I')   -- 禁止显示 Vim 启动时的欢迎信息

-- 状态栏
vim.opt.ruler = true            -- 在状态栏显示光标位置标尺
-- 显示状态栏 (默认值为 1, 无法显示状态栏)
vim.opt.laststatus = 2

-- 光标形状 (Neovim 更现代化的设置方式)
vim.opt.guicursor = table.concat({
  "n-v-c:block",        -- 普通、可视、命令模式：块状光标
  "i-ci-ve:ver25",      -- 插入、命令行插入、可视表达式模式：垂直细线光标 (25% 高度)
  "r-cr:hor20",         --替换、命令行替换模式：水平细线光标 (20% 宽度)
  "o:hor50",            -- 操作符待决模式：水平细线光标 (50% 宽度)
  "a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor", -- 所有模式：光标闪烁设置
  "sm:block-blinkwait175-blinkoff150-blinkon175" -- ShowMatch 模式：块状光标，不同闪烁率
}, ",")
-- 如果您的特定终端必须使用 t_SI/t_EI (旧方法):
-- vim.opt.t_SI = "\x1b[6 q" -- 插入模式光标形状 (例如，变为竖线)
-- vim.opt.t_EI = "\x1b[2 q" -- 普通模式光标形状 (例如，变回块状)

-- 剪贴板
vim.opt.clipboard = 'unnamedplus' -- 使用系统剪贴板 (unnamedplus 在 Linux 上能更好地处理主剪贴板)

-- 鼠标支持
vim.opt.mouse = 'a'             -- 在所有模式下启用鼠标支持

-- normal操作
vim.opt.scrolloff = 8           -- 光标距离屏幕顶部/底部至少保留 8 行时才开始滚动
vim.opt.sidescrolloff = 5       -- 光标距离屏幕左侧/右侧至少保留 5 列时才开始水平滚动

vim.opt.matchtime = 2           -- 短暂跳转到匹配括号的时间，单位为 1/10 秒 (即 0.2 秒)

vim.opt.autochdir = false       -- 自动切换当前目录为当前文件所在的目录 (有时可能会分散注意力，可以考虑基于项目的解决方案)

-- 代码折叠设置
vim.opt.foldenable = true       -- 启用代码折叠
vim.opt.foldmethod = 'syntax'   -- 设置折叠方法为基于语法 (也可以考虑 'indent' 或配合插件使用 'expr')
vim.opt.foldcolumn = '0'        -- 设置折叠区域的宽度 (可以设为 '1' 以显示折叠标记)
vim.opt.foldlevel = 99          -- 初始折叠级别，99 表示默认展开所有折叠
vim.opt.foldlevelstart = 99     -- 打开文件时应用的折叠级别

-- insert操作
vim.opt.backspace = 'indent,eol,start' -- 允许在插入模式下使用退格键删除缩进、换行符和插入开始位置之前的内容

-- Tab 和缩进设置 （tab转换为4个空格）
vim.opt.tabstop = 4             -- 文件中的一个 <Tab> 字符显示为 4 个空格的宽度
vim.opt.softtabstop = 4         -- 在编辑时，按 <Tab> 或 <BS> 插入/删除的空格数
vim.opt.shiftwidth = 4          -- 自动缩进时使用的空格数
vim.opt.expandtab = true        -- 按 <Tab> 键时插入空格而不是制表符
vim.opt.smartindent = true      -- 开启新行时使用智能自动缩进
-- 对 Makefile 文件禁用 expandtab (即使用真实的 Tab 字符)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "make",
  command = "setlocal noexpandtab", -- setlocal 只对当前缓冲区生效
  desc = "Makefile 使用真实 Tab",
})
-- << >> 缩进时移动的长度
vim.opt.shiftwidth = 4


-- 自动换行
vim.opt.wrap = true

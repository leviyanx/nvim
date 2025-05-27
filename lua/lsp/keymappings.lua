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
    vim.keymap.set('n', '<leader>rn', '<cmd>Lspsaga rename<CR>', {buffer = bufnr, silent = true, desc = '重命名变量'})

    -- 以浮窗形式显示错误
    vim.keymap.set("n", "<leader>do", "<cmd>Lspsaga show_buf_diagnostics<CR>", {buffer = bufnr, silent = true, desc = '打开诊断'})
    vim.keymap.set("n", "<leader>dn", "<cmd>Lspsaga diagnostic_jump_next<CR>", {buffer = bufnr, silent = true, desc = '下一个诊断'})
    vim.keymap.set("n", "<leader>dp", "<cmd>Lspsaga diagnostic_jump_prev<CR>", {buffer = bufnr, silent = true, desc = '上一个诊断'})
    vim.keymap.set({'n', "v"}, "<leader>dl", "<cmd>Lspsaga show_line_diagnostics<CR>", {buffer = bufnr, silent = true, desc = '显示行错误诊断'})
    vim.keymap.set({"n", 'v'}, "<leader>dc", "<cmd>Lspsaga code_action<CR>", {buffer = bufnr, silent = true, desc = '错误修改建议'})
end

return lsp_keymappings

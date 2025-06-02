if vim.fn.has "nvim-0.7" then
    local nvimrc = vim.api.nvim_create_augroup("NVIMRC", {clear = true})
    -- 功能：init.lua中编辑后的内容保存到文件中后，自动加载新配置
    -- （在init.lua中编辑，替代了"快速应用配置部分"）
    -- %表示正在编辑的文件路径
    vim.api.nvim_create_autocmd({"BufWritePost"}, {
        pattern = "init.lua",
        group = nvimrc,
        command = "source %"
    })
    -- 功能：
    vim.api.nvim_create_autocmd({"BufReadPost"}, {
        pattern = "init.lua",
        group = nvimrc,
        callback = function()
            vim.o.path = vim.o.path .. ",**/*"
        end
    })

    -- 每次保存，自动格式化代码
    -- require treesitter
    local auto_indent = vim.api.nvim_create_augroup('AUTO_INDENT', {clear = true })
    vim.api.nvim_create_autocmd({'BufWritePost'}, {
        -- 指定需要格式化的文件类型
        pattern = {'*.lua', '*.cpp', '*.c', '*.h', '*.hpp', '*.py', '*.java', '*.js', '*.ts', '*.go', '*.rs', '*.json'},
        group = auto_indent,
        command = 'normal! gg=G``'
    })
else
end

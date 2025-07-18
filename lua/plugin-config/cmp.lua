local M = {}

function M.setup()

    local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    local feedkey = function(key, mode)
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
    end

    local cmp = require("cmp")
    local lspkind = require("lspkind")
    cmp.setup({
        -- 设置代码片段引擎，用于根据代码片段补全
        snippet = {
            expand = function(args)
                vim.fn["vsnip#anonymous"](args.body)
            end,
        },

        window = {
        },

        mapping = {
            -- 选择上一个
            ['<C-p>'] = cmp.mapping(function()
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif vim.fn["vsnip#jumpable"](-1) == 1 then
                    feedkey("<Plug>(vsnip-jump-prev)", "")
                end
            end, { "i", "s" }),
            ['<Up>'] = cmp.mapping.select_prev_item(),
            -- 选择下一个
            ['<C-n>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif vim.fn["vsnip#available"](1) == 1 then
                    feedkey("<Plug>(vsnip-expand-or-jump)", "")
                elseif has_words_before() then
                    cmp.complete()
                else
                    fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
                end
            end, { "i", "s" }),
            ['<Down>'] = cmp.mapping.select_next_item(),
            -- 出现补全
            ['<A-.>'] = cmp.mapping(cmp.mapping.complete(), {'i', 'c'}),
            -- 取消补全
            ['<A-,>'] = cmp.mapping({
                i = cmp.mapping.abort(),
                c = cmp.mapping.close(),
            }),

            -- 确认使用某个补全项
            ['<Tab>'] = cmp.mapping.confirm({
                select = true,
                behavior = cmp.ConfirmBehavior.Replace
            }),
            ['<CR>'] = cmp.mapping.confirm({
                select = true,
                behavior = cmp.ConfirmBehavior.Replace
            }),

            -- 向上翻页
            ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), {'i', 'c'}),
            -- 向下翻页
            ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4), {'i', 'c'}),
        },

        -- 补全来源
        sources = cmp.config.sources({
            {name = 'nvim_lsp'},
            {name = 'vsnip'},
            {name = 'buffer'},
            {name = 'path'}
        }),

        --根据文件类型来选择补全来源
        cmp.setup.filetype('gitcommit', {
            sources = cmp.config.sources({
                {name = 'buffer'}
            })
        }),

        -- 命令模式下输入 `/` 启用补全
        cmp.setup.cmdline('/', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer' }
            }
        }),

        -- 命令模式下输入 `:` 启用补全
        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = 'path' }
            }, {
                { name = 'cmdline' }
            })
        }),

        -- 设置补全显示的格式
        formatting = {
            format = lspkind.cmp_format({
                with_text = true,
                maxwidth = 50,
                before = function(entry, vim_item)
                    vim_item.menu = "[" .. string.upper(entry.source.name) .. "]"
                    return vim_item
                end
            }),
        },
    })
end

return M

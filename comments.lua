-- Comments
require('Comment').setup({
    mappings = {
        basic = false,
        extra = false,
    },
})

-- Простая универсальная функция
require('Comment').setup()

local api = require('Comment.api')

-- Универсальная функция комментирования
local function toggle_comment()
    local mode = vim.fn.mode()
    
    if mode == 'n' then
        -- Нормальный режим
        api.toggle.linewise.current()
    elseif mode == 'v' or mode == 'V' then
        -- Визуальный режим
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<ESC>', true, false, true), 'nx', false)
        api.toggle.linewise(vim.fn.visualmode())
    elseif mode == 's' or mode == 'S' then
        -- Select режим (выделение в insert mode)
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-g>', true, false, true), 'nx', false)
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<ESC>', true, false, true), 'nx', false)
        api.toggle.linewise('V')
    else
        -- Insert режим - комментируем текущую строку
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<ESC>', true, false, true), 'nx', false)
        api.toggle.linewise.current()
        vim.api.nvim_feedkeys('a', 'nx', false)
    end
end

-- Маппинги для всех режимов
vim.keymap.set({'n', 'i', 'v', 'x', 's'}, '<C-_>', toggle_comment, { desc = 'Toggle comment' })

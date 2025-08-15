-- Привычные бинды
-- Сохранить
vim.keymap.set('n', '<C-s>', ':w<CR>', { noremap = true, silent = true })
vim.keymap.set('i', '<C-s>', '<C-o>:w<CR>', { noremap = true, silent = true })

-- Undo по Ctrl+Z
vim.keymap.set('n', '<C-z>', 'u', { noremap = true, silent = true })
vim.keymap.set('i', '<C-z>', '<C-o>u', { noremap = true, silent = true })

-- Блокировать системный suspend в NeoVim
vim.keymap.set('n', '<C-z>', function()
  vim.cmd('undo')
end, { noremap = true, silent = true })

-- Копирование по Ctrl+C
vim.keymap.set('v', '<C-c>', '"+y', { noremap = true, silent = true })
vim.keymap.set('n', '<C-c>', '"+yy', { noremap = true, silent = true })  -- копирование всей строки

-- Вставка по Ctrl+V
vim.keymap.set('n', '<C-v>', '"+p', { noremap = true, silent = true })
vim.keymap.set('i', '<C-v>', '<C-r>+', { noremap = true, silent = true })

-- Вырезание по Ctrl+X
vim.keymap.set('v', '<C-x>', '"+x', { noremap = true, silent = true })

-- Выделение с Shift + стрелки
vim.keymap.set('i', '<S-Left>', '<C-o>v<Left>', { noremap = true })
vim.keymap.set('i', '<S-Right>', '<C-o>v<Right>', { noremap = true })
vim.keymap.set('i', '<S-Up>', '<C-o>v<Up>', { noremap = true })
vim.keymap.set('i', '<S-Down>', '<C-o>v<Down>', { noremap = true })

-- Shift+Tab для отступа назад
vim.keymap.set('i', '<S-Tab>', '<C-d>', { noremap = true, silent = true })
vim.keymap.set('n', '<S-Tab>', '<<', { noremap = true, silent = true })
vim.keymap.set('v', '<S-Tab>', '<gv', { noremap = true, silent = true })

-- Создание нового файла по Ctrl+N
vim.keymap.set('n', '<C-n>', ':enew<CR>', { noremap = true, silent = true })
vim.keymap.set('i', '<C-n>', '<Esc>:enew<CR>', { noremap = true, silent = true })

-- Выход из виртуальгого терминала по Ctrl+Q
vim.keymap.set('t', '<C-q>', [[<C-\><C-n>]], { desc = 'Exit terminal mode' })

-- barbar
-- Передвижение по вкладкам barbar
vim.keymap.set('n', '<A-,>', '<Cmd>BufferPrevious<CR>')
vim.keymap.set('n', '<A-.>', '<Cmd>BufferNext<CR>')

-- Закрытие вкладки barbar
vim.keymap.set('n', '<A-c>', '<Cmd>BufferClose<CR>')
vim.keymap.set('n', '<A-C>', '<Cmd>BufferClose!<CR>')

-- Закрытие других вкладок barbar
vim.keymap.set('n', '<A-x>', '<Cmd>BufferCloseAllButCurrent<CR>')

-- Переход к конкретной вкладке barbar
vim.keymap.set('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
vim.keymap.set('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
vim.keymap.set('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
vim.keymap.set('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
vim.keymap.set('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
vim.keymap.set('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
vim.keymap.set('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
vim.keymap.set('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
vim.keymap.set('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
vim.keymap.set('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)

-- Найти и (или) заменить
-- Поиск по Ctrl+F
vim.keymap.set('n', '<C-f>', '/', { noremap = true })
vim.keymap.set('i', '<C-f>', '<Esc>/', { noremap = true })

-- Замена по Ctrl+H
vim.keymap.set('n', '<C-h>', ':%s/', { noremap = true })
vim.keymap.set('i', '<C-h>', '<Esc>:%s/', { noremap = true })

-- Поиск следующего/предыдущего
vim.keymap.set('n', '<F3>', 'n', { noremap = true })
vim.keymap.set('n', '<F2>', 'N', { noremap = true })

-- Отменить подсветку поиска
vim.keymap.set('n', '<Esc>', ':noh<CR>', { noremap = true, silent = true })



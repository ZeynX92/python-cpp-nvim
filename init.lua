local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- Базовые
Plug 'phanviet/vim-monokai-pro'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'romgrk/barbar.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'numToStr/Comment.nvim'
Plug 'windwp/nvim-autopairs'

-- TODO комментарии
Plug 'folke/todo-comments.nvim'
Plug 'nvim-lua/plenary.nvim'

-- LSP и автодополнение
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

-- Дополнительные полезные плагины для LSP
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

vim.call('plug#end')

home=os.getenv("HOME")
package.path = home .. "/.config/nvim/?.lua;" .. package.path

require"common"
require"theme"
require"binds"
require"vimtree"
require"barbar"
require"lua_line"
require"lsp"
require"comments"
require"todo"
require"autopairs"


-- Автооткрытие nvim-tree при входе
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function(data)
    local real_file = vim.fn.fnamemodify(data.file, ":p")
    local is_real_file = vim.fn.filereadable(real_file) == 1
    
    if is_real_file then
      -- Перейти в директорию файла
      local file_dir = vim.fn.fnamemodify(real_file, ":h")
      vim.cmd("cd " .. file_dir)
      
      -- Открыть nvim-tree
      require("nvim-tree.api").tree.open()
    end
  end
})

-- Автокоманда для закрытия vim когда остается только nvim-tree
vim.api.nvim_create_autocmd("QuitPre", {
  callback = function()
    local tree_wins = {}
    local floating_wins = {}
    local wins = vim.api.nvim_list_wins()
    for _, w in ipairs(wins) do
      local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
      if bufname:match("NvimTree_") ~= nil then
        table.insert(tree_wins, w)
      end
      if vim.api.nvim_win_get_config(w).relative ~= '' then
        table.insert(floating_wins, w)
      end
    end
    if 1 == #wins - #floating_wins - #tree_wins then
      -- Should quit, so we close all invalid windows.
      for _, w in ipairs(tree_wins) do
        vim.api.nvim_win_close(w, true)
      end
    end
  end
})

-- Автокоманда для замены цвета self в теме (это лично мой прикол, но может кому-нибудь тоже понадобится)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    -- Определить self как отдельное ключевое слово
    vim.cmd("syntax keyword pythonSelf self")
    -- Задать цвет (используй цвета из Monokai Pro палитры)
    -- vim.cmd("highlight pythonSelf guifg=#FF6188 gui=italic")  -- розовый
    -- vim.cmd("highlight pythonSelf guifg=#A9DC76 gui=bold")    -- зелёный
    -- vim.cmd("highlight pythonSelf guifg=#78DCE8 gui=italic")  -- голубой
    vim.cmd("highlight pythonSelf guifg=#9130C7 gui=italic")  -- фиолетовый
  end,
})

-- Автокоманда для ретрека функций и методов, потому что по умолчанию они почему-то отвалились
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    -- Подсветка функций с круглыми скобками
    vim.cmd("syntax match pythonFunction '\\w\\+\\ze('")
    vim.cmd("highlight pythonFunction guifg=#A9DC76")  -- голубой из Monokai Pro
    
    -- Подсветка методов (после точки)
    vim.cmd("syntax match pythonMethod '\\.\\w\\+\\ze('")
    vim.cmd("highlight pythonMethod guifg=#A9DC76")  
end,
})




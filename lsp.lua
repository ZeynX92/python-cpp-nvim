local lspconfig = require('lspconfig')
local cmp = require('cmp')
local luasnip = require('luasnip')

-- Настройка автодополнения
cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
    { name = 'path' },
  })
})

-- Общие настройки для всех LSP серверов
local on_attach = function(client, bufnr)
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  
  -- Горячие клавиши
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<C-A-l>', function() vim.lsp.buf.format { async = true } end, bufopts)
  
  -- Диагностика
  vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, bufopts)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, bufopts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, bufopts)
  vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, bufopts)
end

-- Возможности автодополнения
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Настройка Python LSP (Pylsp)
lspconfig.pylsp.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    pylsp = {
      plugins = {
        -- Форматирование
        autopep8 = { 
          enabled = true,
          args = {'--max-line-length=88', '--aggressive', '--aggressive'}
        },
        yapf = { enabled = false }, -- Отключаем yapf, используем autopep8
        black = { enabled = false }, -- Если хотите black, включите его и отключите autopep8
        
        -- Линтеры
        pycodestyle = {
          enabled = true,
          ignore = {'E501', 'W503'}, -- Игнорируем длину строки и перенос перед бинарными операторами
          maxLineLength = 88
        },
        pyflakes = { enabled = true },
        pylint = { enabled = false }, -- Можете включить если нужен более строгий анализ
        
        -- Автодополнение и навигация
        jedi_completion = {
          enabled = true,
          fuzzy = true,
          include_params = true,
        },
        jedi_hover = { enabled = true },
        jedi_references = { enabled = true },
        jedi_signature_help = { enabled = true },
        jedi_symbols = { enabled = true, all_scopes = true },
        
        -- Дополнительные возможности
        rope_completion = { enabled = true },
        rope_autoimport = { enabled = true },
      }
    }
  }
})

-- Альтернативная настройка для Pyright (более продвинутый Python LSP)
-- Раскомментируйте, если предпочитаете Pyright вместо Pylsp
--[[
lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "workspace",
        useLibraryCodeForTypes = true,
        typeCheckingMode = "basic"
      }
    }
  }
})
--]]

-- Настройка C++ LSP (clangd)
lspconfig.clangd.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--header-insertion=iwyu",
    "--completion-style=detailed",
    "--function-arg-placeholders",
    "--fallback-style=llvm",
  },
  init_options = {
    usePlaceholders = true,
    completeUnimported = true,
    clangdFileStatus = true,
  },
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
})

-- Настройка диагностики
vim.diagnostic.config({
  virtual_text = {
    prefix = '●',
  },
  signs = true,
  underline = true,
  update_in_insert = false,
})

-- Иконки для диагностики
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

require('nvim-autopairs').setup({
  check_ts = true,  -- включить поддержку treesitter
  ts_config = {
    lua = {'string'},-- не добавлять пары в lua строках
    javascript = {'template_string'},
    java = false,-- отключить для java
  },
  disable_filetype = { "TelescopePrompt", "vim" },
  disable_in_macro = false,  -- отключить в макросах
  disable_in_visualblock = false, -- отключить в visual block режиме
  ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]],"%s+", ""),
  enable_moveright = true,
  enable_afterquote = true,  -- добавить скобку после кавычки
  enable_check_bracket_line = true,  -- проверить есть ли скобка на этой строке
  enable_bracket_in_quote = true, --
  break_undo = true, -- переключить для отмены
  check_comma = true,
  map_cr = true,
  map_bs = true,  -- map the <BS> key
  map_c_h = false,  -- Map the <C-h> key to delete a pair
  map_c_w = false, -- map <c-w> to delete a pair if possible
})

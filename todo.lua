local colors = {
  red = "#FF6188",
  orange = "#FC9867", 
  yellow = "#FFD866",
  green = "#A9DC76",
  blue = "#78DCE8",
  purple = "#AB9DF2",
  bg = "#2D2A2E",
  fg = "#FCFCFA"
}

require("todo-comments").setup({
  colors = {
    error = { colors.red },
    warning = { colors.orange },
    info = { colors.blue },
    hint = { colors.green },
    default = { colors.purple },
    test = { colors.yellow }
  },
  keywords = {
    FIX = {
      icon = " ",
      color = "error",
      alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
    },
    TODO = { icon = " ", color = "info" },
    HACK = { icon = " ", color = "warning" },
    WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
    PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
    NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
    TEST = { icon = " ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
  },
  highlight = {
    before = "",
    keyword = "wide_fg",
    after = "fg",
    pattern = [[.*<(KEYWORDS)\s*:]],
    comments_only = true,
    max_line_len = 400,
    exclude = {},
  },
})


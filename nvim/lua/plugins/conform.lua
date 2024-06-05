return {
  "stevearc/conform.nvim",
  opts = function()
    local opts = {
      formatters_by_ft = {
        fish = { "fish_indent" },
        html = { "prettier" },
        js = { "prettier" },
        lua = { "stylua" },
        sh = { "shfmt" },
      },
    }
    return opts
  end,
}

return {
  "folke/which-key.nvim",
  opts = function(_, opts)
    opts.icons = opts.icons or {}
    opts.icons.mappings = vim.g.have_nerd_font
  end,
}

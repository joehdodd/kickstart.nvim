return {
  'folke/tokyonight.nvim',
  lazy = false,
  priority = 1000,
  opts = {
    transparent = true,
    styles = {
      sidebars = 'transparent',
      floats = 'transparent',
      comments = { italic = true },
      keywords = { bold = true, italic = true },
      functions = { bold = true },
      variables = { bold = true },
    },
  },
}

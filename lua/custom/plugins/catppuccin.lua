return {
  'catppuccin/nvim',
  lazy = false,
  name = 'catppuccin',
  config = function()
    require('catppuccin').setup {
      flavor = 'macchiato',
      styles = {
        keywords = { 'italic' },
      },
      color_overrides = {
        latte = {
          rosewater = '#ca3c3a',
        },
      },
    }
    vim.cmd.colorscheme 'catppuccin-frappe'
    vim.g.theme_id = 2
  end,
}

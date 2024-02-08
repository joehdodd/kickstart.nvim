return {
  'catppuccin/nvim',
  lazy = true,
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
    vim.cmd 'colorscheme catppuccin-macchiato'
  end,
}

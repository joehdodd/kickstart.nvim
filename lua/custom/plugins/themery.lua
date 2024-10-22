return {
  'zaldih/themery.nvim',
  config = function()
    require('themery').setup {
      themes = {
        { colorscheme = 'catppuccin-macchiato', name = 'Catppuccin Macchiato' },
        { colorscheme = 'catppuccin-frappe', name = 'Catppuccin Frappe' },
        { colorscheme = 'catppuccin-latte', name = 'Catppuccin Latte' },
        { colorscheme = 'tokyonight-storm', name = 'TokyoNight Storm' },
        { colorscheme = 'tokyonight-day', name = 'TokyoNight Day' },
      },
      livePreview = true,
    }
  end,
  keys = {
    { '<leader>tc', ':Themery<CR>', desc = 'Toggle Colorschemes' },
  },
}

return {
  'zaldih/themery.nvim',
  config = function()
    require('themery').setup {
      themes = {
        { colorscheme = 'catppuccin-macchiato', name = 'Catppuccin Macchiato' },
        { colorscheme = 'catppuccin-latte', name = 'Catppuccin Latte' },
        { colorscheme = 'tokyonight-storm', name = 'TokyoNight Storm' },
        { colorscheme = 'tokyonight-day', name = 'TokyoNight Day' },
      },
      themeConfigFile = '~/.config/nvim/lua/theme.lua',
      livePreview = true,
    }
  end,
  keys = {
    { '<leader>tc', ':Themery<CR>', desc = 'Toggle Colorschemes' },
  },
}

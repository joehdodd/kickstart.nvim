return {
  'zbirenbaum/copilot.lua',
  config = function()
    require('copilot').setup {
      suggestion = {
        auto_trigger = true,
        debounce = 25,
      },
    }
  end,
}

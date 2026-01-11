return {
  'zbirenbaum/copilot.lua',
  config = function()
    require('copilot').setup {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 25,
        keymap = {
          accept = '<S-CR>',
        },
      },
    }
  end,
}

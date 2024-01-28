return {
  'mhartington/formatter.nvim',
  config = function()
    require('formatter').setup {
      logging = true,
      filetype = {
        lua = {
          require('formatter.filetypes.lua').stylua,
        },
        javascript = {
          require('formatter.filetypes.javascript').prettier,
        },
        javascriptreact = {
          require('formatter.filetypes.javascriptreact').prettier,
        },
        typescript = {
          require('formatter.filetypes.typescript').prettier,
        },
        typescriptreact = {
          require('formatter.filetypes.typescriptreact').prettier,
        },
        -- Use the special "*" filetype for defining formatter configurations for all files
        ['*'] = {
          require('formatter.filetypes.any').remove_trailing_whitespace,
        },
      },
    }
  end,
  keys = {
    {
      '<leader>fw',
      '<cmd>FormatWrite<cr>',
      desc = '[F]ormat [W]rite',
    },
    {
      '<leader>ff',
      '<cmd>Format<cr>',
      desc = '[F]ormat [F]ile',
    },
  },
}

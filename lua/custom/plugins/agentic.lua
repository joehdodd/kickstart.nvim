return {
  'carlos-algms/agentic.nvim',
  opts = {
    provider = 'copilot-acp',
    acp_providers = {
      ['copilot-acp'] = {
        command = 'copilot-acp', -- or the command for your Copilot ACP backend
        args = {},
      },
    },
    debug = true,
  },
  keys = {
    {
      '<C-A>',
      function()
        require('agentic').toggle()
      end,
      desc = 'Agentic Open',
      mode = { 'n', 'v', 'i' },
    },
    {
      "<C-'>",
      function()
        require('agentic').add_selection_or_file_to_context()
      end,
      desc = 'Agentic add selection or current file to context',
      mode = { 'n', 'v' },
    },
  },
}

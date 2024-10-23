local lualine = require 'lualine'

local config = {
  -- extensions = { 'neo-tree' },
  options = {
    disabled_filetypes = { statusline = { 'dashboard', 'NeoTree', 'neo-tree' } },
  },
  sections = {
    lualine_c = {
      {
        'filename',
        path = 1,
        -- 0: Just the filename
        -- 1: Relative path
        -- 2: Absolute path
        -- 3: Absolute path, with tilde as the home directory
        -- 4: Filename and parent dir, with tilde as the home directory
      },
    },
    -- These will be filled later
    lualine_x = {},
    lualine_y = {
      'progress',
      'location',
    },
    lualine_z = {},
  },
  inactive_sections = {
    -- these are to remove the defaults
    lualine_x = {},
    lualine_z = {},
  },
}

table.insert(config.sections.lualine_x, {
  function()
    local msg = 'No Active Lsp'
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
      return msg
    end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return client.name
      end
    end
    return msg
  end,
  icon = '',
})

table.insert(config.sections.lualine_z, {
  function()
    local cwd = vim.fn.getcwd()
    return cwd
  end,
})

return {
  'nvim-lualine/lualine.nvim',
  config = function()
    lualine.setup(config)
  end,
}

local lualine = require('lualine')

local config = {
  sections = {
    -- These will be filled later
    lualine_x = {},
  },
  inactive_sections = {
    -- these are to remove the defaults
    lualine_x = {},
  },
}

-- Inserts a component in lualine_c at left section
local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

ins_right {
  -- Lsp server name .
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
  icon = ' LSP:',
  color = { fg = '#ffffff', gui = 'bold' },
}

return {
  'nvim-lualine/lualine.nvim',
  -- See `:help lualine.txt`
  config = function()
    lualine.setup(config)
  end
}

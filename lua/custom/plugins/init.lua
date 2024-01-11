-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return { {
    'akinsho/toggleterm.nvim',
    version = "*",
    lazy = false,
    config = function()
        require("toggleterm").setup({
            size = 20,
            open_mapping = [[<c-\>]],
            direction = "float"
        })
    end,
    keys = { {
        '<leader>tt',
        function()
            require('toggleterm').toggle()
        end,
        desc = 'Toggle Terminal'
    } },
}, {
    "folke/which-key.nvim",
    opts = {
        defaults = {
            ["<leader>f"] = { name = "+[F]ile Explorer" },
        },
    },
    config = function(_, opts)
        local wk = require("which-key")
        wk.setup(opts)
        wk.register(opts.defaults)
    end,
}, {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    after = 'catppuccin',
    config = function()
        require("bufferline").setup({
            highlights = require("catppuccin.groups.integrations.bufferline").get(),
            options = {
                diagnostics = "nvim_lsp"
            }
        })
    end
} }

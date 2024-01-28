return {
    'mhartington/formatter.nvim',
    config = function()
        require("formatter").setup {
            logging = true,
            filetype = {
                -- Use the special "*" filetype for defining formatter configurations on
                javascript = {
                    require("formatter.filetypes.javascript").prettier
                },
                typescript = {
                    require("formatter.filetypes.typescript").prettier
                },
                typescriptreact = {
                    require("formatter.filetypes.typescriptreact").prettier
                },
                ["*"] = {
                    require("formatter.filetypes.any").remove_trailing_whitespace
                }
            }
        }
    end,
    keys = {
        {
            '<leader>fw',
            '<cmd>FormatWrite<cr>',
            desc = '[F]ormat [W]rite'
        }
    }
}

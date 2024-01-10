-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return { {
    "catppuccin/nvim",
    lazy = false,
    priority = 1000,
    name = "catppuccin",
    config = function()
        require("catppuccin").setup()
        vim.cmd.colorscheme = "catppuccin"
    end
}, {
    'nvim-neo-tree/neo-tree.nvim',
    version = '*',
    lazy = false,
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons', 'MunifTanjim/nui.nvim' },
    keys = { {
        '<leader>fe',
        '<cmd>Neotree toggle<cr>',
        desc = 'File Explorer - Toggle'
    } },
    config = function()
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
        vim.g.loaded_netrwSettings = 1
        vim.g.loaded_netrwFileHandlers = 1
        require('neo-tree').setup {
            window = {
                width = 30,
                position = "right",
                mappings = {
                    ["<space>"] = "none"
                }
            },
            filesystem = {
                filtered_items = {
                    visible = true, -- This is what you want: If you set this to `true`, all "hide" just mean "dimmed out"
                    hide_dotfiles = false,
                    hide_gitignored = true
                },
                follow_current_file = {
                    enabled = true -- This will find and focus the file in the active buffer every time
                }
            }
        }
    end
}, {
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
}, {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
        require("copilot").setup({
            suggestion = {
                auto_trigger = true,
                debounce = 25,
                keymap = {
                    accept = "<C-l>",
                },
            }
        })
    end
} }

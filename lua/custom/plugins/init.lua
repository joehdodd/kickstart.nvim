-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrwSettings = 1
vim.g.loaded_netrwFileHandlers = 1
return {{
    'navarasu/onedark.nvim',
    lazy = false,
    config = function()
        require('onedark').setup({
                style = 'dark',
                term_colors = true,
                toggle_style_list = {'light', 'dark'},
                colors = {
                    bg = '#00ffffff',
                },
                highlights = {
                    NeoTreeNormal = { bg = '$bg'},
                    NeoTreeNormalNC = { bg = '$bg'},
                    NeoTreeEndOfBuffer = { bg = '$bg' },
                }
        })
        require('onedark').load()
    end,
    keys = {{
        '<leader>tc',
        function()
            require('onedark').toggle()
        end,
        desc = 'Toggle Color Scheme'
    }}
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
    keys = {{
        '<leader>tt',
        function()
            require('toggleterm').toggle()
        end,
        desc = 'Toggle Terminal'
    }},
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
    'nvim-neo-tree/neo-tree.nvim',
    version = '*',
    lazy = false,
    dependencies = {'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons', 'MunifTanjim/nui.nvim'},
    keys = {{
        '<leader>fe',
        '<cmd>Neotree toggle<cr>',
        desc = 'File Explorer - Toggle'
    }},
    config = function()
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
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ':Copilot auth',
    event = "InsertEnter",
    config = function()
        require("copilot").setup({
          suggestion = {
            auto_trigger = true,
            debounce = 100,
            keymap = {
              accept = "<C-l>",
            },
          }
        })
    end
}, {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        require("bufferline").setup({
            options = {
                diagnostics = "nvim_lsp"
            }
        })
        vim.opt.termguicolors = true
    end
}, {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
        lsp = {
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
                ["cmp.entry.get_documentation"] = true
            }
        },
        routes = {{
            filter = {
                event = "msg_show",
                any = {{
                    find = "%d+L, %d+B"
                }, {
                    find = "; after #%d+"
                }, {
                    find = "; before #%d+"
                }}
            },
            view = "mini"
        }},
        presets = {
            bottom_search = true,
            command_palette = true,
            long_message_to_split = true,
            inc_rename = true
        }
    },
    keys = {{
        "<S-Enter>",
        function()
            require("noice").redirect(vim.fn.getcmdline())
        end,
        mode = "c",
        desc = "Redirect Cmdline"
    }, {
        "<leader>snl",
        function()
            require("noice").cmd("last")
        end,
        desc = "Noice Last Message"
    }, {
        "<leader>snh",
        function()
            require("noice").cmd("history")
        end,
        desc = "Noice History"
    }, {
        "<leader>sna",
        function()
            require("noice").cmd("all")
        end,
        desc = "Noice All"
    }, {
        "<leader>snd",
        function()
            require("noice").cmd("dismiss")
        end,
        desc = "Dismiss All"
    }, {
        "<c-f>",
        function()
            if not require("noice.lsp").scroll(4) then
                return "<c-f>"
            end
        end,
        silent = true,
        expr = true,
        desc = "Scroll forward",
        mode = {"i", "n", "s"}
    }, {
        "<c-b>",
        function()
            if not require("noice.lsp").scroll(-4) then
                return "<c-b>"
            end
        end,
        silent = true,
        expr = true,
        desc = "Scroll backward",
        mode = {"i", "n", "s"}
    }},
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify"
    }
}}

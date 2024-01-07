-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {{
    'akinsho/toggleterm.nvim',
    version = "*",
    opts = {
        open_mapping = [[<c-\>]],
        direction = "float"
    }
}, {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {"nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim"},
    branch = "v3.x",
    cmd = "Neotree",
    keys = {{
        "<leader>fe",
        function()
            require("neo-tree.command").execute({
                toggle = true,
                dir = vim.env.HOME
            })
        end,
        desc = "Explorer NeoTree (root dir)"
    }, {
        "<leader>fE",
        function()
            require("neo-tree.command").execute({
                toggle = true,
                dir = vim.fn.getcwd()
            })
        end,
        desc = "Explorer NeoTree (cwd)"
    }, {
        "<leader>ge",
        function()
            require("neo-tree.command").execute({
                source = "git_status",
                toggle = true
            })
        end,
        desc = "Git explorer"
    }, {
        "<leader>be",
        function()
            require("neo-tree.command").execute({
                source = "buffers",
                toggle = true
            })
        end,
        desc = "Buffer explorer"
    }},
    deactivate = function()
        vim.cmd([[Neotree close]])
    end,
    init = function()
        if vim.fn.argc(-1) == 1 then
            local stat = vim.loop.fs_stat(vim.fn.argv(0))
            if stat and stat.type == "directory" then
                require("neo-tree")
            end
        end
    end,
    config = function()
        require("neo-tree").setup({
            sources = {"filesystem", "buffers", "git_status", "document_symbols"},
            open_files_do_not_replace_types = {"terminal", "Trouble", "trouble", "qf", "Outline"},
            filesystem = {
                bind_to_cwd = false,
                follow_current_file = {
                    enabled = true
                },
                use_libuv_file_watcher = true
            },
            window = {
                width = 30,
                position = "right",
                mappings = {
                    ["<space>"] = "none"
                }
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
                enabled = false
            },
            panel = {
                enabled = false
            }
        })
    end
}, {
    "zbirenbaum/copilot-cmp",
    config = function()
        require("copilot_cmp").setup()
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
    dependencies = { -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim", -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify"}
}}

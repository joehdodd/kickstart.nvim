return {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    init = function()
        local fb_actions = require "telescope".extensions.file_browser.actions
        require("telescope").setup {
            extensions = {
                file_browser = {
                    hijack_netrw = true,
                    path_to_cwd = true,
                },
            },
        }
        require("telescope").load_extension "file_browser"
    end,
    keys = { {
        '<leader>fb',
        '<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>',
        desc = 'File Browser - Toggle'
    } },
}

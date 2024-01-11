return {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
        require('dashboard').setup {
            hide = {
                tabline = true, -- hide tabline
                winbar = true -- hide winbar
            },
            config = {
                week_header = {
                    enable = true,
                },
                disable_move = true,
            }
        }
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } }
}

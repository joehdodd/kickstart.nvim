return {
    'akinsho/toggleterm.nvim',
    version = "*",
    lazy = false,
    config = function()
        require("toggleterm").setup({
            size = 10,
            open_mapping = [[<c-\>]],
            direction = "horizontal"
        })
    end,
    keys = { {
        '<leader>tt',
        function()
            require('toggleterm').toggle()
        end,
        desc = 'Toggle Terminal'
    } },
}

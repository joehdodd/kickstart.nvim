return {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    config = function()
        require("catppuccin").setup({
            flavor = "macchiato",
            styles = {
                keywords = { "bold", "italic" },
            },
        })
        vim.cmd("colorscheme catppuccin-macchiato")
    end,
    keys = { { "<leader>tcd", ":Catppuccin macchiato<CR>", desc = "Catppuccin Macchiato" }, { "<leader>tcl", ":Catppuccin latte<CR>", desc = "Catppuccin Latte" } },
}

return {
    -- fugitive
    {
        "tpope/vim-fugitive",
        cmd = {
            "Git"
        }
    },
    -- gitgutter
    {
        "airblade/vim-gitgutter"
    },
    {
        "kdheepak/lazygit.nvim",
        lazy = true,
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        -- setting the keybinding for LazyGit with 'keys' is recommended in
        -- order to load the plugin when the command is run for the first time
        keys = {
            { "<leader>g",  group = "Git" },
            { "<leader>gg", "<cmd>LazyGit<cr>",       desc = "LazyGit" },
            { "<leader>gc", "<cmd>LazyGitConfig<cr>", desc = "LazyGit config" },
            { "<leader>gf", "<cmd>LazyGitFilter<cr>", desc = "LazyGit filter" }
        }
    }
}

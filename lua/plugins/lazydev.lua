return {
    --  lazy开发的支持
    {
        "folke/lazydev.nvim",
        ft = "lua",
        cmd = "LazyDev",
        opts = function(_, opts)
            opts.library = {
                --  lazy
                { path = "lazy.nvim",                 mods = { "lazy" } },
                --  basic
                { path = "nvim.notify",               mods = { "notify" } },
                { path = "telescope.nvim",            mods = { "telescope" } },
                { path = "telescope-fzf-native.nvim", mods = { "telescope", "fzf_lib" } },
                --  lsp
                { path = "nvim-treesitter",           mods = { "nvim-treesitter" } },
                { path = "nvim-lspconfig",            mods = { "lspconfig" } },
                { path = "mason-lspconfig",           mods = { "mason-lspconfig" } },
                { path = "mason.nvim",                mods = { "mason" } },
                { path = "mason-extra-cmds",          mods = { "masonextracmds" } },
                { path = "nvim-cmp",                  mods = { "cmp" } },
                { path = "cmp-buffer",                mods = { "cmp_buffer" } },
                { path = "cmp-path",                  mods = { "cmp_path" } },
                { path = "cmp-nvim-lsp",              mods = { "cmp_nvim_lsp" } },
            }
        end,
        config = function()
        end
    },
}

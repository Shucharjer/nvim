if true then
    return {}
end
return {
    {
        "kawre/leetcode.nvim",
        biuld = ":TSUpdate html",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim"
        },
        opts = function()
            return {
                lang = "cpp",
                cn = {
                    enabled = true,
                },
                storage = {
                    home = vim.fn.stdpath("data") .. "/leetcode",
                    cache = vim.fn.stdpath("cache") .. "/leetcode"
                },
                cache = {
                    update_interval = 60 * 60 * 24 * 7
                },
                injector = {
                    ["cpp"] = {
                        before = {
                            '#include "header.hpp"',
                        },
                        after = {

                        }
                    }
                }
            }
        end,
        config = function(_, opts)
            require("leetcode").setup(opts)
            vim.keymap.set("n", "<A-l>", ":Leet ", { noremap = true, silent = false, desc = "Leet" })
        end
    }
}

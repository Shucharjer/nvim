return {
    {
        "danymat/neogen",
        opts = function()
            return {
                enabled = true,
                languages = {
                    ["cpp.doxygen"] = require("neogen.configurations.cpp")
                },
                input_after_generated = true,
            }
        end,
        config = function(_, opts)
            require("neogen").setup(opts)
            local wk = require("which-key")
            wk.add({
                { "<leader>gd", "<cmd>Neogen<cr>",       desc = "Generate doxygen comment" },
                { "<leader>gf", "<cmd>Neogen func<cr>",  desc = "Generate doxygen comment for this function" },
                { "<leader>gF", "<cmd>Neogen file<cr>",  desc = "Generate doxygen comment for this file" },
                { "<leader>gc", "<cmd>Neogen class<cr>", desc = "Generate doxygen comment for this class" },
                { "<leader>gt", "<cmd>Neogen type<cr>",  desc = "Generate doxygen comment for this type" },
            })
        end
    },
    {
        "wakatime/vim-wakatime",
        event = "VeryLazy",
        config = function()
            local wk = require("which-key")
            wk.add({
                { "<leader>mw", "<cmd>WakaTimeToday<cr>", desc = "Wakatime today" }
            })
        end
    },
    {
        "AllenDang/nvim-expand-expr",
        event = "VeryLazy",
        config = function()
            local wk = require("which-key")
            wk.add({
                { "<leader>ge", function() require("expand_expr").expand() end, desc = "generate expression" }
            })
        end
    },
}

-------------------------------------------------------------------------------
--  vsnip               代码片段
--  neogen              注释生成                                   1 key binding
--  wakatime            waka                                     1 key binding
--  nvim-expand-expr    展开表达式                                 1 key binding
--  todo-comments       TODO注释
--  vim-visual-multi    多光标                  some key bindings in the plugin
-------------------------------------------------------------------------------
local utils = require("plugins.utils")
local inorekey = utils.inorekey
local norekey = utils.norekey
local xnorekey = utils.xnorekey

norekey("ng", ":Neogen<CR>", "Generate doxygen comment")

return {
    {
        "hrsh7th/vim-vsnip",
        event = "InsertEnter",
    },
    {
        "danymat/neogen",
        cmd = {
            "Neogen"
        },
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
        end
    },
    {
        "wakatime/vim-wakatime",
        lazy = false,
        config = function()
            --  wa      ->  查看waka
            norekey("wa", ":WakaTimeToday<CR>")
        end
    },
    {
        "AllenDang/nvim-expand-expr",
        lazy = true,
        config = function()
            --  ex      ->  展开表达式
            norekey("ex", function() require("expand_expr").expand() end, "Expand a expression")
        end
    },
    {
        "folke/todo-comments.nvim",
        opts = function()
            return {
                signs = true,
                sign_priority = 8,
                keywords = { TODO = { color = "info" } },
                highlight = { multiline = true, comments_only = true }
            }
        end,
        config = function(_, opts)
            require("todo-comments").setup(opts)
        end
    },
    {
        "mg979/vim-visual-multi",
        tag = "master",
    }
}

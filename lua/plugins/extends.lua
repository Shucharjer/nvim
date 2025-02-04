-------------------------------------------------------------------------------
--  vsnip               代码片段
--  neogen              注释生成                                   1 key binding
--  wakatime            waka                                     1 key binding
--  nvim-expand-expr    展开表达式                                 1 key binding
--  todo-comments       TODO注释
--  vim-visual-multi    多光标                  some key bindings in the plugin
--  indent-blankline    缩进线
--  auto-indent         智能缩进
-------------------------------------------------------------------------------
local utils = require("plugins.utils")
local inorekey = utils.inorekey
local norekey = utils.norekey
local xnorekey = utils.xnorekey

norekey("ng", ":Neogen<CR>", "Generate doxygen comment")
--  ex      ->  展开表达式
norekey("ex", function() require("expand_expr").expand() end, "Expand a expression")

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
        event = "VeryLazy",
        config = function()
            --  wa      ->  查看waka
            norekey("wa", ":WakaTimeToday<CR>")
        end
    },
    {
        "AllenDang/nvim-expand-expr",
        event = "VeryLazy",
        config = function()
        end
    },
    {
        "folke/todo-comments.nvim",
        event = "BufEnter",
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
    },
    {
        "nvim-treesitter/nvim-treesitter-refactor",
        dependencies = {
            "nvim-treesitter/nvim-treesitter"
        },
        event = "VeryLazy",
        opts = function()
            return {
                refactor = {
                    highlight_definition = {
                        enable = true,
                        clear_on_cursor_move = true
                    },
                    highlight_current_scope = {
                        enable = false
                    },
                    navigation = {
                        enable = false
                    },
                }
            }
        end,
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        dependencies = {
            "nvim-treesitter/nvim-treesitter"
        },
        main = "ibl",
        event = "BufEnter",
        config = function()
            local highlight = {
                "RainbowRed",
                "RainbowYellow",
                "RainbowBlue",
                "RainbowOrange",
                "RainbowGreen",
                "RainbowViolet",
                "RainbowCyan",
            }
            local hooks = require "ibl.hooks"
            -- create the highlight groups in the highlight setup hook, so they are reset
            -- every time the colorscheme changes
            hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
                vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
                vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
                vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
                vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
                vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
                vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
                vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
            end)

            vim.g.rainbow_delimiters = { highlight = highlight }
            require("ibl").setup {
                indent = {
                    char = "▏",
                },
                scope = {
                    highlight = highlight,
                    show_start = false,
                    show_end = false,
                }
            }

            hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
        end
    },
    {
        "vidocqh/auto-indent.nvim",
        event = "VeryLazy",
        opts = function()
            return {
                indentexpr = function(lnum)
                    return require("nvim-treesitter.indent").get_indent(lnum)
                end
            }
        end,
        config = function(_, opts)
            require("auto-indent").setup(opts)
        end
    },
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

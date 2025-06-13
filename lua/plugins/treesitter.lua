local utils = require("utils")

return {
    -- treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
        lazy = false,
        build = ":TSUpdate",
        opts = {
            ensure_installed = {
                "lua", "markdown", "markdown_inline", "doxygen"
            },
            auto_install = true, -- seems it is bugged
            highlight = {
                enable = true,
                disable = function(_, bufnr) return utils.is_big_file(bufnr) end,
            },
            indent = { enable = true },
            incremental_selection = { enable = true },
            textobjects = {
                --  选择
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        ["vb"] = { query = "@block.inner", desc = "inside block" },
                        ["vB"] = { query = "@block.outer", desc = "around block" },
                        ["vc"] = { query = "@class.inner", desc = "inside class" },
                        ["vC"] = { query = "@class.outer", desc = "around class" },
                        ["vk"] = { query = "@conditional.inner", desc = "inside conditional" },
                        ["vK"] = { query = "@conditional.outer", desc = "around conditional" },
                        ["vf"] = { query = "@function.inner", desc = "inside function " },
                        ["vF"] = { query = "@function.outer", desc = "around function " },
                        ["vl"] = { query = "@loop.inner", desc = "inside loop" },
                        ["vL"] = { query = "@loop.outer", desc = "around loop" },
                        ["vp"] = { query = "@parameter.inner", desc = "inside parameter" },
                        ["vP"] = { query = "@parameter.outer", desc = "around parameter" },
                    }
                },
                --  移动（跳转）
                move = {
                    enable = true,
                    set_jumps = true,
                    goto_next_start = {
                        ["nb"] = { query = "@block.outer", desc = "Next block start" },
                        ["nf"] = { query = "@function.outer", desc = "Next function start" },
                        ["np"] = { query = "@parameter.inner", desc = "Next parameter start" }
                    },
                    goto_next_end = {
                        ["nB"] = { query = "@block.outer", desc = "Next block end" },
                        ["nF"] = { query = "@function.outer", desc = "Next function end" },
                        ["nP"] = { query = "@parameter.inner", desc = "Next parameter end" }
                    },
                    goto_previous_start = {
                        ["Nb"] = { query = "@block.outer", desc = "Next block end" },
                        ["Nf"] = { query = "@function.outer", desc = "Next function end" },
                        ["Np"] = { query = "@parameter.inner", desc = "Next parameter end" }
                    },
                    goto_previous_end = {
                        ["NB"] = { query = "@block.outer", desc = "Next block end" },
                        ["NF"] = { query = "@function.outer", desc = "Next function end" },
                        ["NP"] = { query = "@parameter.inner", desc = "Next parameter end" }
                    }
                }
            },
        },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
            local wk = require("which-key")
            wk.add({
                { "<leader>v", group = "Textobjects" }
            })
        end,
    },
    -- nvim-treesitter-refactor
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
    -- smart indent
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
    --  peek, peek & breadcrumb
    {
        -- 虽然叫lspsaga, 但是依赖的是treesitter
        "nvimdev/lspsaga.nvim",
        event = "VeryLazy",
        opts = {
            --  这些快捷键是在查看的窗口里的
            diagnostic = {
                quit = "q"
            },
            code_action = {
                keys = {
                    quit = "q",
                },
            },
            finder = {
                keys = {
                    close = "Q",
                    quit = "q",
                }
            },
            definition = {
                keys = {
                    edit = "e",
                    close = "Q",
                    quit = "q",
                },
            },
            rename = {
                auto_save = false,
                in_select = true,
                keys = {
                    select = "x",
                    exec = "<CR>",
                    quit = "<C-c>",
                },
            },
            outline = {
                keys = {
                    toggle_or_jump = "o",
                    quit = "q",
                    jump = "g",
                },
            },
            callhierarchy = {
                keys = {
                    edit = "e",
                    split = "s",
                    vsplit = "S",
                    close = "Q",
                    quit = "q",
                },
            },
            typehierarchy = {
                keys = {
                    split = "s",
                    vsplit = "S",
                    close = "Q",
                    quit = "q",
                },
            },
        },
        config = function(_, opts)
            require("lspsaga").setup(opts)
            local wk = require("which-key")
            wk.add({
                mode = { "n" },

                { "K",           "<cmd>Lspsaga hover_doc<cr>",                  desc = "Hover document at the cursor" },

                { "<leader>l",   group = "Lsp \u{e64e}" },
                { "<leader>la",  "<cmd>Lspsaga code_action<cr>",                desc = "Code action" },
                { "<leader>lr",  "<cmd>Lspsaga rename<cr>",                     desc = "Rename the symbol",                  icon = "" },
                { "<leader>lo",  "<cmd>Lspsaga outline<cr>",                    desc = "Show symbol outline",                icon = "" },
                { "<leader>lf",  "<cmd>Lspsaga finder<cr>",                     desc = "Find",                               icon = "" },

                { "<leader>ls",  group = "Server" },
                { "<leader>lss", "<cmd>LspStart<cr>",                           desc = "Start LSP server" },
                { "<leader>lsr", "<cmd>LspRestart<cr>",                         desc = "Restart LSP server" },

                { "g",           group = "Peek or goto" },
                { "gd",          "<cmd>Lspsaga peek_definition<cr>",            desc = "Peek definition",                    icon = "" },
                { "gD",          "<cmd>Lspsaga goto_definition<cr>",            desc = "Goto definition",                    icon = "" },
                { "gt",          "<cmd>Lspsaga peek_type_definition<cr>",       desc = "Peek type definition",               icon = "" },
                { "gT",          "<cmd>Lspsaga goto_type_definition<cr>",       desc = "Goto type definition",               icon = "" },
                { "gr",          "<cmd>Lspsaga peek_type_definition<cr>",       desc = "Peek type definition",               icon = "" },
                { "gR",          "<cmd>Lspsaga goto_type_definition<cr>",       desc = "Goto type definition",               icon = "" },
                { "gs",          "<cmd>Lspsaga supertypes<cr>",                 desc = "Supertypes",                         icon = "" },
                { "gS",          "<cmd>Lspsaga subtypes<cr>",                   desc = "Subtypes",                           icon = "" },

                { "<leader>d",   group = "Diagnostics" },
                { "<leader>dn",  "<cmd>Lspsaga diagnostic_jump_next<cr>",       desc = "Next diagnostic",                    icon = "" },
                { "<leader>dN",  "<cmd>Lspsaga diagnostic_jump_prev<cr>",       desc = "Previous diagnostic",                icon = "" },
                { "<leader>dw",  "<cmd>Lspsaga show_workspace_diagnostics<cr>", desc = "Show diagnostics in this workspace", icon = "" },
                { "<leader>db",  "<cmd>Lspsaga show_buf_diagnostics<cr>",       desc = "Show diagnostics in this buffer",    icon = "" },
                { "<leader>dl",  "<cmd>Lspsaga show_line_diagnostics<cr>",      desc = "Show diagnostics in this line",      icon = "" },
                { "<leader>dc",  "<cmd>Lspsaga show_cursor_diagnostics<cr>",    desc = "Show diagnostics at the cursor",     icon = "" },
            })
        end
    },
    {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
            file_types = { "markdown", "Avante" }
        },
        ft = { "markdown", "Avante" }
    }
}

local utils = require("utils")

local is_android = vim.fn.isdirectory('/data') == 1 -- true if on android

return {
    -- colorscheme
    {
        "Mofiqul/vscode.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("vscode").setup({
                transparent = true,
                italic_comments = true,
                underline_links = true,
                disable_nvimtree_bg = true,
            })
            vim.g.default_colorscheme = "vscode"
            vim.cmd.colorscheme "vscode"
        end,
    },
    -- which-key
    {
        "folke/which-key.nvim",
        event = "VimEnter",
        opts = {
            preset = "helix"
        },
        config = function(_, opts)
            local wk = require("which-key")
            wk.setup(opts)
            wk.add({
                { "<leader>bd", "<cmd>bd<cr>", desc = "delete" }
            })
        end
    },
    -- explorer
    {
        "mikavilpas/yazi.nvim",
        event = "VeryLazy",
        keys = {
            {
                "<leader>e",
                mode = { "n", "v" },
                "<cmd>Yazi toggle<cr>",
                desc = "Open yazi at the current file"
            }
        },
        opts = {
            open_for_directories = true,
        },
        init = function()
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1
        end,
    },
    -- telescope
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        lazy = false,
        dependencies = {
            {
                "nvim-lua/plenary.nvim"
            },
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                enabled = vim.fn.executable("cmake") == 1,
                build =
                "cmake -G Ninja -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release"
            },
            {
                "nvim-telescope/telescope-dap.nvim"
            },
        },
        opts = function()
            local actions = require("telescope.actions")
            local fb_actions = nil
            local file_browser = nil
            if utils.is_available("telescope-file-browser.nvim") then
                fb_actions = require("telescope").extensions.file_browser.actions
                file_browser = {
                    -- disable netr and use telescope-file-browser
                    hijack_netrw = true,
                    depth = -1,
                    auto_depth = true,
                    ignore = {
                        "node_modules",
                        ".git",
                    },
                    mappings = {
                        ["i"] = {
                            ["<C-n>"] = fb_actions.create,
                            ["<C-f>"] = fb_actions.create_from_prompt,
                            ["<C-d>"] = fb_actions.remove,
                            ["<C-r>"] = fb_actions.rename,
                            ["<C-m>"] = fb_actions.move,
                            ["<C-h>"] = fb_actions.goto_cwd,
                            ["<A-h>"] = fb_actions.goto_home_dir,
                            ["<C-p>"] = fb_actions.goto_parent_dir,
                        },
                        ["n"] = {
                            ["n"] = fb_actions.create,
                            ["f"] = fb_actions.create_from_prompt,
                            ["d"] = fb_actions.remove,
                            ["r"] = fb_actions.rename,
                            ["m"] = fb_actions.move,
                            ["h"] = fb_actions.goto_cwd,
                            ["H"] = fb_actions.goto_home_dir,
                            ["p"] = fb_actions.goto_parent_dir,
                        },
                    },
                }
            end


            return {
                layout_config = {
                    horizontal = {
                        prompt_position = "top",
                        preview_width = 0.50,
                    },
                },
                file_ignore_patterns = {
                    "node_modules",
                    ".git",
                    "dist",
                },
                defaults = {
                    mappings = {
                        i = {
                            ["<C-c>"] = actions.close,
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-k>"] = actions.move_selection_previous,
                            ["<C-o>"] = actions.select_default,
                            ["<C-u>"] = actions.toggle_selection,
                            ["<C-a>"] = actions.select_all,
                        },
                        n = {
                            ["<C-c>"] = actions.close,
                            ["o"] = actions.select_default,
                            ["u"] = actions.toggle_selection,
                            ["a"] = actions.select_all,
                        }
                    }
                },
                extensions = {
                    --  如果希望使用telescope的文件浏览器就把下面这块的注释取消掉
                    file_browser = file_browser,
                    fzf = {
                        fuzzy = true,
                        override_generic_sorter = true,
                        override_file_sorter = true,
                        case_mode = "smart_case",
                    },
                    live_grep_args = {
                        auto_quoting = true,
                    },
                }
            }
        end,
        config = function(_, opts)
            local telescope = require("telescope")
            local wk = require("which-key")
            telescope.setup(opts)

            if utils.is_available("nvim-notify") then telescope.load_extension("notify") end
            if utils.is_available("telescope-fzf-native.nvim") then telescope.load_extension("fzf") end
            if utils.is_available("telescope-live-grep-args.nvim") then
                require("telescope").load_extension(
                    "live_grep_args")
            end
            if utils.is_available("telescope-file-browser.nvim") then
                telescope.load_extension("file_browser")
                wk.add({
                    { "<leader>e", "<cmd>Telescope file_browser<cr>", desc = "Open file browser" }
                })
            end

            local wk = require("which-key")
            wk.add({
                { "<leader>f",  group = "Find" },
                { "<leader>ff", "<cmd>Telescope fd<cr>",                        desc = "Find file" },
                { "<leader>fb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Fuzzy find" },
                { "<leader>fg", "<cmd>Telescope live_grep<cr>",                 desc = "Live grep" },
                { "<leader>fw", "<cmd>Telescope grep_string<cr>",               desc = "grep string" },

                { "<leader>bl", "<cmd>Telescope buffers<cr>",                   desc = "Buffer list" }
            })

            wk.add({
                { "<leader>l",  group = "List" },
                { "<leader>Ls", "<cmd>Telescope search_history<cr>", desc = "Search history" },
                { "<leader>Lj", "<cmd>Telescope jumplist<cr>",       desc = "Jump list" }
            })
        end,
    },
    -- flash
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = {},
        keys = {
            { "s",         mode = { "n", "x" }, function() require("flash").jump() end,              desc = "Flash" },
            { "S",         mode = { "n", "x" }, function() require("flash").treesitter() end,        desc = "Flash treesitter" },
            { "<leader>j", mode = { "o" },      function() require("flash").jump() end,              desc = "Flash" },
            { "<leader>J", mode = { "o" },      function() require("flash").treesitter() end,        desc = "Flash treesitter" },
            { "r",         mode = "o",          function() require("flash").remote() end,            desc = "Remote flash" },
            { "R",         mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter search" },
        }
    },
    -- leap
    -- {
    --     "ggandor/leap.nvim",
    --     lazy = false, -- Please Do Not Load This Plugin Lazily
    --     dependencies = { "tpope/vim-repeat" },
    --     config = function()
    --         local wk = require("which-key")
    --         wk.add({
    --             mode = { "n", "x" },
    --             { "s", "<Plug>(leap-forward)",  desc = "Leap forward" },
    --             { "S", "<Plug>(leap-backward)", desc = "Leap backward" },
    --         })
    --
    --         require("leap.user").set_repeat_keys("<C-j>", "<C-k>",
    --             { relative_directions = false, modes = { "n", "x", "o" } })
    --     end,
    -- },
    -- auto pair
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup()
        end
    },
    -- rainbow delimiters
    {
        "HiPhish/rainbow-delimiters.nvim",
        event = "BufEnter"
    },
    -- airline
    {
        "vim-airline/vim-airline-themes",
        event = "VimEnter",
        dependencies = { "vim-airline/vim-airline" },
        config = function()
            vim.cmd("AirlineTheme transparent")
        end
    },
    -- notify
    {
        "rcarriga/nvim-notify",
        lazy = false,
        config = function()
            require("notify").setup({
                background_colour = "#000000"
            })
        end
    },
    -- bufferline
    {
        "akinsho/bufferline.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        lazy = false,
        opts = {
            options = {
                indicator = {
                    icon = '▎',
                    style = "icon",
                },
            },
        },
        config = function(_, opts)
            require("bufferline").setup(opts)
            local wk = require("which-key")
            wk.add({
                { "<a-e>",       "<cmd>BufferLineCycleNext<cr>",   desc = "Next buffer in bufferline" },
                { "<a-q>",       "<cmd>BufferLineCyclePrev<cr>",   desc = "Previous buffer in bufferline" },
                { "<a-c>",       "<cmd>BufferLineCloseOthers<cr>", desc = "Close other buffers" },
                { "<a-Q>",       "<cmd>BufferLineMovePrev<cr>",    desc = "Move to previous buffer" },
                { "<a-E>",       "<cmd>BufferLineMoveNext<cr>",    desc = "Move to next buffer" },
                { "<a-p>",       "<cmd>BufferLinePick<cr>",        desc = "Pick a buffer" },
                { "<a-P>",       "<cmd>BufferLinePickClose<cr>",   desc = "Pick & close a buffer" },

                { "<leader>bch", "<cmd>BufferLineCloseLeft<cr>",   desc = "Close left buffers" },
                { "<leader>bcl", "<cmd>BufferLineCloseRight<cr>",  desc = "Close right buffers" },
                { "<leader>bco", "<cmd>BufferLineCloseOthers<cr>", desc = "Close other buffers" }
            })
        end
    },
    -- noice
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify"
        },
        opts = {
            cmdline = {
                enabled = true,
                --      "cmdline" or "cmdline_popup"
                view = "cmdline_popup"
            },
            lsp = {
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true
                }
            }
        }
    },
    -- multi cursor
    -- {
    --     "mg979/vim-visual-multi",
    --     tag = "master",
    -- },
    {
        "smoka7/multicursors.nvim",
        event = "VeryLazy",
        dependencies = {
            "nvimtools/hydra.nvim"
        },
        opts = {},
        cmd = { "MCstart", "MCVisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
        keys = {
            {
                mode = { "v", "n" },
                "<leader>m",
                "<cmd>MCstart<cr>",
                desc = "Create a selection for selected text or word under the cursor"
            }
        }
    },
    -- enchanced indent
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
    -- comment
    {
        "numToStr/Comment.nvim",
        event = "BufEnter",
        config = function()
            require("Comment").setup()
        end
    },
    -- block movement
    {
        "hinell/move.nvim",
        config = function()
            local wk = require("which-key")
            wk.add(
                {
                    mode = { "n" },
                    { "<A-Up>",    "<cmd>MoveLine -1<cr>" },
                    { "<A-Down>",  "<cmd>MoveLine 1<cr>" },
                    { "<A-Left>",  "<cmd>MoveWord -1<cr>" },
                    { "<A-Right>", "<cmd>MoveWord 1<cr>" }
                },
                {
                    mode = { "v" },
                    { "<A-Up>",    "<cmd>MoveBlock -1<cr>" },
                    { "<A-Down>",  "<cmd>MoveBlock 1<cr>" },
                    { "<A-Left>",  "<cmd>MoveHBlock -1<cr>" },
                    { "<A-Right>", "<cmd>MoveHBlock 1<cr>" }
                }
            )
        end
    },
    -- cursor hover doc
    {
        "soulis-1256/eagle.nvim",
        event = "VimEnter",
        opts = function()
            return {
                imporoved_markdown = true,
                mouse_mode = true,
                keyboard_mode = false,
                border = "rounded"
            }
        end,
        config = function(_, opts)
            require("eagle").setup(opts)
            vim.o.mousemoveevent = true
        end
    },
    -- todo
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
            local wk = require("which-key")
            if utils.is_available("telescope") then
                wk.add({
                    { "<leader>Lt", "<cmd>TodoTelescope<cr>", desc = "Todo list" }
                })
            else
                wk.add({
                    { "<leader>Lt", "<cmd>TodoLocList<cr>", desc = "Todo list" }
                })
            end
        end
    },
    -- better diagnostic
    {
        "sontungexpt/better-diagnostic-virtual-text",
        event = "BufEnter",
        opts = function()
            return {
                inline = true,
            }
        end,
        config = function(_, opts)
            require("better-diagnostic-virtual-text").setup(opts)
        end
    },
    -- yank
    {
        "gbprod/yanky.nvim",
        opts = {}
    },
    -- surround
    {
        "echasnovski/mini.surround",
        opts = function()
            return {
                mappings = {
                    add = "<leader>sa",
                    delete = "<leader>sd",
                    find = "<leader>sf",
                    find_left = "<leader>sF",
                    highlight = "<leader>sh",
                    replace = "<leader>sr",
                    update_n_line = "<leader>sn",
                    suffix_last = "p",
                    suffix_next = "n"
                }
            }
        end
    }
}

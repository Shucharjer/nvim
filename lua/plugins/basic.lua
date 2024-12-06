-------------------------------------------------------------------------------
--  vscode                  颜色主题
--  tfm                     文件管理器           some key bindings in the plugin
--  plenary                 一个被依赖的底层库
--  telescope               模糊搜索       7 key bindings (include extionsions)
--      fzf                 它的扩展
--  leap                    光标移动                              4 key bindings
--      repeat              它的依赖
--  autopairs               括号匹配
--  rainbow-delimiters      彩虹括号
--  airline-themes          airline主题
--  notify                  提示
--  bufferline              缓冲区栏
--  noice
--  comment
--  move                    移动行/块                            8 key bindings
-------------------------------------------------------------------------------
local utils = require("plugins.utils")
local inorekey = utils.inorekey
local norekey = utils.norekey
local xnorekey = utils.xnorekey

local is_android = vim.fn.isdirectory('/data') == 1 -- true if on android


return {
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
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            preset = "helix"
        }
    },
    --  使用了tfm就不必使用yazi了
    -- {
    --     "mikavilpas/yazi.nvim",
    --     event = "VeryLazy",
    --     keys = {
    --         {
    --             "fb",
    --             "<cmd>Yazi<cr>",
    --             desc = "Open yazi at the current file"
    --         }
    --     },
    --     opts = {
    --         open_for_directories = true,
    --     }
    -- },
    --除此之外，感觉telescope的文件管理器也还不错
    --如果要试试的话就把yazi和tfm注释掉，把下面telescope的文件浏览器那里的注释取消掉
    -- {
    --     "Rolv-Apneseth/tfm.nvim",
    --     opts = {
    --         file_manager = "yazi",
    --         replace_netrw = true,
    --         enable_cmds = true,
    --         keybingds = {
    --             ["<Ecs>"] = "q",
    --             ["<C-v>"] = "<C-\\><C-O>:lua require('tfm').set_next_open_mode(require('tfm').OPEN_MODE.vsplit)<CR>",
    --             ["<C-h>"] = "<C-\\><C-O>:lua require('tfm').set_next_open_mode(require('tfm').OPEN_MODE.split)<CR>",
    --             ["<C-t>"] = "<C-\\><C-O>:lua require('tfm').set_next_open_mode(require('tfm').OPEN_MODE.tabedit)<CR>",
    --         },
    --         ui = {
    --             border = "rounded",
    --             height = 0.90,
    --             width = 1,
    --         },
    --     },
    --     config = function(_, opts)
    --         require("tfm").setup(opts)
    --         vim.api.nvim_set_keymap("n", "fb", "",
    --             { noremap = true, callback = require("tfm").open }
    --         )
    --     end
    --     --  移动：hjkl gg G
    --     --  r   ->  rename
    --     --  a   ->  create
    --     --  f   ->  filter
    --     --  y   ->  yank
    --     --  p   ->  paste
    --     --  d   ->  delete
    --     --  s   ->  search  via fd
    --     --  c   ->  c   ->  copy path
    --     --          d   ->  copy directory path
    --     --          f   ->  copy filename
    --     --          n   ->  copy filename with
    --     --  o   ->  open
    --     --  q   ->  quit
    --     --  w   ->  tasks
    --     --  支持选择
    --     --  很生草的一件事情：创建文件夹只能用命令
    --     --      比如`:mkdir example`
    -- },
    {
        "nvim-lua/plenary.nvim",
    },
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
            --{
            --"nvim-telescope/telescope-dap.nvim"
            --},
            --  如果希望使用它的文件浏览器就把注释取消掉
            {
                "nvim-telescope/telescope-file-browser.nvim"
            }
        },
        -- cmd = {
        --     "Telescope",
        --     "Telescope buffers",
        --     "Telescope colorscheme",
        --     "Telescope current_buffer_fuzzy_find",
        --     "Telescope diagnostics",
        --     "Telescope live_grep",
        --     "Telescope fd",
        --     "Telescope jumplist"
        -- },
        opts = function()
            local actions = require("telescope.actions")
            local fb_actions = nil
            if utils.is_available("telescope-file-browser.nvim") then
                fb_actions = require("telescope").extensions.file_browser.actions
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
                    },
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
            telescope.setup(opts)

            if utils.is_available("nvim-notify") then telescope.load_extension("notify") end
            if utils.is_available("telescope-fzf-native.nvim") then telescope.load_extension("fzf") end
            if utils.is_available("telescope-live-grep-args.nvim") then
                require("telescope").load_extension(
                    "live_grep_args")
            end
            if utils.is_available("telescope-file-browser.nvim") then
                telescope.load_extension("file_browser")
                norekey("fb", ":Telescope file_browser<CR>", "Open file browser")
            end

            --  ff      ->  寻找文件[find file]
            norekey("ff", ":Telescope fd<CR>", "Find file")
            --  fp      ->  模糊查找[find by pattern]
            norekey("fp", ":Telescope current_buffer_fuzzy_find<CR>", "Fuzzy find")
            --  fw      ->  寻找当前指针所在处的单词的出现
            norekey("fw", ":Telescope grep_string<CR>", "Find words same as the word at cursor")
            --  fg      ->  实时搜索
            norekey("fg", ":Telescope live_grep<CR>", "Live grep")
            --  bf      ->  缓冲区列表[buffers]
            norekey("bf", ":Telescope buffers<CR>", "Buffers list")
            --  sh      ->  搜索历史[search history]
            norekey("sh", ":Telescope search_history<CR>", "Search history")
            --  JL      ->  跳转列表[jumplist]
            norekey("JL", ":Telescope jumplist<CR>", "Jump list")
        end,
    },
    {
        "ggandor/leap.nvim",
        lazy = false, -- Please Do Not Load This Plugin Lazily
        dependencies = { "tpope/vim-repeat" },
        config = function()
            --  s       ->  向前跳
            vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap-forward)", { desc = "Leap forward" })
            vim.keymap.set({ "n", "x", "o" }, "S", "<Plug>(leap-backward)", { desc = "Leap backward" })
            --  s<space>->
            norekey("s<space>", "<Plug>(leap-forward-to)", "Leap forward to")
            --  S<space>->
            norekey("S<space>", "<Plug>(leap-backward-to)", "Leap backward to")

            require("leap.user").set_repeat_keys("<C-j>", "<C-k>",
                { relative_directions = false, modes = { "n", "x", "o" } })
        end,
    },
    {
        "windwp/nvim-autopairs",
        event = "BufEnter",
        config = function()
            require("nvim-autopairs").setup()
        end
    },
    {
        "HiPhish/rainbow-delimiters.nvim",
        event = "BufEnter"
    },
    {
        "vim-airline/vim-airline-themes",
        event = "VimEnter",
        dependencies = { "vim-airline/vim-airline" },
        config = function()
            vim.cmd("AirlineTheme transparent")
        end
    },
    {
        "rcarriga/nvim-notify",
        lazy = false,
        config = function()
            require("notify").setup({
                background_colour = "#000000"
            })
        end
    },
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
        }
    },
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
    {
        "numToStr/Comment.nvim",
        event = "BufEnter",
        config = function()
            require("Comment").setup()
        end
    },
    {
        "hinell/move.nvim",
        config = function()
            norekey("<A-Up>", ":MoveLine -1<CR>", "")
            norekey("<A-Down>", ":MoveLine 1<CR>", "")
            norekey("<A-Left>", ":MoveWord -1<CR>", "")
            norekey("<A-Right>", ":MoveWord 1<CR>", "")
            xnorekey("<A-Up>", ":MoveBlock -1<CR>", "")
            xnorekey("<A-Down>", ":MoveBlock 1<CR>", "")
            xnorekey("<A-Left>", ":MoveHBlock -1<CR>", "")
            xnorekey("<A-Right>", ":MoveHBlock 1<CR>", "")
        end
    }
}

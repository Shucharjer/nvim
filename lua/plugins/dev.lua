-------------------------------------------------------------------------------
--  treesitter                  语法分析                         24 key bindings
--      treesitter-textobject   基于语法分析
--  lspconfig                   lsp配置                          2 key bindings
--  mason                       lsp管理
--      mason-extr-cmds         为mason提供额外的命令
--  mason-lspconfig             mason-lspconfig                 1 key bindings
--  lspsaga                     代码查看                         14 key bindings
--  lazydev                     lazy开发
--  cmp                         代码补全
--      cmp-nvim-lsp
--      cmp-buffer
--      cmp-cmdline
--      cmp-path
--      vsnip
--      vim-vsnip
-------------------------------------------------------------------------------
local is_windows = vim.fn.has('win32') == 1
local utils = require("plugins.utils")
local inorekey = utils.inorekey
local norekey = utils.norekey
local xnorekey = utils.xnorekey

local feedkey = function(key, mode)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

norekey("cb", ":CMakeBuild<CR>", "CMake build")
norekey("cc", ":CMakeClean<CR>", "CMake clean")
norekey("cg", ":CMakeGenerate<CR>", "CMake generate")
norekey("csc", ":CMakeSelectCwd<CR>", "CMake select cwd")
norekey("csd", ":CMakeSelectBuildDir<CR>", "CMake select build directory")
norekey("csp", ":CMakeSelectBuildPreset<CR>", "CMake select build preset")
norekey("csk", ":CMakeSelectKit<CR>", "CMake select kit")
norekey("cst", ":CMakeSelectBuildTarget<CR>", "CMake select build target")
norekey("csb", ":CMakeSelectBuildType<CR>", "CMake select build type")

return {
    --  语法分析
    --  可以提供代码高亮、选中、跳转与交换
    {
        "nvim-treesitter/nvim-treesitter",
        event = "User BaseDefered",
        dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
        lazy = false,
        cmd = {
            "TSBufDisable",
            "TSBufEnable",
            "TSBufToggle",
            "TSEnable",
            "TSEnable",
            "TSToggle",
            "TSInstall",
            "TSInstallInfo",
            "TSInstallSync",
            "TSUpdate",
            "TSUpdateSync",
            "TSUninstall",
            "TSModuleInfo"
        },
        build = ":TSUpdate",
        opts = {
            auto_install = true, -- sames it is bugged
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
        end,
    },
    --  语言服务器
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            --  Ks      ->  启动LSP服务器
            norekey("Ks", ":LspStart<CR>", "Start LSP server")
            --  Kr      ->  重启LSP服务器
            norekey("Kr", ":LspRestart<CR>", "Restart LSP server")
        end
    },
    --  LSP, Linter, Formatter管理器
    {
        "williamboman/mason.nvim",
        -- event = "User BaseFile",
        -- event = "BufEnter",
        dependencies = { "zeioth/mason-extra-cmds" },
        lazy = false,
        opts = {
            ui = {
                border = "rounded",
                width = 1.0,
                height = 1.0
            },
            -- This is the default keymaps
            -- keymaps = {
            -- ---@since 1.0.0
            -- -- Keymap to expand a package
            -- toggle_package_expand = "<CR>",
            -- ---@since 1.0.0
            -- -- Keymap to install the package under the current cursor position
            -- install_package = "i",
            -- ---@since 1.0.0
            -- -- Keymap to reinstall/update the package under the current cursor position
            -- update_package = "u",
            -- ---@since 1.0.0
            -- -- Keymap to check for new version for the package under the current cursor position
            -- check_package_version = "c",
            -- ---@since 1.0.0
            -- -- Keymap to update all installed packages
            -- update_all_packages = "U",
            -- ---@since 1.0.0
            -- -- Keymap to check which installed packages are outdated
            -- check_outdated_packages = "C",
            -- ---@since 1.0.0
            -- -- Keymap to uninstall a package
            -- uninstall_package = "X",
            -- ---@since 1.0.0
            -- -- Keymap to cancel a package installation
            -- cancel_installation = "<C-c>",
            -- ---@since 1.0.0
            -- -- Keymap to apply language filter
            -- apply_language_filter = "<C-f>",
            -- ---@since 1.1.0
            -- -- Keymap to toggle viewing package installation log
            -- toggle_package_install_log = "<CR>",
            -- ---@since 1.8.0
            -- -- Keymap to toggle the help view
            -- toggle_help = "g?",
            -- },
        },
        config = function(_, opts)
            require("mason").setup(opts)
            -- vim.cmd("MasonUpdate")
        end
    },
    --  LSP自动配置
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "neovim/nvim-lspconfig" },
        event = "BufEnter",
        opts = {
            ensure_installed = { "lua_ls", "clangd", "cmake", "glsl_analyzer" },
            automatic_installation = true,
        },
        config = function(_, opts)
            require("mason-lspconfig").setup(opts)
            local lspconfig = require("lspconfig")

            require("mason-lspconfig").setup_handlers({
                --  默认配置
                function(server_name)
                    lspconfig[server_name].setup({})
                end,

                ["clangd"] = function()
                    lspconfig.clangd.setup({
                        cmd = {
                            "clangd",
                            "--background-index",
                            "--clang-tidy",
                            "--completion-style=detailed",
                            "--function-arg-placeholders=false",
                            "--suggest-missing-includes",
                            "-j=12",
                            "--pch-storage=memory"
                        }
                    })
                end,

                ["lua_ls"] = function()
                    lspconfig.lua_ls.setup({
                        on_init = function(client)
                            if client.workspace_folders then
                                local path = client.workspace_folders[1].name
                                if vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc') then
                                    return
                                end
                            end

                            client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                                runtime = {
                                    -- Tell the language server which version of Lua you're using
                                    -- (most likely LuaJIT in the case of Neovim)
                                    version = 'LuaJIT'
                                },
                                -- Make the server aware of Neovim runtime files
                                workspace = {
                                    checkThirdParty = false,
                                    library = {
                                        vim.env.VIMRUNTIME
                                        -- Depending on the usage, you might want to add additional paths here.
                                        -- "${3rd}/luv/library"
                                        -- "${3rd}/busted/library",
                                    }
                                    -- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
                                    -- library = vim.api.nvim_get_runtime_file("", true)
                                }
                            })
                        end,
                        settings = {
                            Lua = {}
                        }
                    })
                end,
            }) -- setup_handlers

            --  th
            norekey("th", ":ClangdSwitchSourceHeader<CR>", "Switch between source and header")
        end -- config
    },
    --  代码查看
    {
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
                in_select = false,
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
            --  rn      ->  rename
            vim.keymap.set("n", "rn", ":Lspsaga rename<CR>",
                { noremap = true, silent = false, desc = "Rename the symbol" })
            --  gt      ->  peek Type definition
            norekey("gt", ":Lspsaga peek_type_definition<CR>", "Peek type definition")
            --  gT      ->  goto Type definition
            norekey("gT", ":Lspsaga goto_type_definition<CR>", "Go to type definition")
            --  gd
            norekey("gd", ":Lspsaga peek_definition<CR>", "Peek definition")
            --  gD
            norekey("gD", ":Lspsaga goto_definition<CR>", "Go to definition")
            --  ga      ->  outline 沿用了g开头
            norekey("ga", ":Lspsaga outline<CR>", "Outline")
            --  gp      ->  parent
            norekey("gp", ":Lspsaga supertypes<CR>", "Super types")
            --  gP      ->  沿用了gp
            norekey("gP", ":Lspsaga subtypes<CR>", "Sub types")
            --  dn
            norekey("dn", ":Lspsaga diagnostic_jump_next<CR>", "Next diagnostic")
            --  dp
            norekey("dp", ":Lspsaga diagnostic_jump_prev<CR>", "Previous diagnostic")
            --  dw
            norekey("dw", ":Lspsaga show_workspace_diagnostics<CR>", "Diagnostics in workspace")
            --  db
            norekey("db", ":Lspsaga show_buf_diagnostics<CR>", "Diagnostics in buffer")
            --  dl
            norekey("dl", ":Lspsaga show_line_diagnostics<CR>", "Diagnostics in line")
            --  dc
            norekey("dc", ":Lspsaga show_cursor_diagnostics<CR>", "Diagnostic at cursor")
            --  cif     ->  悬浮文档
            norekey("cif", ":Lspsaga hover_doc<CR>", "Information at cursor")
        end
    },
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
    {
        "hrsh7th/cmp-vsnip",
        lazy = true
    },
    --  代码补全
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-vsnip",
            "hrsh7th/vim-vsnip"
        },
        event = "InsertEnter",
        opts = function()
            local cmp = require("cmp")
            return {
                snipper = {
                    expand = function(args)
                        vim.fn["vsnip#anonymous"](args.body)
                    end,
                },
                window = {
                    completion = {
                        winhighlight = "Normal:Pmenu,FloatBrder:Pmenu,Search:None",
                        col_offset = -3,
                        side_padding = 0,
                        border = "rounded",
                        cscrollbar = true,
                    },
                    documentation = {
                        winhighlight = "Normal:Pmenu,FloatBrder:Pmenu,Search:None",
                        border = "rounded",
                        cscrollbar = true,
                    },
                },
                mapping = cmp.mapping.preset.insert({
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if vim.fn["vsnip#expandable"]() == 1 then
                            feedkey("<Plug>(vsnip-expand)", "")
                        elseif cmp.visible() then
                            cmp.confirm({ select = true })
                        else
                            fallback()
                        end
                    end
                    ),
                    ["<C-j>"] = cmp.mapping(function(fallback)
                        if vim.fn["vsnip#jumpable"](1) == 1 then
                            feedkey("<Plug>(vsnip-jump-next)", "")
                        elseif cmp.visible() then
                            cmp.select_next_item()
                        else
                            fallback()
                        end
                    end, { "i", "s" }
                    ),
                    ["<C-k>"] = cmp.mapping(function(fallback)
                        if vim.fn["vsnip#jumpable"](-1) == 1 then
                            feedkey("<Plug>(vsnip-jump-prev)", "")
                        elseif cmp.visible() then
                            cmp.select_prev_item()
                        else
                            fallback()
                        end
                    end, { "i", "s" }
                    ),
                }),
                sources = cmp.config.sources({
                    { name = "vsnip",    priority = 1000 },
                    { name = "nvim_lsp", priority = 850 },
                    { name = "lazydev",  priority = 750 },
                    { name = "buffer",   priority = 500 },
                    { name = "path",     priority = 250 }
                })
            }
        end,
    },
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
    -- cmake
    {
        "Civitasv/cmake-tools.nvim",
        cmd = {
            "CMakeBuild",
            "CMakeBuildCurrentFile",
            "CMakeClean",
            "CMakeCloseExecutor",
            "CMakeDebug",
            "CMakeGenerate",
            "CMakeRunner",
            "CMakeOpenExecutor",
            "CMakeOpenRunner",
            "CMakeQuickBuild",
            "CMakeQuickRun",
            "CMakeQuickStart",
            "CMakeRun",
            "CMakeRunCurrentFile",
            "CMakeRunTest",
            "CMakeSelectBuildDir",
            "CMakeSelectBuildPreset",
            "CMakeSelectBuildTarget",
            "CMakeSelectBuildType",
            "CMakeSelectConfigurePreset",
            "CMakeSelectCwd",
            "CMakeSelectKit",
            "CMakeSelectLaunchTarget",
            "CMakeSettings",
            "CMakeStopExecutor",
            "CMakeStopRunner",
            "CMakeTargetSettings"
        },
        opts = function()
            local cmake_tools_kits_path = nil
            local cmake_toolchain_file = nil
            if is_windows then
                cmake_tools_kits_path = os.getenv("USERPROFILE") .. "\\.config\\cmake_tools_kits.json"
                cmake_toolchain_file = "C:/vcpkg/scripts/buildsystems/vcpkg.cmake"
            else
                cmake_tools_kits_path = os.getenv("HOME") .. "/.config/cmake_tools_kits.json"
                cmake_toolchain_file = "/vcpkg/scripts/buildsystems/vcpkg.cmake"
            end

            return {
                cmake_command = "cmake",
                ctest_command = "ctest",
                cmake_use_preset = false,
                cmake_generate_on_save = true,
                cmake_generate_options = {
                    "-DCMAKE_TOOLCHAIN_FILE=" .. cmake_toolchain_file,
                    "-DCMAKE_EXPORT_COMPILE_COMMANDS=1"
                },
                cmake_build_options = {},
                cmake_build_directory = "build",
                cmake_build_type = "RelWithDebInfo",
                cmake_virtual_text_support = true,
                build_args = {
                    "-j18",
                },
                cmake_kits_path = cmake_tools_kits_path
            }
        end,
        config = function(_, opts)
            require("cmake-tools").setup(opts)
        end
    }
}

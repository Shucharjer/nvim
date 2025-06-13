return {
    --  语言服务器
    {
        "neovim/nvim-lspconfig",
        lazy = false,
    },
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
            local is_windows = vim.fn.has('win32') == 1

            require("mason-lspconfig").setup_handlers({
                --  默认配置
                function(server_name)
                    lspconfig[server_name].setup({})
                end,

                ["clangd"] = function()
                    local query_driver = nil
                    if is_windows then
                        query_driver = "--query-driver=C:/Program Files/LLVM/bin/clang++"
                    else
                        query_driver = "--query-driver=/usr/bin/clang++,/usr/bin/g++"
                    end
                    lspconfig.clangd.setup({
                        cmd = {
                            "clangd",
                            "--background-index",
                            "--clang-tidy",
                            query_driver,
                            "--completion-style=detailed",
                            "--function-arg-placeholders=false",
                            "--suggest-missing-includes",
                            "-j=12",
                            "--pch-storage=memory"
                        },
                        init_options = { 
                            fallbackFlags = { "-std=c++20" }
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
                                    -- or pull in all of 'runtimepath'.
                                    -- NOTE: this is a lot slower and will cause issues when working on your own configuration
                                    -- (see https://github.com/neovim/nvim-lspconfig/issues/3189)
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
        end    -- config
    },
}

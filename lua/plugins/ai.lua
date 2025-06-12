local is_windows = vim.fn.has('win32') == 1

local avante_build_command = "make"
local avante_use_absolte_path = false
if is_windows then 
    avante_build_command = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
    use_absolte_path = true

    -- BUG: in makefile
    return {}
end

return {
    {
        "yetone/avante.nvim",
        event = "VeryLazy",
        version = false,
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            -- optional
            "nvim-telescope/telescope.nvim",
            "hrsh7th/nvim-cmp",
            "nvim-tree/nvim-web-devicons",
            {
                "HakonHarnes/img-clip.nvim",
                event = "VeryLazy",
                opts = {
                    default = {
                        embed_image_as_base64 = false,
                        prompt_for_file_name = false,
                        drag_and_drop = {
                            insert_mode = true
                        },
                        use_absolte_path = use_absolte_path
                    }
                }
            },
            {
                "MeanderingProgrammer/render-markdown.nvim",
                opts = {
                    file_types = { "markdown", "Avante" }
                },
                ft = { "markdown", "Avante" }
            }
        },
        build = avante_build_command,
        opts = {
            provider = "deepseek",
            providers = {
                deepseek = {
                    __inherited_from = "openai",
                    endpoint = "https://api.deepseek.com",
                    -- model = "deepseek-char", -- v3-0324
                    model = "deepseek-reasoner", -- r1-0528
                    api_key_name = "__deep_seek",
                    extra_request_body = {
                        timeout = 15000,
                        temperature = 0,
                        max_tokens = 8192
                    }
                }
            }
        },
    }
}

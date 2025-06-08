local feedkey = function(key, mode)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

return {
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
                    { name = "nvim_lsp", priority = 850 },
                    { name = "vsnip",    priority = 800 },
                    { name = "lazydev",  priority = 750 },
                    { name = "buffer",   priority = 500 },
                    { name = "path",     priority = 250 }
                })
            }
        end,
    },
}

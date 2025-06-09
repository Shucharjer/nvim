local is_windows = vim.fn.has('win32') == 1

if is_windows then return {} end

return {
    {
        "aserowy/tmux.nvim",
        opts = {
            navigation = {
                enable_default_keybindings = false
            },
            resize = {
                enable_default_keybindings = false
            },
            swap = {
                enable_default_keybindings = false
            }
        },
        config = function(_, opts)
            local tmux = require("tmux")
            tmux.setup(opts)
            local wk = require("which-key")
            wk.add({
                { "<A-h>",       function() tmux.move_left() end,       desc = "Move left" },
                { "<A-l>",       function() tmux.move_right() end,      desc = "Move right" },
                { "<A-k>",       function() tmux.move_top() end,        desc = "Move top" },
                { "<A-j>",       function() tmux.move_bottom() end,     desc = "Move bottom" },

                { "<leader>t",   group = "Tmux" },

                { "<leader>tn",  function() tmux.next_window() end,     desc = "Next window" },
                { "<leader>tp",  function() tmux.previous_window() end, desc = "Previous window" },

                { "<leader>tsh", function() tmux.swap_left() end,       desc = "Swap left" },
                { "<leader>tsl", function() tmux.swap_right() end,      desc = "Swap right" },
                { "<leader>tsj", function() tmux.swap_down() end,       desc = "Swap right" },
                { "<leader>tsk", function() tmux.swap_up() end,         desc = "Swap left" },
                { "<leader>trh", function() tmux.resize_left() end,     desc = "Resize left" },
                { "<leader>trl", function() tmux.resize_right() end,    desc = "Resize right" },
                { "<leader>trj", function() tmux.resize_down() end,     desc = "Resize down" },
                { "<leader>trk", function() tmux.resize_up() end,       desc = "Resize up" },
            })
        end
    }
}

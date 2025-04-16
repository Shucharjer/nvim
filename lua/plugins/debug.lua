-------------------------------------------------------------------------------
--  dap                     DAP                                 9 key bindings
--  mason-nvim-dap          DAP管理与配置
--  dap-ui                  更优化的DebugUI
--      nio                 一个UI库
--  dap-virtual-text        Debug时的虚拟文字
-------------------------------------------------------------------------------

local is_windows = vim.fn.has('win32') == 1
local utils = require("utils")
local inorekey = utils.inorekey
local norekey = utils.norekey
local xnorekey = utils.xnorekey

return {
    {
        "mfussenegger/nvim-dap",
        event = "BufEnter",
        dependencies = {
            "nvim-telescope/telescope-dap.nvim"
        },
        config = function()
            norekey("<A-b>", ":DapToggleBreakpoint<CR>", "Toggle breakpoint")
            norekey("<A-B>", function()
                require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
            end, "Set conditional breakpoint")
            norekey("<A-r>", ":DapContinue<CR>", "Debug")
            norekey("<A-i>", ":DapStepInto<CR>", "Step into (debug)")
            norekey("<A-o>", ":DapStepOver<CR>", "Step over (debug)")
            norekey("<A-O>", ":DapStepOut<CR>", "Step out (debug)")
            norekey("<A-t>", ":DapTerminate<CR>", "Terminate (debug)")
            norekey("<A-l>", function() require("dap").run_last() end, "Run last (debug)")

            if utils.is_available("telescope-dap.nvim") then
                require("telescope").load_extension("dap")

                vim.keymap.set("n", "<A-s>", ":Telescope dap list_breakpoints<CR>")
                vim.keymap.set("n", "<A-a>", ":Telescope dap commands<CR>")
            end
        end
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = {
            "nvim-dap",
            "williamboman/mason.nvim"
        },
        opts = function()
            return {
                ensure_installed = { "codelldb" },
                automatic_installation = true,
                handlers = {
                    function(config)
                        require("mason-nvim-dap").default_setup(config)
                    end
                },
            }
        end,
        config = function(_, opts)
            require("mason-nvim-dap").setup(opts)
        end
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "nvim-neotest/nvim-nio"
        },
        opts = { floating = { border = "rounded" } },
        config = function(_, opts)
            local dap = require("dap")
            local dapui = require("dapui")

            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end

            dapui.setup(opts)
        end
    },
    {
        "theHamsta/nvim-dap-virtual-text",
        dependencies = { "rcarriga/nvim-dap-ui" },
    }
}

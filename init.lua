--  如果你不熟悉lua
--  你可以尝试不管这些函数的定义
--  而是直接去看调用了哪些函数
--  比如下面的`load_configurations`, `load_colorscheme_async`
--      和load_configurations_async`

local function load_configuration(configuration)
    local status_ok, error = pcall(require, configuration)
    if not status_ok then
        vim.api.nvim_err_writeln("Failed to load " .. configuration .. "\n\n" .. error)
    end
end

local function load_configurations(configurations)
    vim.loader.enable()
    for _, configuration in ipairs(configurations) do
        load_configuration(configuration)
    end
end

local function load_configurations_async(configurations)
    for _, configuration in ipairs(configurations) do
        vim.defer_fn(function()
            load_configuration(configuration)
        end, 50)
    end
end


--  加载配置
load_configurations({
    "options", -- 一些选项
    "lazycfg", -- lazy.nvim
    "autocmds" -- 自动命令
})
--  异步加载配置
load_configurations_async({
    "normal-mappings", -- 按键映射
    "colorscheme"
})

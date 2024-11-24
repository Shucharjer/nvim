--  使用lazy.nvim作为插件管理器
--  当前前提是确保它的存在，然后再去使用它

local update_config = {
    channel = "stable",
    snapshot_file = "lazy_snapshot.lua"
}

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local is_first_startup = not vim.uv.fs_stat(lazypath)

--  从GitHub克隆lazy
local function git_clone_lazy(lazypath)
    local output = vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })

    if vim.api.nvim_get_vvar("shell_error") ~= 0 then
        vim.api.nvim_err_writeln(
            "Error cloning lazy.nvim repository from GitHub" .. output
        )
    end
end

local function merge_configs(...)
    local result = {}
    for _, config in ipairs({ ... }) do
        vim.list_extend(result, config)
    end

    return result
end

local function get_lazy_spec()
    local basic = require("plugins.basic")
    local lsp = require("plugins.dev")
    local debug = require("plugins.debug")
    local extends = require("plugins.extends")

    return merge_configs(basic, lsp, debug, extends)
end

local function startup(lazypath)
    --  获取配置表
    local spec = get_lazy_spec()

    --  将lazy的路径添加到运行时路径
    vim.opt.rtp:prepend(lazypath)

    --  通过lazy启动配置
    require("lazy").setup({
        spec,
        -- performance = {
        -- rtp = {
        -- -- Disable unnecessary nvim features to speed up startup.
        -- disabled_plugins = {
        -- "tohtml",
        -- "gzip",
        -- "zipPlugin",
        -- "netrwPlugin",
        -- "tarPlugin",
        -- },
        -- },
        -- },
        -- -- Enable luarocks if installed.
        -- rocks = { enabled = vim.fn.executable("luarocks") == 1 },
        -- -- We don't use this, so create it in a disposable place.
        -- lockfile = vim.fn.stdpath("cache") .. "/lazy-lock.json",
    })
end

--  如果是第一次启动
--  克隆lazy.nvim插件管理器
--  安装插件
if is_first_startup then
    git_clone_lazy(lazypath)
    vim.notify("Please wait while plugins are installings...")
end

--  启动
startup(lazypath)

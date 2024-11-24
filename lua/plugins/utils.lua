--  This file contains some functions
--      that would be called by other scripts


local M = {}

--  Is a plugin is available
function M.is_available(plugin)
    local lazy_config_avail, lazy_config = pcall(require, "lazy.core.config")
    return lazy_config_avail and lazy_config.spec.plugins[plugin] ~= nil
end

-- Is the buf a big file
function M.is_big_file(bufnr)
    if bufnr == nil then bufnr = 0 end
    local filesize = vim.fn.getfsize(vim.api.nvim_buf_get_name(bufnr))
    local nlines = vim.api.nvim_buf_line_count(bufnr)
    local is_big_enough = (filesize > vim.g.big_file.size)
        or (nlines > vim.g.big_file.lines)
    return is_big_enough
end

function M.inorekey(key, opt, desc)
    vim.keymap.set("i", key, opt, { noremap = true, silent = true, desc = desc })
end

function M.norekey(key, opt, desc)
    vim.keymap.set("n", key, opt, { noremap = true, silent = true, desc = desc })
end

function M.xnorekey(key, opt, desc)
    vim.keymap.set("x", key, opt, { noremap = true, silent = true, desc = desc })
end

return M

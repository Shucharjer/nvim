local M = {}

local virtual_mode = false

function M.word()
    local mode = vim.api.nvim_get_mode()
    if not mode.blocking then
        if mode.mode == 'n' then
            virtual_mode = true
        elseif mode.mode == 'v' then
            if virtual_mode then
            else
            end
        end
    end
end

function M.b()
    local mode = vim.api.nvim_get_mode()
    if not mode.blocking then
        if mode.mode == 'n' then
            virtual_mode = true
        elseif mode.mode == 'v' then

        end
    end
end

return M

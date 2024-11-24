if vim.g.neovide then
    -- 透明
    vim.g.transparency = 0.7
    vim.g.neovide_transparency = vim.g.transparency
    vim.o.winblend = 70
    vim.o.pumblend = 70

    -- 字体
    vim.o.guifont = "0xProto Nerd Font Mono:h16"
    vim.g.neovide_window_blurred = true
    vim.opt.linespace = 0
    vim.g.neovide_hide_mouse_when_typing = false
    vim.g.neovide_remember_window_size = false

    --  动画
    vim.g.neovide_scroll_animation_length = 0.10
    vim.g.neovide_position_animation_length = 0.10
    vim.g.neovide_cursor_animation_length = 0.05
    --vim.g.neovide_cursor_trail_size = 0.8
    vim.g.neovide_cursor_antialiasing = true
    --vim.g.neovide_cursor_vfx_mode = "pixiedust"
    vim.g.neovide_cursor_vfx_opacity = 200.0
    vim.g.neovide_cursor_vfx_particle_lifetime = 1.2
    vim.g.neovide_cursor_vfx_particle_density = 15.0
    vim.g.neovide_cursor_vfx_particle_speed = 10.0
    vim.keymap.set("n", "<A-CR>",
        function() vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen end,
        { silent = true } )
end
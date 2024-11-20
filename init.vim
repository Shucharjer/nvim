call plug#begin()
Plug 'nvim-lua/plenary.nvim'
" Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/nvim-cmp'
Plug 'nvimdev/lspsaga.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'HiPhish/rainbow-delimiters.nvim'
Plug 'numToStr/Comment.nvim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -G Ninja -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release' }
Plug 'nvim-telescope/telescope-live-grep-args.nvim'
Plug 'nvim-telescope/telescope-dap.nvim'
" Plug 'fannheyward/telescope-coc.nvim'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'wakatime/vim-wakatime'
Plug 'Mofiqul/vscode.nvim'
Plug 'mfussenegger/nvim-dap'
Plug 'nvim-neotest/nvim-nio'
Plug 'rcarriga/nvim-dap-ui'
Plug 'theHamsta/nvim-dap-virtual-text'
Plug 'tpope/vim-fugitive', { 'on': 'Git' }
Plug 'folke/todo-comments.nvim'
Plug 'danymat/neogen', { 'on': 'Neogen' }
Plug 'nvim-tree/nvim-web-devicons'
Plug 'akinsho/bufferline.nvim', { 'tag': '*' }
Plug 'Civitasv/cmake-tools.nvim'
Plug 'AllenDang/nvim-expand-expr'
Plug 'MunifTanjim/nui.nvim'
Plug 'rcarriga/nvim-notify'
Plug 'folke/noice.nvim'
Plug 'chrisgrieser/nvim-early-retirement'
Plug 'OXY2DEV/markview.nvim'
Plug 'richardbizik/nvim-toc'
Plug 'arminveres/md-pdf.nvim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'tpope/vim-repeat'
Plug 'ggandor/leap.nvim'
call plug#end()
 
 
colorscheme vscode
if exists("g:neovide")
    let g:transparency = 0.7
    let g:neovide_transparency = g:transparency
    set winblend=70
    set pumblend=70
    let g:neovide_cursor_animation_length = 0.05
    let g:neovide_position_animation_length = 0.10
    let g:neovide_scroll_animation_length = 0.10
    let g:neovide_cursor_vfx_mode="" " railgun torpedo pixiedust
    let g:neovide_refresh_rate = 144
    let g:neovide_refresh_rate_idle = 30
    let g:neovide_hide_mouse_when_typeing = v:true
    let g:neovide_window_blurred = v:true
    set guifont=0xProto\ Nerd\ Font\ Mono:h16
    noremap <silent> <A-CR> :let g:neovide_fullscreen = !g:neovide_fullscreen<CR>
    function! ChangeScaleFactor(delta)
        let g:neovide_scale_factor = g:neovide_scale_factor * a:delta
    endfunction
    nnoremap <silent> <expr><C-+> ChangeScaleFactor(1.25)<CR>
    nnoremap <silent> <expr><C--> ChangeScaleFactor(0.80)<CR>
endif
highlight Normal ctermbg=NONE guibg=NONE
highlight NonText ctermbg=NONE guibg=NONE
highlight LineNr ctermbg=NONE guibg=NONE
highlight CurosrLineNr ctermbg=NONE guibg=NONE
highlight SignColumn ctermbg=NONE guibg=NONE
highlight Folded guibg=NONE ctermbg=NONE
highlight FoldColumn guibg=NONE ctermbg=NONE
highlight DiffAdd guibg=NONE ctermbg=NONE
highlight DiffChange guibg=NONE ctermbg=NONE
highlight DiffDelete guibg=NONE ctermbg=NONE
highlight DiffText guibg=NONE ctermbg=NONE
highlight DiffAdded ctermbg=NONE guibg=NONE
highlight DiffRemoved ctermbg=NONE guibg=NONE
highlight TabLineFill ctermbg=NONE guibg=NONE
highlight ModeMsg ctermbg=NONE guibg=NONE
highlight MoreMsg ctermbg=NONE guibg=NONE
highlight NvimTreeNormal ctermbg=NONE guibg=NONE
highlight NvimTreeOpenedFolderName ctermbg=NONE guibg=NONE
highlight BufferLineFill ctermbg=NONE guibg=NONE
highlight NvimTreeCurosrLine ctermbg=NONE guibg=NONE
highlight NvimTreeEndOfBuffer ctermbg=NONE guibg=NONE
highlight NeoTreeCursorLine ctermbg=NONE guibg=NONE
highlight NeoTreeDimText ctermbg=NONE guibg=NONE
highlight NeoTreeFileNameOpened ctermbg=NONE guibg=NONE
highlight Directory ctermbg=NONE guibg=NONE
highlight WarningMsg ctermbg=NONE guibg=NONE
highlight Conceal ctermbg=NONE guibg=NONE
highlight VertSplit ctermbg=NONE guibg=NONE
highlight WinBar ctermbg=NONE guibg=NONE
highlight WinBarNc ctermbg=NONE guibg=NONE
highlight TabLineSel ctermbg=NONE guibg=NONE
highlight BufferCurrent ctermbg=NONE guibg=NONE
highlight BufferCurrentIndex ctermbg=NONE guibg=NONE
highlight BufferCurrentMod ctermbg=NONE guibg=NONE
highlight BufferCurrentSign ctermbg=NONE guibg=NONE
highlight BufferCurrentTarget ctermbg=NONE guibg=NONE
highlight BufferVisible ctermbg=NONE guibg=NONE
highlight BufferVisibleIndex ctermbg=NONE guibg=NONE
highlight BufferVisibleMod ctermbg=NONE guibg=NONE
highlight BufferVisibleSign ctermbg=NONE guibg=NONE
highlight BufferVisibleTarget ctermbg=NONE guibg=NONE
highlight NormalFloat ctermbg=NONE guibg=NONE
highlight CocFloating ctermbg=NONE guibg=NONE
highlight Pmenu ctermbg=NONE guibg=NONE



lua << EOF
local on_attach = function(client, bufnr)
    if client.server_capabilities.documentSymbolsProvider then
        -- require("nvim-navic").attach(client, bufnr)
        -- require("nvim-navbuddy").attach(client, bufnr)
    end
end
local lspconfig = require("lspconfig")
lspconfig.clangd.setup{
    on_attach = on_attach,
    cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--completion-style=detailed",
        "--function-arg-placeholders=false",
        "--suggest-missing-includes",
        "-j=12",
        "--pch-storage=memory"
    },
    filetypes = { "h", "c", "hpp", "cpp", "objc", "objcpp" }
}
require("lspsaga").setup{
    diagnostic = {
        quit = "q"
    },
    code_action = {
        keys = {
            quit = "q",
        },
    },
    finder = {
        keys = {
            close = "Q",
            quit = "q",
        }
    },
    definition = {
        keys = {
            edit = "e",
            close = "Q",
            quit = "q",
        },
    },
    rename = {
        auto_save = false,
        in_select = false,
        keys = {
            select = "x",
            exec = "<CR>",
            quit = "q",
        },
    },
    outline = {
        keys = {
            toggle_or_jump = "o",
            quit = "q",
            jump = "g",
        },
    },
    callhierarchy = {
        keys = {
            edit = "e",
            split = "s",
            vsplit = "S",
            close = "Q",
            quit = "q",
        },
    },
    typehierarchy = {
        keys = {
            split = "s",
            vsplit = "S",
            close = "Q",
            quit = "q",
        },
    },
}
local cmp = require("cmp")
cmp.setup{
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
            if cmp.visible() then
                cmp.confirm({select = true})
            else
                fallback()
            end
        end
        ),
        ["<C-j>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end
        ),
        ["<C-k>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else fallback()
            end
        end
        ),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
        { name = 'buffer' },
    })
}
vim.api.nvim_create_autocmd('BufWritePre', {
    callback = function()
        vim.lsp.buf.format {
            async = true
        }
    end,
})
require("nvim-treesitter.configs").setup{
    ensure_installed = {
        "json", "vim", "lua", "c", "cpp", "markdown", "markdown_inline",
        "html", "latex"
    },
    sync_install = false,
    auto_install = true,
    ignore_install = { "java" },
    highlight = {
        enable = true,
        disable = {},
    }
}
local dap = require("dap")
dap.adapters.lldb = {
    type = "server",
    port = "${port}",
    executable = {
        command = "C:/Users/25922/.vscode/extensions/vadimcn.vscode-lldb-1.11.0/adapter/codelldb",
        args = { "--port", "${port}" },
        detached = false,
    }
}
dap.configurations.cpp = {
    {
        name = "Launch",
        type = "lldb",
        request = "launch",
        program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
    },
}
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
local dapui = require("dapui")
dapui.setup()
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
require("nvim-dap-virtual-text").setup{}
local actions = require "telescope.actions"
local fb_actions = require("telescope").extensions.file_browser.actions
local telescope_config = {
    layout_strategy = "horizontal",
    layout_config = {
        horizontal = {
            prompt_position = "top",
            preview_width = 0.50,
        },
    },
    file_ignore_patterns = {
        "node_modules",
        ".git",
        "dist",
        "build"
    },
    defaults = {
        mappings = {
            i = {
                ["<C-c>"] = actions.close,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-o>"] = actions.select_default,
                ["<C-i>"] = actions.toggle_selection,
                ["<C-a>"] = actions.select_all,
            },
            n = {
                ["<C-c>"] = actions.close,
                ["o"] = actions.select_default,
                ["i"] = actions.toggle_selection,
                ["a"] = actions.select_all,
            }
        }
    },
    extensions = {
        file_browser = {
            -- disable netr and use telescope-file-browser
            hijack_netrw = true,
            depth = -1,
            auto_depth = true,
            ignore = {
                "build",
                "node_modules",
                ".git",
            },
            mappings = {
                ["i"] = {
                    ["<C-n>"] = fb_actions.create,
                    ["<C-f>"] = fb_actions.create_from_prompt,
                    ["<C-d>"] = fb_actions.remove,
                    ["<C-r>"] = fb_actions.rename,
                    ["<C-m>"] = fb_actions.move,
                    ["<C-h>"] = fb_actions.goto_cwd,
                    ["<A-h>"] = fb_actions.goto_home_dir,
                    ["<C-p>"] = fb_actions.goto_parent_dir,
                },
                ["n"] = {
                    ["n"] = fb_actions.create,
                    ["f"] = fb_actions.create_from_prompt,
                    ["d"] = fb_actions.remove,
                    ["r"] = fb_actions.rename,
                    ["m"] = fb_actions.move,
                    ["h"] = fb_actions.goto_cwd,
                    ["H"] = fb_actions.goto_home_dir,
                    ["p"] = fb_actions.goto_parent_dir,
                },
            },
        },
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
        },
        live_grep_args = {
            auto_quoting = true,
        },
    },
}
if vim.g.neovide then
    telescope_config.defaults.winblend = vim.g.transparency * 100
end
require("telescope").setup(telescope_config)
require("telescope").load_extension("file_browser")
require("telescope").load_extension("fzf")
require("telescope").load_extension("live_grep_args")
require("telescope").load_extension("dap")
-- require("telescope").load_extension("coc")
require'neogen'.setup{ enabled = true, languages = { ['cpp.dexygen'] = require('neogen.configurations.cpp') }, input_after_generated = true }
require("early-retirement").setup{
    retirementAgeMins = 30,
    ignoredFileTypes = {},
    ignoreFilenamePattern = "",
    minimumBufferNum = 5,
    notificationOnAutoClose = true,
    ignoreUnsavedChangesBufs = true,
    ignoreSpecialBuftypes = true,
    ignoreVisibleBufs = true,
    ignoreUnloadedBufs = false,
    deleteBufferWhenFileDeleted = false,
}
require("bufferline").setup{
    options = {
        indicator = {
            icon = '▎',
            style = "icon",
        },
    },
}
require('Comment').setup{}
require('cmake-tools').setup{
    cmake_command = "cmake",
    ctest_command = "ctest",
    cmake_use_preset = false,
    cmake_generate_on_save = true,
    cmake_generate_options = {
        "-DCMAKE_TOOLCHAIN_FILE=C:/vcpkg/scripts/buildsystems/vcpkg.cmake",
        "-DCMAKE_C_COMPILER=clang",
        "-DCMAKE_CXX_COMPILER=clang++",
        "-G Ninja"
    },
    cmake_build_options = {},
    cmake_build_directory = "build",
    cmake_kits_path = nil,
    cmake_build_type = "Debug",
    cmake_virtual_text_support = true,
    build_args = {
        "-j8",
    }
}
require("notify").setup{ background_colour = "#000000" }
require("noice").setup{
    cmdline = {
        enabled = true,
        -- "cmdline_popup" is still a bit too high-profile
        -- "cmdline"
        view = "cmdline_popup",
    },
    lsp = {
        override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
        },
    },
}
require("markview").setup{}
require("nvim-toc").setup{ toc_header = "Table of Contents" }
require("md-pdf").setup{}
require("nvim-autopairs").setup{}
require'todo-comments'.setup{signs = true, sign_priority = 8, keywords = { TODO = { color = "info" } }, highlight = { multiline = true, comments_only = true }}
EOF



" set virtualedit=all
set shadafile=""
set noswapfile
set nobackup
set nowritebackup
set number
set relativenumber
" set cursorline
set scrolloff=3
set sidescrolloff=0
set textwidth=100
set nowrap
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set expandtab
set backspace=indent,eol,start
filetype plugin indent on
set encoding=UTF-8
set clipboard+=unnamed,unnamedplus
set updatetime=300
set timeout
set timeoutlen=500
syntax enable
set mouse=a
noremap <silent> <C-s> :lua vim.lsp.buf.format()<CR>:w<CR>
inoremap <silent> <C-s> <Esc>:lua vim.lsp.buf.format()<CR>:w<CR>
vnoremap <silent> <C-s> <Esc>:lua vim.lsp.buf.format()<CR>:w<CR>
xnoremap <silent> <C-s> <Esc>:lua vim.lsp.buf.format()<CR>:w<CR>
inoremap <silent> jk <Esc>
vnoremap <silent> jk <Esc>
xnoremap <silent> jk <Esc>
noremap <silent> nh :noh<CR>
inoremap <silent> <C-z> <Esc>ui
noremap rp :%s/
function! SaveCursorPosition()
    let b:save_cursor_pos = getpos('.')
endfunction
noremap <silent> cs :call SaveCursorPosition()<CR>
function! RestoreCursorPosition()
    if exists('b:save_cursor_pos')
        call setpos('.', b:save_cursor_pos)
    endif
endfunction
noremap <silent> cr :call RestoreCursorPosition()<CR>
inoremap <silent> <C-l> <Esc>:b#<CR>a
noremap <silent> <C-l> :b#<CR>
noremap <silent> bD :bd<CR>
noremap bd :bd 
let g:loaded_perl_provider = 0
let g:python3_host_prog = "C:/ProgramData/chocolatey/bin/python3.12.exe"
let g:airline_theme = 'transparent'
let g:airline_powerline_fonts = 1
" noremap <silent> <C-n> :NERDTreeToggle<CR>
noremap <silent> ff :Telescope find_files<CR>
noremap <silent> bf :Telescope buffers<CR>
noremap <silent> fb :Telescope file_browser<CR>
noremap <silent> fp :Telescope current_buffer_fuzzy_find<CR>
noremap <silent> fo :Telescope oldfiles<CR>
noremap <silent> sh :Telescope search_history<CR>
noremap <silent> fg :Telescope live_grep<CR>
noremap <silent> fG :Telescope live_grep_args<CR>
noremap <silent> JL :Telescope jumplist<CR>
noremap <silent> gs :Telescope git_status<CR>
noremap <silent> gb :Telescope git_branches<CR>

" noremap <silent> rc :CocRestart<CR>
" inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#confirm() : "\<TAB>"
" inoremap <silent><expr> <C-j> coc#pum#visible() ? coc#pum#next(1) : "\<C-j>"
" inoremap <silent><expr> <C-k> coc#pum#visible() ? coc#pum#prev(1) : "\<C-k>"
" function! ShowHoverInfo()
"     if CocAction('hasProvider', 'hover')
"         call CocActionAsync('definitionHover')
"     endif
" endfunction
" noremap <silent> cif :call ShowHoverInfo()<CR>
" autocmd CursorHold * silent call CocActionAsync('highlight')
" nmap <silent> rn <Plug>(coc-rename)
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-reference)
" nmap <silent> g[ <Plug>(coc-diagnostic-prev)
" nmap <silent> g] <Plug>(coc-diagnostic-next)
" xmap <silent> if <Plug>(coc-funcobj-i)
" omap <silent> if <Plug>(coc-funcobj-i)
" xmap <silent> af <Plug>(coc-funcobj-a)
" omap <silent> af <Plug>(coc-funcobj-a)
" xmap <silent> ic <Plug>(coc-classobj-i)
" omap <silent> ic <Plug>(coc-classobj-i)
" xmap <silent> ac <Plug>(coc-classobj-a)
" omap <silent> ac <Plug>(coc-classobj-a)
" noremap <silent> sl :CocList symbols<CR>
" noremap <silent> fd :Telescope coc diagnostics<CR>
" noremap <silent> fD :Telescope coc workspace_diagnostics<CR>
" xnoremap <silent> fm <Plug>(coc-format-selected)
" noremap <silent> rf <Plug>(coc-codeaction-refactor)
" xnoremap <silent> rf <Plug>(coc-codeaction-refactor-selected)
" noremap <silent> th :CocCommand clangd.switchSourceHeader<CR>

noremap <silent> Ks :LspStart<CR>
noremap <silent> Kr :LspRestart<CR>
nmap <silent> rn :Lspsaga rename<CR>
nmap <silent> gt :Lspsaga peek_type_definition<CR>
nmap <silent> gT :Lspsaga goto_type_definition<CR>
nmap <silent> gd :Lspsaga peek_definition<CR>
nmap <silent> gD :Lspsaga goto_definition<CR>
noremap <silent> ga :Lspsaga outline<CR>
noremap <silent> gp :Lspsaga supertupes<CR>
noremap <silent> gP :Lspsaga subtypes<CR>
noremap <silent> Dn :Lspsaga diagnostic_jump_next<CR>
noremap <silent> Dp :Lspsaga diagnostic_jump_prev<CR>
noremap <silent> Dw :Lspsaga show_workspace_diagnostics<CR>
noremap <silent> Db :Lspsaga show_buf_diagnostics<CR>
noremap <silent> Dl :Lspsaga show_line_diagnostics<CR>
noremap <silent> Dc :Lspsaga show_cursor_diagnostics<CR>
noremap <silent> cif :Lspsaga hover_doc<CR>
noremap <silent> th :ClangdSwitchSourceHeader<CR>
noremap <silent> fm :lua vim.lsp.buf.format()<CR>

noremap <silent> ms :CMakeSettings<CR>
noremap <silent> mg :CMakeGenerate<CR>
noremap <silent> mG :CMakeGenerate!<CR>
noremap <silent> mb :CMakeBuild<CR>
noremap <silent> mB :CMakeBuild!<CR>
noremap <silent> mt :CMakeSelectBuildTarget<CR>
noremap <silent> mc :CMakeClean<CR>
noremap <silent> wa :WakaTimeToday<CR>
noremap <silent> ng :Neogen<CR>
noremap <silent> dB :lua require'dap'.toggle_breakpoint()<CR>
" noremap <silent> <F5> :lua require'dap'.continue()<CR>
" noremap <silent> <F10> :lua require'dap'.step_over()<CR>
" noremap <silent> <F11> :lua require'dap'.step_into()<CR>
" noremap <silent> <S-F11> :lua require'dap'.step_out()<CR>
noremap <silent> dC :lua require'dap'.continue()<CR>
noremap <silent> do :lua require'dap'.step_over()<CR>
noremap <silent> dI :lua require'dap'.step_into()<CR>
noremap <silent> dO :lua require'dap'.step_out<CR>
noremap <silent> dE :lua require'dap'.terminate()<CR>
noremap <silent> dL :lua require'dap'.run_last()<CR>
noremap <silent> fc :Telescope dap commands<CR>
noremap <silent> fB :Telescope dap list_breakpoints<CR>
noremap <silent> dC :lua require'dapui'.close()<CR>
noremap <silent> dO :lua require'dapui'.open()<CR>
noremap <silent> dT :lua require'dapui'.toggle()<CR>
noremap <silent> bn :BufferLineCycleNext<CR>
noremap <silent> bv :BufferLineCyclePrev<CR>
noremap <silent> ex :lua require("expand_expr").expand()<CR>
noremap <silent> ml :lua require("nvim-toc").generate_md_toc("list")<CR>
noremap <silent> mn :lua require("nvim-toc").generate_md_toc("numbered")<CR>

noremap <silent> s <Plug>(leap-forward)
noremap <silent> S <Plug>(leap-backward)

set foldenable
set foldmethod=expr
set foldlevelstart=99
set foldexpr=nvim_treesitter#foldexpr()




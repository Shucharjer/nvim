--  一些选项


-- Theme
-- vim.g.default_colorscheme = "default"

-- Options
vim.opt.breakindent = false                             -- Wrap indent to match line start.
--  使用系统剪贴板
vim.opt.clipboard = "unnamedplus"                       -- Connection to the system clipboard.
vim.opt.cmdheight = 0                                   -- Hide command line unless needed.
vim.opt.completeopt = { "menu", "menuone", "noselect" } -- Options for insert mode completion.
vim.opt.copyindent = true                               -- Copy the previous indentation on autoindenting.
--  如果希望光标所在的那一行比较醒目，把下面一行的注释取消掉
-- vim.opt.cursorline = true -- Highlight the text line of the cursor.
vim.opt.expandtab = true          -- Enable the use of space in tab.
vim.opt.fileencoding = "utf-8"    -- File content encoding for the buffer.
vim.opt.fillchars = { eob = " " } -- Disable `~` on nonexistent lines.
vim.opt.foldenable = true         -- Enable fold for nvim-ufo.
vim.opt.foldlevel = 99            -- set highest foldlevel for nvim-ufo.
vim.opt.foldlevelstart = 99       -- Start with all code unfolded.
--  左侧不显示缩进信息
vim.opt.foldcolumn = "0"          -- Show foldcolumn in nvim 0.9+.
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.ignorecase = true           -- Case insensitive searching.
vim.opt.infercase = true            -- Infer cases in keyword completion.

vim.opt.laststatus = 3              -- Global statusline.
vim.opt.linebreak = true            -- Wrap lines at 'breakat'.
vim.opt.number = true               -- Show numberline.
vim.opt.preserveindent = true       -- Preserve indent structure as much as possible.
vim.opt.pumheight = 10              -- Height of the pop up menu.
--  使用相对行号
vim.opt.relativenumber = true       -- Show relative numberline.
vim.opt.shiftwidth = 4              -- Number of space inserted for indentation.
vim.opt.showmode = false            -- Disable showing modes in command line.
vim.opt.showtabline = 4             -- always display tabline.
vim.opt.signcolumn = "yes"          -- Always show the sign column.
vim.opt.smartcase = true            -- Case sensitivie searching.
vim.opt.smartindent = true          -- Smarter autoindentation.
vim.opt.splitbelow = true           -- Splitting a new window below the current one.
vim.opt.splitright = true           -- Splitting a new window at the right of the current one.
vim.opt.tabstop = 4                 -- Number of space in a tab.

vim.opt.termguicolors = true        -- Enable 24-bit RGB color in the TUI.
vim.opt.undofile = false            -- Disable persistent undo between session and reboots.
vim.opt.updatetime = 300            -- Length of time to wait before triggering the plugin.
vim.opt.virtualedit = "block"       -- Allow going past end of line in visual block mode.
vim.opt.writebackup = false         -- Disable making a backup before overwriting a file.
vim.opt.shada = "!,'1000,<50,s10,h" -- Remember the last 1000 opened files
vim.opt.history = 1000              -- Number of commands to remember in a history table (per buffer).
vim.opt.swapfile = false            -- Ask what state to recover when opening a file that was not saved.
vim.opt.wrap = true                 -- Disable wrapping of lines longer than the width of window.
--  供字符长度参考的一列
-- vim.opt.colorcolumn = "80" -- PEP8 like character limit vertical bar.
-- vim.opt.mousescroll = "ver:1,hor:0" -- Disables hozirontal scroll in neovim.
--  如果希望光标闪烁，把下面一行注释掉
-- vim.opt.guicursor = "n:blinkon200,i-ci-ve:ver25" -- Enable cursor blink.
-- 把当前文件夹当作工作文件夹还是太...
vim.opt.autochdir = false -- Use current file dir as working dir (See project.nvim).
-- 如果下面这个值非常大，会让光标始终在屏幕中央那一行
-- vim.opt.scrolloff = 1000 -- Number of lines to leave before/after the cursor when scrolling. Setting a high value keep the cursor centered.
vim.opt.scrolloff = 3
vim.opt.sidescrolloff = 8                                        -- Same but for side scrolling.
vim.opt.selection =
"old"                                                            -- Don't select the newline symbol when using <End> on visual mode.

vim.opt.viewoptions:remove "curdir"                              -- Disable saving current directory with views.
vim.opt.shortmess:append { s = true, I = true }                  -- Disable startup message.
vim.opt.backspace:append { "nostop" }                            -- Don't stop backspace at insert.
vim.opt.diffopt:append { "algorithm:histogram", "linematch:60" } -- Enable linematch diff algorithm

local is_android = vim.fn.isdirectory('/data') == 1
if is_android then vim.opt.mouse = "v" else vim.opt.mouse = "a" end -- Enable scroll for android

-- Globals --------------------------------------------------------------------
vim.g.mapleader = " "                                  -- Set leader key.
vim.g.maplocalleader = ","                             -- Set default local leader key.
vim.g.big_file = { size = 1024 * 5000, lines = 50000 } -- For files bigger than this, disable 'treesitter' (+5Mb).

vim.g.autoformat_enabled = false                       -- Enable auto formatting at start.
vim.g.autopairs_enabled = false                        -- Enable autopairs at start.
vim.g.cmp_enabled = true                               -- Enable completion at start.
vim.g.codeactions_enabled = true                       -- Enable displaying 💡 where code actions can be used.
vim.g.codelens_enabled = true                          -- Enable automatic codelens refreshing for lsp that support it.
--  Linter模式
vim.g.diagnostics_mode = 3                             -- Set code linting (0=off, 1=only show in status line, 2=virtual text off, 3=all on).
vim.g.fallback_icons_enabled = false                   -- Enable it if you need to use Neovim in a machine without nerd fonts.
vim.g.inlay_hints_enabled = false                      -- Enable always show function parameter names.
vim.g.lsp_round_borders_enabled = true                 -- Enable round borders for lsp hover and signatureHelp.
vim.g.lsp_signature_enabled = true                     -- Enable automatically showing lsp help as you write function parameters.
vim.g.notifications_enabled = true                     -- Enable notifications.
vim.g.semantic_tokens_enabled = true                   -- Enable lsp semantic tokens at start.
vim.g.url_effect_enabled = true                        -- Highlight URLs with an underline effect.



--  针对不同的运行环境的配置
require("runtime.neovide")

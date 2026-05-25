local opts = vim.opt

-- =============================================================================
-- Global 
-- =============================================================================

vim.g.mapleader = ","         -- leader key is ,
vim.g.maplocalleader = "\\"   -- local leader key is \

-- =============================================================================
-- Display 
-- =============================================================================

-- This don't super apply because we use a statusline plugin but I like backup defaults
opts.showmode = true          -- Always show current editing mode in statusline

-- Columns, colors, wrapping
opts.wrap = false             -- Don't wrap long lines, scroll
opts.scrolloff = 4            -- Keep 4 lines visible above/below cursor
opts.colorcolumn = "80,121"   -- Visual guides / rulers for 80 and 120 char width 
opts.signcolumn = "yes"       -- Always show sign column (left gutter - prevent shifting)
opts.cursorline = true        -- Highlight current line cause I'm getting older
opts.termguicolors = true     -- Enable full RFQ terminal colors

-- Relative numbers on makes number at the cursor 0, number = true makes it absolute
opts.number = true            -- Absolute line number at cursor location
opts.relativenumber = true    -- Relative line numbers around cursor, useful for line count commands

-- =============================================================================
-- Indentation 
-- =============================================================================

-- some of these are effectively backups in absence of editorconfig, formatters
opts.tabstop = 4              -- Tab width = 4 spaces
opts.shiftwidth = 4           -- Indent width for >> << ==
opts.softtabstop = 4          -- Tab/backspace keys editing width
opts.expandtab = true         -- Use spaces instead of literal tabs. I disagree but submit.
opts.autoindent = true        -- Copy indentation from current line
opts.copyindent = true        -- Attempt to preserve the existing indentation structure (other ppl files)
opts.smartindent = true       -- Attempt to preserve basic C syntax to increase/decrease indent (may delete later)
opts.shiftround = true        -- Enforce snap to shiftwidth on >> << even in files where tabstop differs from shiftwidth

-- =============================================================================
-- Search 
-- =============================================================================

opts.ignorecase = true        -- Case-insensitive search by default
opts.smartcase = true         -- Case-sensitive when uppercase is used
opts.hlsearch = true          -- Highlight search results
opts.incsearch = true         -- Show matches while typing query

-- =============================================================================
-- Files, buffers, resiliency, performance
-- =============================================================================

opts.hidden = true             -- Allow switch buffer without saving on switch
opts.undofile = true           -- Persistent undo between sessions
opts.swapfile = true           -- Enable swap files for crash recovery
opts.backup = false            -- Disable persistent backups
opts.writebackup = true        -- Enable temp backup during write 
opts.history = 1000            -- Command/search history length
opts.clipboard = "unnamedplus" -- Use system clipboard

-- =============================================================================
-- Behaviors, timings
-- =============================================================================

opts.mouse = "a"              -- Enable mouse for all modes, if you're a mouse person
opts.lazyredraw = true        -- prevent screen redraw during macro execution, faster macros
opts.updatetime = 250         -- time for mapped sequence, swap, inactivity events, faster diagnostics/completion (lsp)
opts.timeoutlen = 300         -- mapped sequence window for chained key combos <leader>f etc
opts.showmatch = true         -- Briefly jump cursor to matching opening bracket, visually verifying code structure
opts.backspace = {            -- Natural backspace behavior in insert mode 
    "indent",                      -- Backspace over indentation created by autoindent
    "eol",                         -- Backspace over EOL char, joining current line with one above 
    "start"                        -- Allow backspace over position where insert mode was entered
}
opts.completeopt = {          -- Completion menu behaviors. Not sure how I feel about this yet but messin with AI
    "menu",                        -- Display completion menu popover when completion triggered
    "menuone",                     -- Show completion popover even if only one match 
    "noselect"                     -- No preselected item in popover. Must explicitly select completion option
}

-- =============================================================================
-- Code Folding
-- =============================================================================

-- I don't really care about code folding. If I did I'd put that stuff here.
--opts.foldlevelstart = 99    -- Start with folds open
--opts.foldmethod = "expr"    -- Use expression-based folding
--opts.foldexpr = "nvim_treesitter#foldexpr()" -- Treesitter folding

-- =============================================================================
-- Splits
-- =============================================================================

opts.splitright = true        -- Veritcal splits open to the right
opts.splitbelow = true        -- Horizontal splits open below


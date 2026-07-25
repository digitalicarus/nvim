require("config.options")
require("config.keymaps")
require("config.autocommands")

-- TODO: add release versions to these so aren't just relying on lockfile hashes { src, version = vim.version.range() }

-- Install plugins
vim.pack.add({
    "https://github.com/rebelot/kanagawa.nvim",           -- colorscheme
    "https://github.com/nvim-lualine/lualine.nvim",       -- statusline
    "https://github.com/nvim-treesitter/nvim-treesitter", -- ast parsers for syntax, indentation, codecompanion dep, etc 
    "https://github.com/neovim/nvim-lspconfig",           -- IDE-like intel: type hints, find refs, goto def, completion
    "https://github.com/stevearc/conform.nvim",           -- external code formatter orchestrator, prettier for TS etc
    "https://github.com/mfussenegger/nvim-lint",          -- external linter orchestrator, optional
    "https://github.com/olimorris/codecompanion.nvim",    -- ai stuff (https://codecompanion.olimorris.dev/installation)

    --== Neotree file tree
    "https://github.com/nvim-neo-tree/neo-tree.nvim",     -- File navigation, fuzzy finder
    --++ Neotree dependencies, plenary also a codecompanion dep
    "https://github.com/nvim-lua/plenary.nvim",  
    "https://github.com/MunifTanjim/nui.nvim",
    --++ optional neotree dep, but recommended
    "https://github.com/nvim-tree/nvim-web-devicons",

    "https://github.com/brianhuster/live-preview.nvim",
});

-- Configure plugins 
require("config.plugins.colorscheme").configure()
require("config.plugins.lualine").configure()
require("config.plugins.neotree").configure()
require("config.plugins.lspconfig").configure()
require("config.plugins.conform").configure() 
require("config.plugins.codecompanion").configure() 
require("config.plugins.live-preview").configure() 


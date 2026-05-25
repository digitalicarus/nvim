require("config.options")
require("config.keymaps")
require("config.autocommands")

-- Install plugins
vim.pack.add({
    "https://github.com/rebelot/kanagawa.nvim",           -- colorscheme
    "https://github.com/nvim-mini/mini.statusline",       -- statusline 
    "https://github.com/nvim-treesitter/nvim-treesitter", -- ast parsers for syntax, indentation, etc
    "https://github.com/neovim/nvim-lspconfig",           -- IDE-like code intel: type hints, find refs, goto def, code completion
    "https://github.com/stevearc/conform.nvim",           -- external code formatter orchestrator, prettier for TS etc
    "https://github.com/mfussenegger/nvim-lint",          -- external linter orchestrator, optional
    "https://github.com/huggingface/llm.nvim",            -- ai features

    --== Neotree file tree
    "https://github.com/nvim-neo-tree/neo-tree.nvim",     -- File navigation, fuzzy finder
    --++ Neotree dependencies
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/MunifTanjim/nui.nvim",
    --++ optional neotree dep, but recommended
    "https://github.com/nvim-tree/nvim-web-devicons",
});

-- Configure plugins 
require("config.plugins.colorscheme").configure()
require("config.plugins.mini-statusline").configure()
require("config.plugins.neotree").configure()
require("config.plugins.lspconfig").configure()
require("config.plugins.conform").configure() 


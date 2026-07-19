local Module = {}

function Module.configure ()
    -- Neovim now supplies the "engine" and configuration but not the catalog
    -- So we still install lspconfig but this setup is native stuff
    -- List of configs https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md

    -- Lua
    vim.lsp.config("lua_ls", {})
    vim.lsp.enable("lua_ls")

    -- TypeScript
    vim.lsp.config("ts_ls", {})
    vim.lsp.enable("ts_ls")

    -- Python
    vim.lsp.config("pyright", {})
    vim.lsp.enable("pyright")

    -- C#
    vim.lsp.config("csharp_ls", {})
    vim.lsp.enable("csharp_ls")

    -- Markdown
    vim.lsp.config("markdown_oxide", {})
    vim.lsp.enable("markdown_oxide")

    -- Rust
    vim.lsp.config("rust_analyzer", {})
    vim.lsp.enable("rust_analyzer")

    -- Go
    vim.lsp.config("gopls", {})
    vim.lsp.enable("gopls")
    
end

return Module

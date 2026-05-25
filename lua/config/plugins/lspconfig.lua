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
    
end

return Module

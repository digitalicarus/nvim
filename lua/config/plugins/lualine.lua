local Module = {}

function Module.configure ()
    require("lualine").setup({
        options = {
            theme = "kanagawa",
        },
    })
end

return Module

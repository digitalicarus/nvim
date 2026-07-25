local Module = {}

function Module.configure ()
    require("live-preview").setup({
       dynamic_root = true 
    })
end

return Module

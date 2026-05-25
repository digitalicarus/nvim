local Module = {}

function Module.configure ()
    require("kanagawa").setup({
      transparent = true,
      theme = "wave",
    })

    vim.cmd.colorscheme("kanagawa")
end

return Module

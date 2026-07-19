local Module = {}

function Module.configure ()
    require("codecompanion").setup({
        adapters = {
            http = {
            lmstudio = function()
                return require("codecompanion.adapters").extend(
                "openai_compatible",
                {
                    env = {
                    url = "http://localhost:1234",
                    api_key = "dummy",
                    },

                    schema = {
                    model = {
                        default = "qwen3.6-35b-a3b",
                    },
                    },
                }
                )
            end,
            },
        },

        strategies = {
            chat = {
            adapter = "lmstudio",
            },
            inline = {
            adapter = "lmstudio",
            },
            cmd = {
            adapter = "lmstudio",
            },
        },
    })
end

return Module

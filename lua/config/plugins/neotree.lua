local Module = {}

local function neotree_toggle_or_open (state)
    local node = state.tree:get_node()

    if node.type == "directory" then
        require("neo-tree.sources.filesystem").toggle_directory(state, node)
    else
        vim.cmd("edit " .. node:get_id())
        require("neo-tree.command").execute({ action = "close" })
    end
end

local function neotree_cd (state)
  local node = state.tree:get_node()

  local path = node.type == "directory"
    and node:get_id()
    or vim.fn.fnamemodify(node:get_id(), ":h")

    -- relies on filesystem = { bind_to_cwd = true }, keeps neotree in sync with cwd
    vim.cmd("cd " .. vim.fn.fnameescape(path))
end

local function neotree_close_when_last_buffer ()
    vim.api.nvim_create_autocmd("BufEnter", {
      callback = function()
        local wins = vim.api.nvim_tabpage_list_wins(0)

        local has_file_buffer = false

        for _, win in ipairs(wins) do
          local buf = vim.api.nvim_win_get_buf(win)
          local ft = vim.bo[buf].filetype

          if ft ~= "neo-tree" then
            has_file_buffer = true
            break
          end
        end

        if not has_file_buffer then
          vim.cmd("quit")
        end
      end,
    })
end

local neotree_original_root = vim.fn.getcwd()
local function neotree_return_to_original_root ()
    require("neo-tree.command").execute({
        action = "show",
        source = "filesystem",
        dir = neotree_original_root,
      })
end


function Module.configure () 
    neotree_close_when_last_buffer()
    require("neo-tree").setup({
        filesystem = {
            sources = {
                "filesystem",
                --"git_status", -- show git status indicators alongside files 
                "buffers",
            },
            bind_to_cwd = true, -- track actual cd in neovim :cd etc
            filtered_items = {
                --== not using these but want to remember them
                -- visible = true, -- show all hidden files, overrides detailed settings below
                -- hide_gitignored = false,
                hide_dotfiles = false,
                hide_by_name = { ".git", ".DS_Store" },
            },
            follow_current_file = {
                enabled = true, -- zoom selection to current active buffer
                --leave_dirs_open = false,
            },
            hijack_netrw_behavior = "open_default",
            window = {
                position = "left",
                --width = 40,
                mappings = {
                    --== no neotree fuzzy search on /, normal vim buffer search
                    ["/"] = "noop",  

                    --== ctrl-f is fuzzy find cause we are normal ppl, use arrows for nav
                    ["<C-f>"] = "fuzzy_finder",

                    --== I don't like these single keystroke commands
                    ["."] = "noop", 
                    ["c"] = "noop",
                    ["d"] = "noop",
                    ["r"] = "noop", 
                    ["m"] = "noop", 

                    --== use double char commands instead
                    ["cc"] = "copy", 
                    ["dd"] = "delete",
                    ["rr"] = "rename",
                    ["mm"] = "move",

                    --== tree navigations
                    ["<space>"] = "toggle_node",
                    ["<cr>"] = neotree_toggle_or_open,

                    [".."] = "navigate_up",                   -- go up
                    ["cd"] = neotree_cd,                      -- go in 
                    ["hh"] = neotree_return_to_original_root, -- go home - original cwd
                },
            },
        },
    })
    vim.keymap.set("n", "<leader>n", ":Neotree reveal toggle<CR>", { noremap = true, silent = true })
end

return Module

# Digitalicarus' Neovim setup

My personal Neovim setup. It uses native vim.pack features instead of any 3rd party plugin management.
Everything you need to see is in or included in init.lua, as it should be in Neovim.

**To use this repo:**
```
git clone <repo> ~/.config/nvim
```
Bob = your uncle

## Philosophy of this stack

**Is**
- use native Neovim capabilities wherever possible
- minimal abstractions
- fast startup
- low maintenance
- terminal-first
- preserve classic vim/nvim ergonomics

**Is Not**
- full IDE emulation
- plugin maximalism
- lazy-load complexity
- ui-heavy workflows, tui windows, etc

**Plugin selection principles**
- replaces large amounts of older vimscript
- integrates cleanly with Neovim primitives
- small and maintainable
- low/no ecosystem lock-in
- low/no dependencies

## File navigation

I used to use NERDTree with vim. It perodicaly has issues with Neovim. Now I use neo-tree. 
I have a custom config to toggle it and navigate it. 

I didn't like many of its default keybindings so I corrected them and augmented some behaviors:
- `<leader>n` toggles the tree and focuses the current buffer
- `..` goes up one directory
- `cd` sets the root / cwd in sync with the vim cwd
- `hh` returns to the "home" cwd established on launch
- `cc`, `dd`, `mm`, and `rr` have replaced the single keystroke versions for copy, delete, move, and rename respectively
- Enter (`<cr>`) for directories - toggle open and closed, for files opens into a buffer and toggles off the tree
- Space (`<space`) toggles directories open and closed
- `/` is normal vim search instead of fuzzy find
- `ctrl-f` is fuzzy find, arrows nav in fuzzy find (default)
- `<` and `>` defaults retained to navigate between sources (git, filesystem, open buffers)

**Note on tabs, files, & buffers** 
Native vim/neovim tabs aren't 1 file buffer per tab. They are windows / workspaces potentially with splits.
In the spirit of Neovim nativism just use the native tabs. 
They are more powerful than the file per tab mentality of modern editors.

## Code formatting

Editorconfig is the simplest layer and it is built into Neovim. 
It handles indentation style (tabs/spaces), indent size, line endings, final newline. Think: 
> "How should whitespace behave in this project?"

This is used when I don't want something fancy like prettier.

`conform.nvim` orchestrates various language-aware formatters such as Prettier, Black, Stylua, etc.
It doesn't understand code, just transforms the structure for compliance against configuration / style guide.

## AST - Syntax Highlighting

`nvim-treesitter` is used to orchestrate syntax highlighting in a way that's more sophisticated than regex.
It also can help with indentation heuristics and code folding if you care about that. I don't.

## LSP - Code understanding, code symbol navigation, language intelligence

`nvim-lspconfig` imbues Neovim with powers like errors/warnings, syntax errors, go to def, go to refs, rename synbol, etc. IDE-like junk.
`nvim-lspconfig` connects to one language server per buffer that may or may not include linting logic.

## Linting - Code quality, best practices, static analysis

`nvim-lint` - External linter orchestrator similar to how `conform.nvim` orchestrates language-aware code formatters.
It can run external linters manually or on events (save, change, etc). 

Skippable if specific LSP already has good diagnostics.

## AI tooling
`llm.nvim` TBD

## Quality of life, keymaps, misc

### Colorscheme

`kanagawa.nvim` is quite pleasing and has extensive support for Treesitter and other popular plugins.

### Keymaps

- `,` is `<leader>`
- Navigate splits with ctrl-hjkl directly instead of ctrl-w then hjkl.

### Statusline 

Using `lualine.nvim` for this. Integrates well with the kanagawa colorscheme. All lua. Good balance features and speed.

## Other interesting stuff for later maybe
- https://github.com/folke/snacks.nvim


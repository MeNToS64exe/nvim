# Neovim Config

## Requirements

- **Neovim** >= 0.10.0
- **Git**
- **Nerd Font** (for proper icon rendering)
- **Shell**: zsh 

---
## Plugins

- [**nvim-cmp**](https://github.com/hrsh7th/nvim-cmp) — Autocompletion
- [**nvim-lspconfig**](https://github.com/neovim/nvim-lspconfig) and related tools — LSP (Language Server Protocol) integration.
- [**nvim-treesitter**](https://github.com/nvim-treesitter/nvim-treesitter) — Syntax highlighting
- [**lualine.nvim**](https://github.com/nvim-lualine/lualine.nvim) — Statusline
- [**telescope.nvim**](https://github.com/nvim-telescope/telescope.nvim) — Fuzzy finder
- [**none-ls.nvim**](https://github.com/nvimtools/none-ls.nvim) — Interface for external linters and formatters
- [**gitsigns.nvim**](https://github.com/lewis6991/gitsigns.nvim) — Git integration showing changes in the sign column
- [**presence.nvim**](https://github.com/andweeb/presence.nvim) — Discord Rich Presence integration
- [**onedarkpro.nvim**](https://github.com/olimorris/onedarkpro.nvim) — Onedark Dark theme

---
## Key Mappings

**Leader key:** `\`

### General

| Key         | Mode | Action                                   |
| ----------- | ---- | ---------------------------------------- |
| `<leader>t` | `n`  | Open or focus terminal in vertical split |
### Telescope

| Key          | Mode | Action                |
| ------------ | ---- | --------------------- |
| `<leader>pf` | `n`  | Find files            |
| `<C-p>`      | `n`  | Git-tracked files     |
| `<leader>fs` | `n`  | LSP document symbols  |
| `<leader>fS` | `n`  | LSP workspace symbols |
| `<leader>fg` | `n`  | Live grep             |
### Window Navigation

| Key                  | Mode | Action              |
| -------------------- | ---- | ------------------- |
| `<A-Left> or <A-h>`  | `n`  | Move to left split  |
| `<A-Right> or <A-l>` | `n`  | Move to right split |
| `<A-Up> or <A-k>`    | `n`  | Move to upper split |
| `<A-Down> or <A-j>`  | `n`  | Move to lower split |

### LSP

| Key          | Mode | Action                    |
| ------------ | ---- | ------------------------- |
| `<leader>rn` | `n`  | Rename symbol (LSP)       |
| `<leader>e`  | `n`  | Show diagnostics in float |

### Visual Mode

- `"p"` is remapped to paste without overwriting the unnamed register.

---

## Overview 

### init.lua

- Loads keymaps, settings, and lazy.nvim configuration.
- Sets up an autocommand group to:
    - Remove trailing whitespace on save.
    - Format buffer via LSP (`none-ls`).
### mappings.lua

- Defines all key bindings as described above.
### set.lua

- Basic editor settings: tabs, clipboard, undo, etc.
- Display characters for whitespace.
- Sets shell to `/bin/zsh`
### init_lazy.lua

- Bootstraps lazy.nvim if not present
- Loads plugin spec from `MeNToS64exe.lazy`
- On `VimEnter`, checks for plugin updates


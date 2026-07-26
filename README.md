## Requirements

### Core requirements

* Neovim >= 0.11
* Git
* zsh
* Nerd Font

### Command-line tools

```bash
sudo pacman -S neovim git zsh ripgrep fd clang cmake make stylua yapf
```

Additional language servers:

* `clangd` — C and C++ language server
* `cmake-language-server` — CMake language server
* `pyright` — Python language server
* `verible-verilog-ls` — Verilog and SystemVerilog language server

CMake LSP can be installed through Mason.

Telescope uses:

* `ripgrep` for text search
* `fd` for file search

## Default LSP servers

| Server    | File types                |
| --------- | ------------------------- |
| `clangd`  | C and C++                 |
| `cmake`   | CMake                     |
| `lua_ls`  | Lua                       |
| `pyright` | Python                    |
| `verible` | Verilog and SystemVerilog |

External formatting is provided through `none-ls`.

Configured formatters:

| Tool           | Purpose              |
| -------------- | -------------------- |
| `clang-format` | C and C++ formatting |
| `stylua`       | Lua formatting       |
| `yapf`         | Python formatting    |

For C and C++ projects, `clangd` should have access to a `compile_commands.json` file.
With CMake:

```bash
cmake -S . -B build -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
ln -sfn build/compile_commands.json compile_commands.json
```

## Key mappings

The leader key is `\`.

### Telescope

| Key          | Mode   | Action                                   |
| ------------ | ------ | ---------------------------------------- |
| `<leader>ff` | Normal | Find files from the project root         |
| `<leader>fF` | Normal | Find files in the current file directory |
| `<leader>fg` | Normal | Search text in the project               |
| `<leader>fw` | Normal | Search for the word under the cursor     |
| `<leader>fb` | Normal | Show open buffers                        |
| `<leader>fr` | Normal | Show recently opened files               |
| `<leader>fs` | Normal | Search symbols in the current file       |
| `<leader>fS` | Normal | Search symbols in the current workspace  |
| `<leader>fd` | Normal | Show diagnostics                         |
| `<C-g>`      | Normal | Find Git-tracked files                   |

Inside Telescope:

| Key     | Mode            | Action                   |
| ------- | --------------- | ------------------------ |
| `<C-j>` | Insert          | Select the next item     |
| `<C-k>` | Insert          | Select the previous item |
| `j`     | Normal          | Select the next item     |
| `k`     | Normal          | Select the previous item |
| `<CR>`  | Normal / Insert | Open the selected item   |
| `<Esc>` | Normal / Insert | Close Telescope          |

Project-wide Telescope commands use the first available root:

1. root directory reported by the active LSP server;
2. Git repository root;
3. current Neovim working directory.

`<leader>fF` searches only in the directory containing the current file.

### LSP

LSP mappings are enabled only when a language server is attached to the current buffer.

| Key          | Mode            | Action                                             |
| ------------ | --------------- | -------------------------------------------------- |
| `gd`         | Normal          | Go to definition                                   |
| `gD`         | Normal          | Go to declaration                                  |
| `gr`         | Normal          | Find references                                    |
| `gi`         | Normal          | Go to implementation                               |
| `K`          | Normal          | Show documentation for the symbol under the cursor |
| `<C-k>`      | Normal          | Show function signature                            |
| `<leader>ca` | Normal / Visual | Show available code actions                        |
| `<leader>rn` | Normal          | Rename symbol                                      |
| `<leader>ch` | Normal          | Switch between C/C++ source and header             |
| `<leader>e`  | Normal          | Show diagnostic under the cursor                   |
| `<leader>q`  | Normal          | Add diagnostics to the location list               |
| `[d`         | Normal          | Go to the previous diagnostic                      |
| `]d`         | Normal          | Go to the next diagnostic                          |

Useful built-in navigation:

| Key     | Action                      |
| ------- | --------------------------- |
| `<C-o>` | Go back in the jump list    |
| `<C-i>` | Go forward in the jump list |

Example workflow:

1. Place the cursor on a function call.
2. Press `gd` to open its definition.
3. Press `<C-o>` to return.
4. Press `gr` to find all references.
5. Press `<leader>rn` to rename the symbol through LSP.

### Build and quickfix

| Key          | Mode   | Action                            |
| ------------ | ------ | --------------------------------- |
| `<leader>mm` | Normal | Run `:make`                       |
| `<leader>mq` | Normal | Open the quickfix list            |
| `<leader>mc` | Normal | Close the quickfix list           |
| `]q`         | Normal | Go to the next quickfix entry     |
| `[q`         | Normal | Go to the previous quickfix entry |

Typical usage:

1. Open Neovim in the project root.
2. Press `<leader>mm`.
3. Compilation errors are added to the quickfix list.
4. Use `]q` and `[q` to move between errors.
5. Use `<leader>mq` to open the full list.

The command executed by `<leader>mm` is controlled by the `makeprg` option.

For a regular Make project:

```vim
:set makeprg=make
```

For a CMake project, configure and build it first:

```bash
cmake -S . -B build
cmake --build build
```

If needed, `makeprg` can be changed for the current Neovim session:

```vim
:set makeprg=cmake\ --build\ build
```

### Formatting

| Key             | Mode   | Action                    |
| --------------- | ------ | ------------------------- |
| `<leader><A-l>` | Normal | Format the current buffer |
| `<leader><A-l>` | Visual | Format the selected code  |

Configured formatters:

* C and C++: `clang-format`
* Lua: `stylua`
* Python: `yapf`

Formatting is provided through `none-ls`.

### Terminal

| Key         | Mode   | Action                                         |
| ----------- | ------ | ---------------------------------------------- |
| `<leader>t` | Normal | Open or focus the terminal in a vertical split |

### Window navigation

| Key                    | Mode   | Action                         |
| ---------------------- | ------ | ------------------------------ |
| `<A-h>` or `<A-Left>`  | Normal | Move to the split on the left  |
| `<A-l>` or `<A-Right>` | Normal | Move to the split on the right |
| `<A-k>` or `<A-Up>`    | Normal | Move to the split above        |
| `<A-j>` or `<A-Down>`  | Normal | Move to the split below        |

### Visual mode

In Visual mode, `p` pastes text without replacing the unnamed register with the selected text.


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

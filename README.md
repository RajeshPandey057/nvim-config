# Neovim Configuration

This repository contains a modular, modern Neovim configuration designed for productivity, aesthetics, and extensibility. It leverages the `lazy.nvim` plugin manager for fast startup and easy plugin management, and organizes custom settings and plugins for clarity and maintainability.

## Directory Structure

- `init.lua` — Main entry point, bootstraps plugin manager and loads all modules/plugins.
- `lua/core/` — Core configuration files:
  - `keymaps.lua` — Custom keybindings for efficient navigation and editing.
  - `options.lua` — Editor options and settings.
- `lua/plugins/` — Individual plugin configurations (one file per plugin):
  - `alpha.lua` — Dashboard/start screen.
  - `autocomplete.lua` — Autocompletion setup.
  - `bufferline.lua` — Buffer/tab management.
  - `colortheme.lua` — Colorscheme and theme settings.
  - `comment.lua` — Commenting utilities.
  - `debug.lua` — Debugging tools.
  - `gitsigns.lua` — Git integration and signs.
  - `indent-blankline.lua` — Indentation guides.
  - `lsp.lua` — Language Server Protocol setup.
  - `lualine.lua` — Statusline configuration.
  - `mini.lua` — Mini.nvim plugin settings.
  - `misc.lua` — Miscellaneous plugin configs.
  - `neotree.lua` — File explorer/tree.
  - `noice.lua` — UI/notifications enhancements.
  - `none-ls.lua` — Null-ls integration for formatting/linting.
  - `toggleterm.lua` — Terminal integration.
  - `telescope.lua` — Fuzzy finder and picker.
  - `treesitter.lua` — Syntax highlighting and parsing.

## Plugin Management

Uses [lazy.nvim](https://github.com/folke/lazy.nvim) for plugin management. Plugins are defined in `init.lua` and loaded from the `lua/plugins/` directory.

## Installation

1. **Clone this repository:**
   ```sh
   git clone https://github.com/RajeshPandey057/nvim-config ~/.config/nvim
   ```
2. **Open Neovim:**
   ```sh
   nvim
   ```
   The config will automatically bootstrap `lazy.nvim` and install all plugins.
3. **Check plugin status:**
   - Run `:Lazy` inside Neovim to view/manage plugins.
   - Use `:Lazy update` to update plugins.

## Customization

- **Keymaps:** Defined in `lua/core/keymaps.lua`.
- **Options:** Editor settings in `lua/core/options.lua`.
- **Add plugins:** Create a new file in `lua/plugins/` and add it to the `require("lazy").setup({ ... })` list in `init.lua`.

## Usage Tips

- Press `?` in the `:Lazy` menu for help.
- Use `:q` to close plugin/status windows.
- Colorscheme is set to `cyberdream` by default (can be changed in `init.lua`).
- Automatic plugin update checking is enabled.

## Troubleshooting

- If plugins do not install, check your internet connection and ensure `git` is installed.
- For errors during startup, review messages in Neovim and check the relevant config file in `lua/core/` or `lua/plugins/`.

## Credits

- [lazy.nvim](https://github.com/folke/lazy.nvim) for plugin management
- All plugin authors listed in the `lua/plugins/` directory

## Keymaps

Below are the custom key mappings defined in `lua/core/keymaps.lua`:

| Mode | Key          | Action/Command              | Description                       |
| ---- | ------------ | --------------------------- | --------------------------------- |
| n/v  | `<Space>`    | `<Nop>`                     | Disable default spacebar behavior |
| n    | `<C-s>`      | `:w`                        | Save file                         |
| n    | `<leader>sn` | `:noautocmd w`              | Save file without auto-formatting |
| n    | `<C-q>`      | `:q`                        | Quit file                         |
| n    | `x`          | `"_x`                       | Delete character without yanking  |
| n    | `<C-d>`      | `<C-d>zz`                   | Scroll down and center            |
| n    | `<C-u>`      | `<C-u>zz`                   | Scroll up and center              |
| n    | `n`          | `nzzzv`                     | Find next and center              |
| n    | `N`          | `Nzzzv`                     | Find previous and center          |
| n    | `<Up>`       | `:resize -2`                | Resize window up                  |
| n    | `<Down>`     | `:resize +2`                | Resize window down                |
| n    | `<Left>`     | `:vertical resize -2`       | Resize window left                |
| n    | `<Right>`    | `:vertical resize +2`       | Resize window right               |
| n    | `<Tab>`      | `:bnext`                    | Next buffer                       |
| n    | `<S-Tab>`    | `:bprevious`                | Previous buffer                   |
| n    | `<leader>x`  | `:bdelete!`                 | Close buffer                      |
| n    | `<leader>b`  | `:enew`                     | New buffer                        |
| n    | `<leader>v`  | `<C-w>v`                    | Split window vertically           |
| n    | `<leader>h`  | `<C-w>s`                    | Split window horizontally         |
| n    | `<leader>se` | `<C-w>=`                    | Equalize split windows            |
| n    | `<leader>xs` | `:close`                    | Close current split window        |
| n    | `<C-k>`      | `:wincmd k`                 | Move to split above               |
| n    | `<C-j>`      | `:wincmd j`                 | Move to split below               |
| n    | `<C-h>`      | `:wincmd h`                 | Move to split left                |
| n    | `<C-l>`      | `:wincmd l`                 | Move to split right               |
| n    | `<leader>to` | `:tabnew`                   | Open new tab                      |
| n    | `<leader>tx` | `:tabclose`                 | Close current tab                 |
| n    | `<leader>tn` | `:tabn`                     | Next tab                          |
| n    | `<leader>tp` | `:tabp`                     | Previous tab                      |
| n    | `<leader>lw` | `:set wrap!`                | Toggle line wrapping              |
| v    | `<`          | `<gv`                       | Stay in indent mode               |
| v    | `>`          | `>gv`                       | Stay in indent mode               |
| v    | `p`          | `"_dP`                      | Paste without losing yanked text  |
| n    | `[d`         | `vim.diagnostic.goto_prev`  | Previous diagnostic message       |
| n    | `]d`         | `vim.diagnostic.goto_next`  | Next diagnostic message           |
| n    | `<leader>d`  | `vim.diagnostic.open_float` | Floating diagnostic message       |
| n    | `<leader>q`  | `vim.diagnostic.setloclist` | Diagnostics list                  |

## Plugin Keymaps

**Telescope**
| Mode | Key | Action/Command | Description |
|------|--------------------|-------------------------------|-----------------------------------|
| n | `<leader>sh` | `Telescope help_tags` | Search help tags |
| n | `<leader>sk` | `Telescope keymaps` | Search keymaps |
| n | `<leader>sf` | `Telescope find_files` | Search files |
| n | `<leader>ss` | `Telescope builtin` | Search Telescope builtins |
| n | `<leader>sw` | `Telescope grep_string` | Search current word |
| n | `<leader>sg` | `Telescope live_grep` | Search by grep |
| n | `<leader>sd` | `Telescope diagnostics` | Search diagnostics |
| n | `<leader>sr` | `Telescope resume` | Resume last Telescope search |
| n | `<leader>s.` | `Telescope oldfiles` | Search recent files |
| n | `<leader><leader>` | `Telescope buffers` | Find existing buffers |
| n | `<leader>/` | `Telescope current_buffer_fuzzy_find` | Fuzzy search in current buffer |
| n | `<leader>s/` | `Telescope live_grep` (open files) | Live grep in open files |

**Neo-tree**
| Mode | Key | Action/Command | Description |
|------|-------------|------------------------|----------------------------|
| n | `<leader>e` | `Neotree toggle` | Toggle file explorer |

**LSP**
| Mode | Key | Action/Command | Description |
|------|--------------------|-------------------------------|-----------------------------------|
| n | `gd` | LSP definitions | Goto definition |
| n | `gr` | LSP references | Goto references |
| n | `gI` | LSP implementations | Goto implementation |
| n | `<leader>D` | LSP type definitions | Goto type definition |
| n | `<leader>ds` | LSP document symbols | Document symbols |
| n | `<leader>ws` | LSP workspace symbols | Workspace symbols |
| n | `<leader>rn` | LSP rename | Rename symbol |
| n/x | `<leader>ca` | LSP code action | Code action |
| n | `gD` | LSP declaration | Goto declaration |
| n | `<leader>th` | Toggle inlay hints | Toggle inlay hints |
| n | `<leader>id` | Toggle inline diagnostics | Toggle inline diagnostics |
| n | `<leader>f` | Format file | Format current file |

## Autocompletion

This config uses **nvim-cmp** for autocompletion, with support for LSP, buffer, path, and snippets via LuaSnip.

**Features:**

- Completion from LSP, buffer, file paths, and snippets.
- Snippet expansion and navigation (LuaSnip).
- Icons for completion kinds.
- Customizable keymaps.

**Keymaps:**
| Mode | Key | Action/Command | Description |
|------|-------------|-------------------------------|-----------------------------------|
| i/s | `<Tab>` | Next completion/snippet field | Select next item or jump in snippet |
| i/s | `<S-Tab>` | Previous completion/snippet | Select previous item or jump back in snippet |
| i/s | `<C-n>` | Next completion item | Select next item |
| i/s | `<C-p>` | Previous completion item | Select previous item |
| i/s | `<C-y>` | Confirm completion | Accept selected completion |
| i/s | `<C-Space>` | Trigger completion menu | Manually open completion menu |
| i/s | `<C-l>` | Jump to next snippet field | Move to next snippet placeholder |
| i/s | `<C-h>` | Jump to previous snippet field| Move to previous snippet placeholder |
| i/s | `<C-b>` | Scroll docs up | Scroll documentation up |
| i/s | `<C-f>` | Scroll docs down | Scroll documentation down |

**Snippets:**

- Uses LuaSnip and [friendly-snippets](https://github.com/rafamadriz/friendly-snippets) for a wide range of language snippets.
- You can add your own snippets in Lua or load VSCode-style snippets.

**Customization:**

- Change completion sources, icons, and formatting in `lua/plugins/autocomplete.lua`.
- For more info, see [`nvim-cmp`](https://github.com/hrsh7th/nvim-cmp) and [`LuaSnip`](https://github.com/L3MON4D3/LuaSnip).

**Troubleshooting:**

- If completions/snippets don’t work, check plugin installation and ensure LSP servers are running.
- For snippet expansion, make sure LuaSnip and friendly-snippets are installed.

---

## C++ Debugging (nvim-dap)

This config supports C++ debugging using **nvim-dap** and the **codelldb** adapter (installed via mason-nvim-dap).

**Setup:**

- Make sure you have [lldb](https://lldb.llvm.org/) installed on your system.
- `codelldb` is installed automatically by Mason.
- The config for C++ debugging is in `lua/plugins/debug.lua`.

**Keymaps:**
| Key | Action |
|-------------|-----------------------|
| `<F5>` | Start/Continue |
| `<F1>` | Step Into |
| `<F2>` | Step Over |
| `<F3>` | Step Out |
| `<F7>` | Toggle DAP UI |
| `<leader>b` | Toggle Breakpoint |
| `<leader>B` | Set Conditional Breakpoint |

**Usage:**

1. Open your C++ file and compile it to an executable (e.g., `g++ main.cpp -g -o main`).
2. In Neovim, run `:Mason` and ensure `codelldb` is installed.
3. Set breakpoints with `<leader>b`.
4. Start debugging with `<F5>`. When prompted, enter the path to your executable.
5. Use `<F1>`, `<F2>`, `<F3>` to step through code. Toggle the DAP UI with `<F7>`.

**Advanced:**

- You can customize launch configurations in `lua/plugins/debug.lua`.
- For Rust, you can use the same codelldb adapter.
- See [`nvim-dap`](https://github.com/mfussenegger/nvim-dap) and [`nvim-dap-ui`](https://github.com/rcarriga/nvim-dap-ui) for more info.

**Troubleshooting:**

- If debugging doesn't start, check that your executable is compiled with debug symbols (`-g`).
- Make sure `codelldb` is installed and executable (see `:Mason`).
- For adapter errors, check the path in the config and your system's lldb installation.

---

## Terminal Integration (`toggleterm.nvim`)

This config uses [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) for seamless terminal management in Neovim.

**Features:**

- Toggle terminal with `<leader>tt`
- Supports horizontal, vertical, floating, and tab terminals
- Persistent terminal sessions
- Custom shell and appearance options

**Keymaps:**
| Mode | Key | Action/Command | Description |
|------|---------------|----------------|----------------------------|
| n | `<leader>tt` | ToggleTerm | Toggle floating terminal |
| t | `<esc>` | `<C-\><C-n>` | Exit terminal mode |
| t | `jk` | `<C-\><C-n>` | Exit terminal mode |
| t | `<C-h>` | `wincmd h` | Move to left split |
| t | `<C-j>` | `wincmd j` | Move to below split |
| t | `<C-k>` | `wincmd k` | Move to above split |
| t | `<C-l>` | `wincmd l` | Move to right split |
| t | `<C-w>` | `<C-\><C-n><C-w>` | Window command in terminal |

**Usage:**

- Press `<leader>tt` in normal mode to toggle a floating terminal.
- To close a floating terminal: press `<esc>` or `jk` to exit terminal mode, then use `:q` or click the close button in the float window.
- Use the above keymaps to navigate and exit terminal mode easily.
- Customize shell and appearance in `lua/plugins/toggleterm.lua`.
- Open multiple terminals with counts: `2<leader>tt` for terminal 2, etc.
- Use `:TermExec cmd="your_command"` to run commands in a new terminal.

**Advanced:**

- Create custom terminals for tools like lazygit, htop, etc.
- Send lines or selections to the terminal with plugin commands.
- See the [toggleterm.nvim docs](https://github.com/akinsho/toggleterm.nvim#usage) for more features.

---

## Recommended Fonts & Terminal

- **Font:** Use a Nerd Font (e.g., [FiraCode Nerd Font](https://www.nerdfonts.com/font-downloads)) for best icon support.
- **Terminal:** Set your terminal to use a Nerd Font and enable true color (export `COLORTERM=truecolor`).

---

## Quickstart

1. Install a Nerd Font and set it in your terminal.
2. Clone this repo and open Neovim.
3. Run `:Lazy` to check plugin status.
4. Use `<leader>e` to open the file explorer, `<leader>sf` to search files, and `<leader>f` to format code.

---

## Useful Resources

- [Neovim Documentation](https://neovim.io/doc/)
- [lazy.nvim](https://github.com/folke/lazy.nvim)
- [Telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [Neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim)
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [Nerd Fonts](https://www.nerdfonts.com/)

---

Feel free to fork and customize this config for your workflow!

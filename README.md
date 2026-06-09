---

```text
                                                  ▒▓▓▓▓
                                               ▒▒▓▓▓▓▓▓▓
 ██████╗ ██╗  ██╗███████╗███████╗███╗   ███╗  ▓▒▒▓▓▓▓▓▓▓▓
 ██╔══██╗██║  ██║██╔════╝██╔════╝████╗ ████║  ▒▒▓▓▓▓▒▒▒▒▓
 ██████╔╝███████║█████╗  █████╗  ██╔████╔██║   ▒▒▒▒▒▒▒▒▓
 ██╔══██╗██╔══██║██╔══╝  ██╔══╝  ██║╚██╔╝██║   ▒▓▒▒▓▓▓
 ██████╔╝██║  ██║███████╗███████╗██║ ╚═╝ ██║   ▓▓
 ╚═════╝ ╚═╝  ╚═╝╚══════╝╚══════╝╚═╝     ╚═╝ ▒▓▓
                                            ▓▓▓
                                           ▓▓▒
                                          ▒▓▒
                                         ▒▓
                                        ▓▓
                                      ▓▓▒▓
                                      ▒▒▓
```

**BHEEM**, a powerful tool for battling filthy bugs in the coding arena.</br>
A lazyvim extension for warriors wielding a mace in hand.

## Features

BHEEM is an extended, feature-rich configuration built on top of **LazyVim**, tailored to provide a smooth and powerful coding experience out-of-the-box. It has by default `vs-code` theme.

👉 **[View all custom keymaps in KEYMAPS.md](./KEYMAPS.md)**

### 🛠️ Core Capabilities

- **Telescope** for fast fuzzy finding, live grepping, and project navigation.
- **Harpoon** for lightning-fast file switching and workflow management.
- **Treesitter** for advanced syntax highlighting, code navigation, and structural editing.
- **Nvim-Surround** for intuitive and robust text-object manipulation.

### 💻 Language Support

First-class support pre-configured for modern development:

- **C/C++**
- **Python**
- **Rust**
- **TypeScript/JavaScript** (with built-in JSON and Tailwind CSS support)

## 🚀 Installation & Configuration

To set up **BHEEM** on your local machine, follow these steps:

### 1. Requirements

Ensure you have the following dependencies installed on your system:

- [Neovim](https://neovim.io/) (>= 0.9.0)
- [Git](https://git-scm.com/)
- A [Nerd Font](https://www.nerdfonts.com/) (required for icons to load properly)
- `ripgrep` (for Telescope live grep)
- `fd` (for Telescope finding files)
- A C Compiler like `gcc` or `clang` (for compiling treesitter parsers)
- `npm` and `node` (for Mason to install LSPs and formatters)

_One time install command (ubuntu/Debian)_

```bash
sudo apt install neovim git ripgrep fd-find gcc npm
```

### 2. Backup Existing Config (Important)

If you already have an existing Neovim configuration, back it up to avoid conflicts:

```bash
# required
mv ~/.config/nvim ~/.config/nvim.bak

# optional but recommended
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```

### 3. Clone BHEEM

Clone this repository directly into your Neovim config directory:

```bash
git clone https://github.com/sauhardh/bheem ~/.config/nvim
```

### 4. Start Neovim

Simply launch Neovim from your terminal:

```bash
nvim
```

**Bheem** will automatically bootstrap and start installing all the predefined plugins. Wait a moment for it to complete the first-time setup, and you're ready to battle those bugs!

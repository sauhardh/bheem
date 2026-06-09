# BHEEM Keymaps

This document lists the custom keybindings configured in the BHEEM Neovim setup. Since BHEEM is built on top of [LazyVim](https://www.lazyvim.org/), you also have access to all of LazyVim's default keymaps.

## Telescope
| Keymap | Action |
| ------ | ------ |
| `;r` | Live grep (search string in cwd) |
| `\` | List open buffers |
| `;;` | Resume previous telescope picker |
| `;e` | List diagnostics for open buffers |
| `;s` | List function names, variables (Treesitter) |
| `sf` | Open file browser at current buffer path |

## Harpoon
| Keymap | Action |
| ------ | ------ |
| `<leader>a` | Harpoon Add File |
| `<C-e>` | Toggle Harpoon Quick Menu |
| `<leader>1` | Navigate to Harpoon File 1 |
| `<leader>2` | Navigate to Harpoon File 2 |
| `<leader>3` | Navigate to Harpoon File 3 |
| `<leader>4` | Navigate to Harpoon File 4 |

## Bufferline
| Keymap | Action |
| ------ | ------ |
| `<leader>bp` | Toggle Pin |
| `<leader>bP` | Delete Non-Pinned Buffers |
| `<leader>br` | Delete Buffers to the Right |
| `<leader>bl` | Delete Buffers to the Left |
| `<S-h>` or `[b` | Previous Buffer |
| `<S-l>` or `]b` | Next Buffer |
| `[B` | Move Buffer Left |
| `]B` | Move Buffer Right |

## Noice & UI (Snacks)
| Keymap | Action |
| ------ | ------ |
| `<leader>sn` | Noice Prefix |
| `<S-Enter>` | Redirect Cmdline |
| `<leader>snl` | Noice Last Message |
| `<leader>snh` | Noice History |
| `<leader>sna` | Noice All |
| `<leader>snd` | Dismiss All Noice Messages |
| `<leader>snt` | Noice Picker (Telescope) |
| `<C-f>` | Scroll Forward (LSP Doc) |
| `<C-b>` | Scroll Backward (LSP Doc) |
| `<leader>n` | Notification History |
| `<leader>un` | Dismiss All Notifications |

# VSCode Neovim Keymaps

Custom keybindings for the VSCode Neovim extension. Leader key is `<Space>`.

## Clipboard

| Keymap | Mode | Action |
|--------|------|--------|
| `<leader>y` | n, v | Yank to system clipboard |
| `<leader>p` | n, v | Paste from system clipboard |

## Visual Mode Helpers

| Keymap | Mode | Action |
|--------|------|--------|
| `<` | v | Indent left and keep selection |
| `>` | v | Indent right and keep selection |
| `J` | v, x | Move selected lines down |
| `K` | v, x | Move selected lines up |
| `p` | v | Paste without overwriting yank register |

## General

| Keymap | Mode | Action |
|--------|------|--------|
| `<Esc>` | n | Clear search highlighting |

## VSCode Commands

| Keymap | Mode | Action |
|--------|------|--------|
| `<leader>t` | n, v | Toggle terminal |
| `<leader>b` | n, v | Toggle breakpoint |
| `<leader>d` | n, v | Show hover (documentation) |
| `<leader>a` | n, v | Quick fix menu |
| `<leader>sp` | n, v | Show problems panel |
| `<leader>cn` | n, v | Clear all notifications |
| `<leader>ff` | n, v | Quick open (find files) |
| `<leader>cp` | n, v | Command palette |
| `<leader>pr` | n, v | Run code (code-runner) |
| `<leader>fd` | n, v | Format document |

## Harpoon

| Keymap | Mode | Action |
|--------|------|--------|
| `<leader>ha` | n, v | Add current editor to harpoon |
| `<leader>ho` | n, v | Open harpoon quick pick |
| `<leader>he` | n, v | Edit harpoon editors list |
| `<leader>1` | n, v | Go to harpoon editor 1 |
| `<leader>2` | n, v | Go to harpoon editor 2 |
| `<leader>3` | n, v | Go to harpoon editor 3 |
| `<leader>4` | n, v | Go to harpoon editor 4 |
| `<leader>5` | n, v | Go to harpoon editor 5 |
| `<leader>6` | n, v | Go to harpoon editor 6 |
| `<leader>7` | n, v | Go to harpoon editor 7 |
| `<leader>8` | n, v | Go to harpoon editor 8 |
| `<leader>9` | n, v | Go to harpoon editor 9 |

## Project Manager

| Keymap | Mode | Action |
|--------|------|--------|
| `<leader>pa` | n, v | Save project |
| `<leader>po` | n, v | List projects (new window) |
| `<leader>pe` | n, v | Edit projects |

## Folding

| Keymap | Mode | Action |
|--------|------|--------|
| `zM` | n | Fold all |
| `zR` | n | Unfold all |
| `zc` | n | Fold |
| `zC` | n | Fold recursively |
| `zo` | n | Unfold |
| `zO` | n | Unfold recursively |
| `za` | n | Toggle fold |

## Code Navigation

| Keymap | Mode | Action |
|--------|------|--------|
| `gr` | n | Go to references (peek widget) |
| `gR` | n | Find all references (sidebar list) |
| `gI` | n | Go to implementation |
| `gy` | n | Go to type definition |
| `<leader>cr` | n | Rename symbol |

`gd` (go to definition), `gD` (peek definition), `gh` (hover) and `gO` (document
symbols) come from vscode-neovim's own defaults and are not remapped here.

Neovim 0.11 ships default LSP mappings under the `gr` prefix (`grr`, `grn`,
`gra`, `gri`, `grt`). No Neovim LSP attaches in VSCode mode, and leaving them in
place would make a bare `gr` wait out `timeoutlen`, so they are deleted before
`gr` is bound.

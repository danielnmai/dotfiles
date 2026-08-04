# Setting up coding environment

Personal config files tracked with a bare git repo. Setup approach from:
https://www.atlassian.com/git/tutorials/dotfiles

## Configs tracked

- **zsh** — `.zshrc`, `.zprofile`
- **tmux** — `.tmux.conf`, `.tmux/plugins/` (tpm, tmux-sensible, tmux-powerline)
- **neovim** — `.config/nvim/`
- **karabiner** — `.config/karabiner/karabiner.json`
- **starship** — `.config/starship.toml`
- **kitty** — `.config/kitty/kitty.conf`
- **tmux-powerline** — `.config/tmux-powerline/`
- **rectangle** — `RectangleConfig.json`

## New machine setup

### 1. Download essential apps (macOS)

- [Ungoogled Chromium](https://ungoogled-software.github.io/ungoogled-chromium-binaries/)
  - Install the [Chromium Web Store](https://github.com/nicedoc/nicedoc.io) extension to enable installing extensions from the Chrome Web Store
  - [Bitwarden](https://chromewebstore.google.com/detail/bitwarden-password-manage/nngceckbapebfimnlniiiahkandclblb) — password manager
  - [Vimium](https://chromewebstore.google.com/detail/vimium/dbepggeogbaibhgnhhndojpepiihcmeb) — vim-like navigation
- [Ghostty](https://ghostty.org/)
- [Slack](https://slack.com/downloads/mac)
- [Karabiner-Elements](https://karabiner-elements.pqrs.org/)

### 2. Install Homebrew (macOS)

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 3. Set up GitHub SSH key

Generate a new SSH key and add it to your GitHub account:

```bash
ssh-keygen -t ed25519 -C "your_email@example.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
```

Copy the public key and add it at https://github.com/settings/keys:

```bash
pbcopy < ~/.ssh/id_ed25519.pub
```

### 4. Install Oh My Zsh

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### 5. Clone the bare repo

```bash
git clone --bare git@github.com:danielnmai/dotfiles.git ~/.cfg
```

### 6. Set up the `config` alias

```bash
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```

Add this to your `.zshrc` so it persists.

### 7. Check out dotfiles

```bash
config checkout
```

If there are conflicts with existing files, back them up first:

```bash
mkdir -p ~/.config-backup && \
config checkout 2>&1 | grep "\s\+\." | awk '{print $1}' | xargs -I{} mv {} ~/.config-backup/{}
config checkout
```

### 8. Hide untracked files in status

```bash
config config --local status.showUntrackedFiles no
```

### 9. Install dependencies

#### Core tools

**Debian/Ubuntu:**

```bash
sudo apt install git zsh tmux neovim curl build-essential
chsh -s $(which zsh)
```

**macOS (Homebrew):**

```bash
brew install zsh tmux neovim curl
```

> git is included with Xcode Command Line Tools (`xcode-select --install`).

#### Oh My Zsh custom plugins

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/jeffreytse/zsh-vi-mode ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-vi-mode
```

#### Starship prompt

```bash
curl -sS https://starship.rs/install.sh | sh
```

#### fzf

**Debian/Ubuntu:**

```bash
sudo apt install fzf
```

**macOS:**

```bash
brew install fzf
```

#### nvm (optional)

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
```

### 10. Set up secrets

Create `~/.secrets` (not tracked) with any tokens or keys:

```bash
touch ~/.secrets
chmod 600 ~/.secrets
```

Add secrets as exports, e.g.:

```bash
export NPM_TOKEN_GITHUB="..."
```

### 11. Install tmux plugins

First, install tpm (Tmux Plugin Manager):

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Then start tmux and reload the config:

```bash
tmux
tmux source ~/.tmux.conf
```

Then press `prefix + I` (Ctrl-b, then Shift+I) to install plugins.

### 12. Set up LazyVim

LazyVim requires some external tools:

**Debian/Ubuntu:**

```bash
sudo apt install ripgrep fd-find lazygit
```

> Note: on Debian/Ubuntu the binary is `fdfind` instead of `fd`. Create a symlink if needed:
> `ln -s $(which fdfind) ~/.local/bin/fd`

**macOS:**

```bash
brew install ripgrep fd lazygit
```

Then open `nvim` — LazyVim will automatically install its plugins on first launch.

### 13. Import Rectangle config (macOS only)

Install Rectangle, then use **Preferences → Import** to load `~/RectangleConfig.json`.


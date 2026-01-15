# Dotfiles et al.

## 1. Homebrew:

Install [Homebrew](https://github.com/Homebrew/brew):

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## 2. Git:

Install [git](https://github.com/git/git):

```sh
brew install git
```

Add [diff-so-fancy](https://github.com/so-fancy/diff-so-fancy):

```sh
brew install diff-so-fancy
```

## 3. Ghostty:

Install [Ghostty](https://github.com/ghostty-org/ghostty) via Homebrew:

```sh
brew install --cask ghostty
```

Add a theme to its config file:

```
theme = chalk
```

## 4. Oh my ZSH

Install [Oh my ZSH](https://github.com/ohmyzsh/ohmyzsh):

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## 5. Powerlevel10k

Install [Powelevel10k](https://github.com/romkatv/powerlevel10k):

```sh
brew install powerlevel10k
```

Add to `~/.zshrc`:

```sh
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme
```

Restart Ghostty and run through the P10K setup wizard. 

## 6. ZSH syntax highlighting and autosuggest

Syntax highlighting helps you catch typos or missing commands before you hit enter.
Autosuggestions show a grayed-out suggestion based on your history as you type.

Install both with Homebrew:

```sh
brew install zsh-syntax-highlighting
brew install zsh-autosuggestions
```

Add to `~/.zshrc`:

```sh
# zsh plugins
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
```

## 7. `bat`

Install [bat](https://github.com/sharkdp/bat):

```sh
brew install bat
```

## 8. Aliases

Add to `~/.zshrc`:

```sh
# ls alias for color-mode
alias ls='ls -lhaG'

# git status alias
alias gs='git status'

# git add alias
alias ga='git add'

# git diff alias
alias gd='git diff'

# git checkout alias
alias gco='git checkout'

# git cool log alias
alias gl="git log --format='%Cgreen%h%Creset %C(cyan)%an%Creset - %s' --graph"
```

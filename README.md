# Dotfiles et al.

This is a list of steps that the [`setup.sh`](./setup.sh) script will run when executed. 

Ideally a valid SSH key and the macos SSH agent should be already set up (but are not required).

## 1. Homebrew

Install [Homebrew](https://github.com/Homebrew/brew):

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## 2. Git

Install [git](https://github.com/git/git):

```sh
brew install git
```

Add [diff-so-fancy](https://github.com/so-fancy/diff-so-fancy):

```sh
brew install diff-so-fancy
```

## 3. Ghostty

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

## 8. Gitconfig and aliases

Update or create the `~/.gitconfig` file with these settings:

```
[user]
    name = Ivan Prignano
    email = ivanprignano@gmail.com

[alias]
    co = checkout
    nb = checkout -b
    last = log -5 HEAD
    prum = pull --rebase upstream master
    pum = pull upstream master
    aliases = config --get-regexp alias
    recent = for-each-ref --count=10 --sort=-committerdate refs/heads/ --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:green)%(committerdate:relative)%(color:reset))'

[pager]
    diff = diff-so-fancy | less --tabs=1,5 -RFX
    show = diff-so-fancy | less --tabs=1,5 -RFX

[push]
    default = current

[core]
    editor = vim
```


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

## 9. NVM

Install [NVM](https://github.com/nvm-sh/nvm):

```sh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
```

## 9. Alfred + Rectangle

Install [Alfred](https://www.alfredapp.com) and [Rectangleapp](https://rectangleapp.com):

```sh
brew install --cask alfred
brew install --cask rectangle
```

## 10. 1Password

Install [1Password](https://1password.com):

```sh
brew install --cask 1password
```

## 11. Whatsapp & Signal

Install Whatsapp and Signal:

```sh
brew install --cask whatsapp
brew install --cask signal
```

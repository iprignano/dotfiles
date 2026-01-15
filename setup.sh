#!/bin/bash

set -e  # Exit on any error

echo "🚀 Starting Mac setup..."

# 1. Homebrew
echo "📦 Installing Homebrew..."
if ! command -v brew &> /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew already installed"
fi

# 2. Git and diff-so-fancy
echo "🔧 Installing Git and diff-so-fancy..."
brew install git
brew install diff-so-fancy

# 3. Ghostty
echo "👻 Installing Ghostty..."
brew install --cask ghostty

# Add Ghostty theme
echo "🎨 Adding Ghostty theme..."
GHOSTTY_CONFIG_DIR="$HOME/Library/Application\ Support/com.mitchellh.ghostty/config"
if ! grep -q "theme = chalk" "$GHOSTTY_CONFIG_DIR/config" 2>/dev/null; then
    echo "theme = chalk" >> "$GHOSTTY_CONFIG_DIR/config"
fi

# 4. Oh My ZSH
echo "⚡ Installing Oh My ZSH..."
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
    echo "Oh My ZSH already installed"
fi

# 5. Powerlevel10k
echo "💪 Installing Powerlevel10k..."
brew install powerlevel10k

# Add Powerlevel10k to .zshrc
echo "🔌 Adding Powerlevel10k to .zshrc..."
if ! grep -q "powerlevel10k.zsh-theme" "$HOME/.zshrc"; then
    echo "source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme" >> "$HOME/.zshrc"
fi

# 6. ZSH syntax highlighting and autosuggestions
echo "✨ Installing ZSH plugins..."
brew install zsh-syntax-highlighting
brew install zsh-autosuggestions

# Add ZSH plugins to .zshrc
echo "🔌 Adding ZSH plugins to .zshrc..."
if ! grep -q "zsh-syntax-highlighting" "$HOME/.zshrc"; then
    cat >> "$HOME/.zshrc" << 'EOF'

# zsh plugins
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
EOF
fi

# 7. bat
echo "🦇 Installing bat..."
brew install bat

# 8. Gitconfig and aliases
echo "🔧 Setting up Gitconfig..."
cat > "$HOME/.gitconfig" << 'EOF'
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
EOF

# Add aliases to .zshrc
echo "🔗 Adding aliases to .zshrc..."
if ! grep -q "ls='ls -lhaG'" "$HOME/.zshrc"; then
    cat >> "$HOME/.zshrc" << 'EOF'

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
EOF
fi

# 9. NVM
echo "📦 Installing NVM..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

# 9. Alfred + Rectangle
echo "🔧 Installing Alfred and Rectangle..."
brew install --cask alfred
brew install --cask rectangle

# 10. 1Password
echo "🔐 Installing 1Password..."
brew install --cask 1password

# 11. WhatsApp & Signal
echo "💬 Installing WhatsApp and Signal..."
brew install --cask whatsapp
brew install --cask signal

echo "✅ Mac setup complete!"
echo "🔄 Please restart your terminal and run 'p10k configure' to set up Powerlevel10k."

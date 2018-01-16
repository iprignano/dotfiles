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

alias refresh="source ~/.bash_profile"

# Open pull request
function currepo() {
    git config --get remote.origin.url | sed 's/.*@\(.*\)/\1/' | sed 's/\(.*\):\(.*\)/\1\/\2/' | sed 's/\(.*\)\.git/\1/';
}
function curbranch() {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/';
}

# Open a PR in the current git repository
alias openpr="open https://\`currepo\`/pull/new/\`curbranch\`"

# Git branch in prompt.
export PS1="ivan ⸫ \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

# Use vim for git stuff
export EDITOR=vim

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

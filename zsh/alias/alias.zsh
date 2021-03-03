#!/usr/bin/zsh

# include functions
source $HOME/.dotfiles/zsh/alias/function.zsh

# Directory operations
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# Make commands safe
# NEED: gomi
alias mv='mv -i'
alias rm='gomi'

# Git
alias g='git'

# Docker
alias d='docker'

# HomeBrew
alias brews='brew update && brew upgrade && brew cleanup; brew cask cleanup; brew doctor'

# Always enable colored `grep` output
alias grep='grep --color=auto'

# Trim new lines and copy to clipboard
alias copy="tr -d '\n' | pbcopy"

# Show/hide hidden files in Finder & desktop icons (use when presenting etc.)
alias showAll="defaults write com.apple.finder AppleShowAllFiles -bool true; defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias hideAll="defaults write com.apple.finder AppleShowAllFiles -bool false; defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# Merge PDF files, preserving hyperlinks
# Usage: `mergepdf input{1,2,3}.pdf`
alias mergepdf='gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=_merged.pdf'

# Intuitive map function
# For example, to list all directories that contain a certain file:
# find . -name .gitattributes | map dirname
alias map="xargs -n1"

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec ${SHELL} -l"

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

# make interactive fzf
# NEED: fzf
alias cof="!git branch -a | fzf | xargs git checkout"

# open repository managed by ghq by vscode
# NEED: ghq / fzf
alias cg='code "`ghq root`/`ghq list | fzf`"'
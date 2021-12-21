## [AUTO COMPLETE]

# Enable autocomplete
autoload -Uz compinit
compinit

# Highlight complete
zstyle ':completion*:default' menu select=2

# Disable current directory from candidates when end of "../"
zstyle ':completion:*' ignore-parents parent pwd ..

# Add slash to end of DIRECOTRY_NAME when autocompleted
setopt AUTO_PARAM_SLASH

# Disable Beep Sound when no candidates
setopt no_beep

## [DIRECTORY OPERATION]

# Auto cd with only directory_name
setopt auto_cd

## [HISTORY]
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt extended_history
setopt share_history
setopt hist_reduce_blanks

## [OPTIONS]
setopt nonomatch

# Make disable duplicate history
setopt HIST_IGNORE_ALL_DUPS

## [GHQ]

# ^g : cd xxx from ghq_list 
function cd_ghq_list() {
  local destination_dir="$(ghq list | fzf)"
  local ghq_dir="$(ghq root)"
  if [ -n "$destination_dir" ]; then
    BUFFER="cd $ghq_dir/$destination_dir"
    zle accept-line
  fi
  zle clear-screen
}
zle -N cd_ghq_list
bindkey '^g' cd_ghq_list

## [FZF]

# ^h : select_history_by_fzf
function select_history_by_fzf() {
    BUFFER=$(history -n -r 1 | fzf --no-sort +m --query "$LBUFFER" --prompt="History > ")
    CURSOR=$#BUFFER
}
zle -N select_history_by_fzf
bindkey '^h' select_history_by_fzf

## [READ EXTERNAL FILE]

# alias
source $HOME/dotfiles/zsh/alias/alias.zsh

# git-prompt
source $HOME/dotfiles/zsh/git_prompt.zsh


## [EXPORT]
setopt PROMPT_SUBST
export PS1='%K{033}%F{231} %~ %f%k%F{033}%f%F{red}$(__git_ps1 "(%s)")%f\$ 
'
export FZF_DEFAULT_OPTS="--height 50% --layout=reverse --border --inline-info --preview 'head -100 {}'"

## [PATH]
alias arm="exec arch -arch arm64e /bin/zsh --login"
alias x64="exec arch -arch x86_64 /bin/zsh --login"

typeset -U path PATH

eval "$(pyenv init --path)"
eval "$(pyenv init -)"

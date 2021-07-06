alias "cd.."="cd .."
alias c="clear"
alias cz="cd ~/zeehawk"
alias b="bat"

#git aliases
alias gs="git status"
alias gc="git checkout"
alias gcb="git checkout -b"
alias gb="git branch"
alias ga='git add'
alias gA='git add -A'
alias gf='gc %(gb | fzf)'
#git log options
alias hlog='git log --all --graph --format="%C(yellow)%h %C(reset)%an %C(blue)%ar %C(red)%d %C(reset)%s"'
alias xlog='git log --graph --format="%C(yellow)%h %C(reset)%an %C(blue)%ar %C(red)%d %C(reset)%s"'
alias slog='git log --stat --all --graph --format="%C(yellow)%h %C(reset)%an %C(blue)%ar %C(red)%d %C(reset)%s"'
alias mlog='git log --all --graph --format="%C(yellow)%h %C(red)%d %C(reset)%s"'
#vim aliases
alias v='vim'
alias v.='vim .'
alias vf='vim $(f)'
#fzf aliases 
alias f="fzf --preview 'bat --style=numbers --color=always {} | head -400'"
#tmux aliases
alias t='tmux'
alias tn='tmux new -s'
alias ta='tmux attach -t'
alias tl='tmux ls'

#zeehawk aliases
alias sc='make superclean'
alias mt='make tree -j20'

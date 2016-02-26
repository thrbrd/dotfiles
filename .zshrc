source ~/.zplug/zplug

zplug "zsh-users/zsh-syntax-highlighting", nice:10
zplug "zsh-users/zsh-completions"
zplug "plugins/git", from:oh-my-zsh
zplug "mollifier/anyframe"

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
zplug load --verbose

bindkey -e
setopt auto_cd

alias gmod="git fetch && git merge origin/develop"
alias gpor="git push origin `git rev-parse --abbrev-ref HEAD`"
alias chrome="open -a Google\ Chrome"
alias finder="open -a Finder"
alias atom="open -a Atom"

bindkey '^r^h' anyframe-widget-execute-history
bindkey '^r^b' anyframe-widget-checkout-git-branch
bindkey '^r^f' anyframe-widget-cdr

autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ':completion:*' recent-dirs-insert both
zstyle ':chpwd:*' recent-dirs-max 500
zstyle ':chpwd:*' recent-dirs-default true
zstyle ':chpwd:*' recent-dirs-file "$HOME/.cache/shell/chpwd-recent-dirs"
zstyle ':chpwd:*' recent-dirs-pushd true

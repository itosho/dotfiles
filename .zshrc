# ls
export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad

# pure: https://github.com/sindresorhus/pure
autoload -U promptinit; promptinit
prompt pure

# peco: https://github.com/peco/peco
bindkey '^F' peco-src

function peco-src () {
    local selected_dir=$(ghq list | peco --query "$LBUFFER")
    if [ -n "$selected_dir" ]; then
        selected_dir="$GOPATH/src/$selected_dir"
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-src

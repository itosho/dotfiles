# Go
export GOPATH=$HOME/go

# Python
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

# Path
PATH=$PATH:/usr/local/bin
PATH=$PATH:$HOME/bin
PATH=$PATH:$GOPATH/bin
export PATH

# general
## 日本語が文字化けしないよう文字コードを指定
export LANG=ja_JP.UTF-8

## 入力補完をする
autoload -U compinit && compinit

## コマンドをtypoしたときに訂正する
setopt nocorrect

##  補完候補を詰めて表示
setopt list_packed

## ビープ音を消す
setopt nolistbeep

## 補完に色を付ける
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

## 大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z} r:|[-_.]=**'

## 履歴
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt hist_ignore_dups
setopt share_history

## zsh用プロンプト: https://github.com/sindresorhus/pure
autoload -U promptinit; promptinit
prompt pure

## lscolors
export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad

# peco
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

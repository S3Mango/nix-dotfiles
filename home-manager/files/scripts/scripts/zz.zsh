#!/usr/bin/env zsh
eval "$(zoxide init zsh)"

function yy() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
    # Launch a new Yazi instance, replacing the current shell process
    exec yazi "$@" --cwd-file="$tmp"
    if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}

function zz() {
    if [ -z "$1" ]; then
        z . && yy
    else
        z "$1"
        yy
    fi
}

zz "$1"


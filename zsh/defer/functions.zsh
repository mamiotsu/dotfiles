BREWFILE="$HOME/.brewfile"

function brew-bundle-dump() {
    command brew bundle dump --file "$BREWFILE" --force
}

brew() {
    command brew $@
    brew-bundle-dump
}

# ghq
function ghq-fzf() {
  local src=$(ghq list | fzf --preview "bat --color=always --style=header,grid --line-range :80 $(ghq root)/{}/README.*")
  if [ -n "$src" ]; then
    BUFFER="cd $(ghq root)/$src"
    zle accept-line
  fi
  zle -R -c
}
zle -N ghq-fzf
bindkey '^g' ghq-fzf

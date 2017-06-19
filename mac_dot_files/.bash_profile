eval "$(rbenv init -)"

alias la="ls -lA"

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# Added by install_latest_perl_osx.pl
[ -r /Users/stijnbijnen/.bashrc ] && source /Users/stijnbijnen/.bashrc

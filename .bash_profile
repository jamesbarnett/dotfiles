[ -z "$TMUX" ] && export TERM=xterm-256color

[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

ulimit -n 10000

export VIMRUNTIME=$HOME/vim/runtime
export EDITOR="vim -f"
export SHELL="/bin/bash"
export GIT_EDITOR="vim -f"
export GOROOT="/usr/local/go"
export PATH="/usr/local/sbin:$PATH:$GOROOT/bin"
export PYTHONPATH=/usr/local/lib/python2.7:$PYTHONPATH
export HOMEBREW_GITHUB_API_TOKEN=$(cat $HOME/.homebrew-github-api-token)
export HILTON_GLOBAL_CLIENT_HEROKU_TOKEN=$(cat $HOME/.hilton-global-client-heroku-token)

# gmock / gtest
export GMOCK_DIR=$HOME/code/lib/gmock-1.6.0
export GTEST_DIR=${GMOCK_DIR}/gtest
export PGHOST=localhost

alias be="bundle exec"
alias bi="bundle install"
alias ls="ls -G"
alias ll='ls -lahF'
alias cd..="cd .."
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias eb="vim ~/.bash_profile"
alias sb="source ~/.bash_profile"
alias ev="vim ~/.vimrc"
alias sv="source ~/.vimrc"
alias ei="vim ~/.irbrc"
alias more="less"
alias v="vim"
alias psg="ps aux | grep"
alias rdm="rake db:migrate"
alias gpdm="git push development master"
alias gpsm="git push staging master"
alias rpca="rake assets:precompile RAILS_ENV=production"

# Prompt
FONT_BOLD='\[\e[1m\]'
COLOR_ORANGE='\[\e[0;33m\]'
COLOR_BLUE='\[\e[0;34m\]'
COLOR_WHITE='\[\e[0;37m\]'
COLOR_RESET='\[\e[0m\]'

export PS1="\
$FONT_BOLD\$(date +%H:%M) \
$COLOR_ORANGE\u \
$COLOR_WHITE\w \
$COLOR_BLUE\$(parse_git_branch) \
$COLOR_RESET\nλ "

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

export LESS=-RSFX
[[ -s /Users/jbarnett/.nvm/nvm.sh ]] && . /Users/jbarnett/.nvm/nvm.sh # This loads NVM

# OPAM configuration
. /Users/jbarnett/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

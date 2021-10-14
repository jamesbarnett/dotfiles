export PATH="/usr/local/opt/python/libexec/bin:$PATH"

# Prompt

autoload -U colors && colors
#export PS1="\
PS1="%F{yellow}%D{%Y-%m-%d %K:%M} \
%F{blue}%n%\@\
%F{cyan}%(5~|%-1~/.../%3~|%4~) \
%F{red}
λ%F{$reset_color} "

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

# Load rbenv automatically by appending
# the following to ~/.zshrc:

eval "$(rbenv init -)"

PATH="/Users/jbarnett/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/jbarnett/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/jbarnett/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/jbarnett/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/jbarnett/perl5"; export PERL_MM_OPT;
MSFWL="/opt/metasploit-framework/embedded/framework/data/wordlists"; export MSFWL;

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export OH="/Volumes/MacintoshHD/Users/jbarnett"

alias bi="bundle install"
alias ls="ls -G"
alias ll='ls -lahF'
alias cd..="cd .."
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias ez="vim ~/.zshrc"
alias sz="source ~/.zshrc"
alias ev="vim ~/.vimrc"
alias sv="source ~/.vimrc"
alias less="less -r"
alias more="less -r"
alias v="vim"
alias psg="ps aux | grep"
alias rdm="rake db:migrate"
alias gpdm="git push development master"
alias gpsm="git push staging master"
alias rpca="rake assets:precompile RAILS_ENV=production"
alias rct="RAILS_ENV=test rails c"
alias cov="open coverage/index.html"
alias ss="eval `ssh-agent -s`"
alias sshdo="ssh jim@$DOIP"
alias cdoh="cd $OH"


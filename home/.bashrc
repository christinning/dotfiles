alias chrome='open -a "Google Chrome"'

export DOCKER_HOST=tcp://localhost:4243

export PATH=$HOME/bin:/usr/local/bin:$PATH

export JAVA_HOME=`/usr/libexec/java_home`
export GROOVY_HOME=/usr/local/Cellar/groovy/2.0.5/libexec

export GRADLE_HOME=/Users/chris/opt/gradle
export PATH=$PATH:$GRADLE_HOME/bin

#export SCALA_HOME=/Users/chris/opt/scala/current
#export PATH=$PATH:$SCALA_HOME/bin

alias pgstart='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pgstop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

alias gradle-d='gradle --daemon'

export LS_OPTIONS='--color=auto'
export CLICOLOR='Yes'
export LSCOLORS=''

PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'

[[ -s "/Users/chris/.rvm/scripts/rvm" ]] && source "/Users/chris/.rvm/scripts/rvm"  # This loads RVM into a shell session.

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

source "$HOME/.homesick/repos/homeshick/homeshick.sh"

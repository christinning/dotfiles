export PATH=$HOME/bin:$PATH

export LS_OPTIONS='--color=auto'
export CLICOLOR='Yes'
export LSCOLORS=''

PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'


if [[ "$OSTYPE" == "darwin"* ]]; 
    then if [ -e "$HOME/.bashrc.osx" ];
	then source $HOME/.bashrc.osx
    fi
elif [[ "$OSTYPE" == "linux"* ]];
    then if [ -e "$HOME/.bashrc.ubuntu" ];
	then source $HOME/.bashrc.ubuntu
    fi
fi


source "$HOME/.homesick/repos/homeshick/homeshick.sh"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

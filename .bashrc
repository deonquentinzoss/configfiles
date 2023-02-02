#
# ~/.bashrc
#


# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls --color=auto -l'
alias grep='grep --color'

PS1='[\u@\h \W]\$ '


JOURNAL_PATH="/home/deon/Journal/work"

journal () {
    cd ${JOURNAL_PATH}
    if [[ ! -f `date +%Y%m%d` ]];
    then
        cp template `date +%Y%m%d`;
        if [[ -f 'TODO' ]];
        then
            while read -r line
            do
                echo "  []  $line" >> `date +%Y%m%d`
            done < TODO
        fi
    fi
    vim `date +%Y%m%d`
}

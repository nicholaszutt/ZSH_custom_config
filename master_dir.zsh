# Commands to open and change directory inside $MASTER directory (master for studies)
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)

export MASTER=~/Dropbox/university/master_1

openm() {
    local files
    IFS=$'\n' files=($(find $MASTER -type f | fzf --query="$1" --multi --select-1 --exit-0 --exact))
    if [ -n "$files" ]; then #The length of the string is greater than zero
        for file in ${files}; do #Cycle trough all the strings.
            xdg-open ${file}
        done
    fi
}

cdm() {
    local directory
    IFS=$'\n' directory=($(find $MASTER -type d | fzf --query="$1" --multi --select-1 --exit-0 --exact))
    if [ -n "$directory" ]; then #The length of the string is greater than zero
        cd "$directory"
    fi
}
# You can put files here to add functionality separated per file, which
# will be ignored by git.
# Files on the custom/ directory will be automatically loaded by the init
# script, in alphabetical order.

# For example: add yourself some shortcuts to projects you often work on.
#
# brainstormr=~/Projects/development/planetargon/brainstormr
# cd $brainstormr
#

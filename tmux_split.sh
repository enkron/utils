#!/bin/bash

many_panes()
{
    local id=1
    local server=

    for host in "$server"{01..16}; do
        if [ $(( $id % 2 )) == 1 ]; then
            tmux split-window -v -l 3
            tmux selectp -t 0
        fi
        if [ $(( $id % 2 )) == 0 ]; then
            tmux split-window -h -t 1
            tmux selectp -t 0
            tmux send-keys -t 1 "ssh ${host}" C-m
        fi
        echo $(( id++ ))
    done
}


some_panes()
{
    server='regeneron_airflow'

    for host in "$server"{'',2}; do
        tmux split-window -v -l 18
        tmux selectp -t 0
        tmux send-keys -t 1 "ssh ${host}" C-m
    done
    tmux set-window-option synchronize-panes
    tmux kill-pane -t 0
}

main()
{
    case $1 in
        * | --rgn)
            some_panes
            ;;
    esac
}

main

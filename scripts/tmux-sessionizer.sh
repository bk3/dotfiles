#!/usr/bin/env bash

# modified from theprimeagen

if [[ $# -eq 1 ]]; then
	selected=$1
else
	selected=$(find ~/.config ~/projects ~/Work/Couplr ~/Work/Clients ~/Scripts ~ ~/.config -mindepth 0 -maxdepth 2 -type d | sort | uniq | fzf)
fi

if [[ -z "$selected" ]]; then
	exit 0
fi

selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
	tmux new-session -s "$selected_name" -c "$selected"
	exit 0
fi

if ! tmux has-session -t="$selected_name" 2>/dev/null; then
	tmux new-session -ds "$selected_name" -c "$selected"
fi

tmux new-session -A -s "$selected_name" -c "$selected" || tmux switch -t "$selected_name" || tmux switch-client -t "$selected_name"

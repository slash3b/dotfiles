#!/usr/bin/env bash
# Claude Code notification hook
# Reads JSON from stdin and sends a desktop notification via notify-send

input=$(cat)

message=$(echo "$input" | python3 -c "import sys,json; d=json.load(sys.stdin); print(d.get('message', 'Task complete'))" 2>/dev/null)

if [[ -z "$message" ]]; then
    message="Task complete"
fi

notify-send --urgency=normal --icon=dialog-information "Claude Code" "$message"

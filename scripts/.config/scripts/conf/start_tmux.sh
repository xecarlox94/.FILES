
echo "running start tmux file"

if [ -n "$PS1" ] && [ -z "$TMUX" ]; then
    echo "Starting new tmux session"
    #tmux new-session -A -s main
    exec tmux
fi

#!/usr/local/bin/fish

tmux -u new-session -ADs vscode-(basename (pwd))

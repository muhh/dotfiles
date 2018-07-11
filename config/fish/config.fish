set -x EDITOR vim
set -x VISUAL $EDITOR
set -x CHEF_REPO_PATH ~/Repositories/chef
set PATH ~/.bin $PATH
source ~/.iterm2_shell_integration.fish
alias lc='colorls -sd'

[ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish

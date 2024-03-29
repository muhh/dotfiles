set -x LC_ALL en_US.UTF-8
set -x EDITOR vim
#set -x EDITOR mate -w
set -x VISUAL $EDITOR
set -x CHEF_REPO_PATH ~/Repositories/chef
set PATH ~/.bin /opt/homebrew/bin /opt/homebrew/sbin $PATH
source ~/.iterm2_shell_integration.fish
alias lc='colorls -sd'
alias ls='lsd'
alias cat='bat'
alias ping='prettyping'
set -x FZF_TMUX 1
set -x FZF_DEFAULT_COMMAND 'ag --hidden --ignore .git -g ""'

status --is-interactive; and source (rbenv init - | psub)

[ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish

fish_vi_key_bindings

set -g theme_nerd_fonts yes
set -g theme_color_scheme terminal2-dark

set nord0 2e3440
set nord1 3b4252
set nord2 434c5e
set nord3 4c566a
set nord4 d8dee9
set nord5 e5e9f0
set nord6 eceff4
set nord7 8fbcbb
set nord8 88c0d0
set nord9 81a1c1
set nord10 5e81ac
set nord11 bf616a
set nord12 d08770
set nord13 ebcb8b
set nord14 a3be8c
set nord15 b48ead

set fish_color_normal $nord4
set fish_color_command $nord9
set fish_color_quote $nord14
set fish_color_redirection $nord9
set fish_color_end $nord6
set fish_color_error $nord11
set fish_color_param $nord4
set fish_color_comment $nord3
set fish_color_match $nord8
set fish_color_search_match $nord8
set fish_color_operator $nord9
set fish_color_escape $nord13
set fish_color_cwd $nord8
set fish_color_autosuggestion $nord6
set fish_color_user $nord4
set fish_color_host $nord9
set fish_color_cancel $nord15
set fish_pager_color_prefix $nord13
set fish_pager_color_completion $nord6
set fish_pager_color_description $nord10
set fish_pager_color_progress $nord12
set fish_pager_color_secondary $nord1

eval (starship init fish)
zoxide init fish | source
fish_add_path /opt/homebrew/opt/curl/bin

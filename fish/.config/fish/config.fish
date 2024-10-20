
set -Ux fish_user_paths $HOME/.local/bin $fish_user_paths
# Set up fzf key bindings
fzf --fish | source
# Set up zoxide
zoxide init fish | source
# Set eza alias'------------------------------------------------------------------------
# ld - lists only directories (no files)
# lf - lists only files (no directories)
# lh - lists only hidden files (no directories)
# ll - lists everything with directories first
# ls - lists only files sorted by size
# lt - lists everything sorted by time updated
alias ld='eza -lD'
alias lf='eza -lF --icons=always --color=always | grep -v /'
alias lh='eza -dl --icons=always .* --group-directories-first'
alias ll='eza -al --icons=always --group-directories-first'
alias ls='eza -alF --icons=always --color=always --sort=name\
          --group-directories-first --no-permissions --no-user --git --no-time'
alias lt='eza -aT --level=2 --icons=always --sort=name'
# -------------------------------------------------------------------------------------
# Setup Yazi --------------------------------------------------------------------------
function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end
alias f='yazi'
#--------------------------------------------------------------------------------------
# Set basic alias'
alias v='nvim'


set -Ux fish_user_paths $HOME/.local/bin $fish_user_paths
set -Ux GPG_TTY $(tty)
set -Ux fish_vi_force_cursor 1

# Set up fzf key bindings
fzf --fish | source

# Set up zoxide
zoxide init fish | source

# Set up StarShip
set -Ux STARSHIP_CONFIG $HOME/.config/starship/starship.toml
starship init fish | source

# Setup interactive cursor
# Only run this in interactive shells
if status is-interactive

    # I'm trying to grow a neckbeard
    # fish_vi_key_bindings
    # Set the cursor shapes for the different vi modes.
    set fish_cursor_default block
    set fish_cursor_insert line
    set fish_cursor_replace_one underscore
    set fish_cursor_visual block

    function fish_user_key_bindings
        # Execute this once per mode that emacs bindings should be used in
        fish_default_key_bindings -M insert
        fish_vi_key_bindings --no-erase insert
    end
end

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
alias lg='lazygit'

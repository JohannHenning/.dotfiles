#NOTE: Set basic variables ----------------------------------------------------
set -Ux fish_user_paths $HOME/.local/bin $fish_user_paths
set -Ux GPG_TTY $(tty)
set -Ux EDITOR nvim
set -Ux fish_vi_force_cursor 1
#NOTE: Set basic alias' -------------------------------------------------------
alias v='nvim'
alias lg='lazygit'
#NOTE: FZF key bindings and options ------------------------------------
# WARNING: After fzf.fish install (Refer to README.md for detials)
set fzf_fd_opts --hidden --max-depth 5
fzf_configure_bindings --directory=\cf --git_log=\cg --git_status=\ch --history=\cr --processes=\ct --variables=\cv
#NOTE: Zoxide -----------------------------------------------------------------
zoxide init fish | source
#NOTE: StarShip ---------------------------------------------------------------
set -Ux STARSHIP_CONFIG $HOME/.config/starship/starship.toml
starship init fish | source
#NOTE: Interactive cursor -----------------------------------------------------
# PERF: Only run this in interactive shells
if status is-interactive
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
#NOTE: Eza alias' -------------------------------------------------------------
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
#NOTE: Yazi alias -------------------------------------------------------------
function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end
alias f='yazi'
#NOTE: Bun variables ----------------------------------------------------------
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
#NOTE: ssh agent ---------------------------------------------------------------
fish_ssh_agent
#NOTE: Quartz Alias ------------------------------------------------------------
# The following should be run within the .quartz subdirectory of your obsidian vault
alias op='npx quartz build --serve -d ../'
#NOTE: RClone Alias ------------------------------------------------------------
#WARNING: The following 2 command are for syncing Obsidian Vaults
# First one is for initial sync, or when changes are made to the .rcloneignore file
# Second is for successive syncs
alias rsr='rclone bisync ~/Vaults gdrive:Vaults --create-empty-src-dirs --compare size,modtime,checksum --slow-hash-sync-only --resilient -MvP --drive-skip-gdocs --fix-case --resync --filters-file ~/Vaults/MyLife/.rcloneignore'
alias rs='rclone bisync ~/Vaults gdrive:Vaults --create-empty-src-dirs --compare size,modtime,checksum --slow-hash-sync-only --resilient -MvP --drive-skip-gdocs --fix-case --filters-file ~/Vaults/MyLife/.rcloneignore'
#NOTE: Docker ------------------------------------------------------------------
alias dc='docker-compose'

# My Dotfiles repo

## WSL Setup

This guide tries to capture all the little things I tend to forget when spinning up a new WSL instance.
Hopefully by the end of this you (or me) will be able to reproduce a "lekker" environment to work in.

### Prerequisites

- WezTerm (see below for snippets on the WezTerm config Windows Side)

Create file `$USER\.config\wezterm\helpers.lua.lua` containing:

```
-- I am helpers.lua and I should live in ~/.config/wezterm/helpers.lua

local wezterm = require 'wezterm'

-- This is the module table that we will export
local module = {}

-- This function is private to this module and is not visible
-- outside.
local function private_helper()
  wezterm.log_error 'hello!'
end

-- define a function in the module table.
-- Only functions defined in `module` will be exported to
-- code that imports this module.
-- The suggested convention for making modules that update
-- the config is for them to export an `apply_to_config`
-- function that accepts the config object, like this:
function module.apply_to_config(config)
    private_helper()
    config.hide_tab_bar_if_only_one_tab = true
    config.font = wezterm.font 'JetBrains Mono'
    config.color_scheme = 'Tokyo Night Storm'
    config.window_background_opacity = 0.8
    config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
    config.default_domain = 'WSL:Arch'
end

-- return our module table
return module
```
and another `$USER\.config\wezterm\weztem.lua` containing:

```
-- Pull in the wezterm API
local wezterm = require 'wezterm'
local helpers = require 'helpers'
local config = {}
helpers.apply_to_config(config)
return config
```
- ArchWSL [install](https://wsldl-pg.github.io/ArchW-docs/How-to-Setup/)
  - I usually go for Method 3 as installing via CLI is my preference

### Your in Arch!!

From this point is basically a fresh Arc install and this is what I usually do:

1. yay [install](https://github.com/Jguer/yay)
  - I usually just build from source

2. fish [install](https://fishshell.com/)
  - I usually just run `yay -Sy fish`
  - Then run the following from within `~/.dotfiles`:
  ```
  $ fish

  $ rm -rf ~/.config/fish/

  $ stow fish
  ```
3. omf [install](https://github.com/oh-my-fish/oh-my-fish)
  - I usally go for the  `curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish` option
  - Then run the following from within `~/.dotfiles`:
```
$ rm -rf ~/.config/omf/

$ stow omf

$ omf install

$ omf reload
```
  - PS: The promp should now start to look like home

4. eza [install](https://github.com/eza-community/eza)
  - I usually just run `yay -Sy eza`

from here on its kinda random depending on why you spinned up the distro.

I'm gonna document it now as an unordered list of how I slowly build a dream comandline interface ready to solve any linux need I have. Hopefully one day I'll redo the scrach Arch install and ducument that for setup of Hyprland ect. This repo does contain the dot files for that machine but not the nitty gritty that I'm trying to capture here.

Enough jibber jabber lets continue.

PS from now on Im just gonna give a short hand of how I did things:
General issues are stow misbehaving config files stuggling to load correclty, just do some Googleing and you'll figure it out.

- tmux [install](https://github.com/tmux/tmux/wiki/Installing)
  - I usually just run `yay -Sy tmux`
  - Then `stow tmux`
  - tmux is strange in you clone the first package manager from the [repo](https://github.com/tmux-plugins/tpm) and then it'll use the `tmux.conf` file to manage and pull through the rest.
  - Remember to use `<C-a> I` after the first tmux launch.
  - Lekker now you have tmux

Now at this stage you might be wondering if you've been pulling these .config files correctly? We'll next I'll install lazygit if I were you.

- lazygit [install](https://github.com/jesseduffield/lazygit)
  - Jip, `yay -Sy lazygit` (see why we installed yay way in the beginning)
  - Yeah I also always forget to set the `git config --global user.name "avenger"` and `git config --global user.email "avenger@gmail.com`. 
  - On your first push you'll encounter the stupid GitHub Auth issue, here a
  breakdown of how to deal with [that](https://github.com/git-ecosystem/git-credential-manager/blob/release/docs/install.md):
  ```

  ```


Cool now that you're starting to get you legs back fzf next (sessionx not working hey :) )

- fzf [install](https://github.com/junegunn/fzf)
  - Yip, `yay -Sy fzf`

- zoxide [intall](https://github.com/ajeetdsouza/zoxide)
  - Ja, `yay -Sy zoxide`

# My Dotfiles repo

## WSL Setup

This guide tries to capture all the little things I tend to forget when spinning
up a new WSL instance.
Hopefully by the end of this you (or me) will be able to reproduce a "lekker"
environment to work in.

### Prerequisites

- WezTerm (see below for snippets on the WezTerm config Windows Side)

Create file `$USER\.config\wezterm\helpers.lua.lua` containing:

```lua
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
  config.color_scheme = 'Catppuccin Mocha'
  config.window_background_opacity = 0.90
  config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
  config.default_domain = 'WSL:Arch'
  config.window_padding = {
    right = 0,
    left = 0,
    top = 2,
    bottom = 2,
  }
end

-- return our module table
return module
```

and another `$USER\.config\wezterm\weztem.lua` containing:

```lua
-- Pull in the wezterm API
local wezterm = require 'wezterm'
local helpers = require 'helpers'
local config = {}
helpers.apply_to_config(config)
return config
```

- ArchWSL [install](https://wsldl-pg.github.io/ArchW-docs/How-to-Setup/)
  - I usually go for Method 3 as installing via CLI is my preference

### Your in Arch

From this point is basically a fresh Arc install and this is what I usually do:

1. yay [install](https://github.com/Jguer/yay):

- I usually just build from source

2. fish [install](https://fishshell.com)

- I usually just run `yay -Sy fish`
- Then run the following from within `~/.dotfiles`:

  ```shell
  fish

  rm -rf ~/.config/fish/

  stow fish
  ```

3. omf [install](https://github.com/oh-my-fish/oh-my-fish)

- I usally go for the `curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish` option
- Then run the following from within `~/.dotfiles`:

```shell
rm -rf ~/.config/omf/

stow omf

omf install

omf reload
```

- PS: The promp should now start to look like home

4. eza [install](https://github.com/eza-community/eza)

- I usually just run `yay -Sy eza`

From here on its kinda random depending on why you spinned up the distro.

I'm gonna document it now as an unordered list of how I slowly build a dream
comandline interface ready to solve any linux need I have. Hopefully one day
I'll redo the scrach Arch install and ducument that for setup of Hyprland ect.
This repo does contain the dot files for that machine but not the nitty gritty
that I'm trying to capture here.

Enough jibber jabber lets continue.

PS from now on Im just gonna give a short hand of how I did things:
General issues are stow misbehaving config files stuggling to load correclty,
just do some Googleing and you'll figure it out.

- tmux [install](https://github.com/tmux/tmux/wiki/Installing)
  - I usually just run `yay -Sy tmux`
  - Then `stow tmux`
  - tmux is strange in you clone the first package manager from the
    [repo](https://github.com/tmux-plugins/tpm) and then it'll use the `tmux.conf`
    file to manage and pull through the rest.
  - Remember to use `<C-a> I` after the first tmux launch.
  - Lekker now you have tmux

Now at this stage you might be wondering if you've been pulling these
.config files correctly? We'll next I'll install lazygit if I were you.

- lazygit [install](https://github.com/jesseduffield/lazygit)

  - Jip, `yay -Sy lazygit` (see why we installed yay way in the beginning)
  - Yeah I also always forget to set the `git config --global user.name "avenger"`
    and `git config --global user.email "avenger@gmail.com`.
  - On your first push you'll encounter the stupid GitHub Auth issue, here a
    breakdown of how to deal with [that](https://github.com/git-ecosystem/git-credential-manager/blob/release/docs/install.md):

  ```shell
  curl -L https://aka.ms/gcm/linux-install-source.sh | sh
  git-credential-manager configure
  ```

  PS: This does take a while just be patient, especially the dot.net install

  - If the above method isn't working (dotnet can be a bit silly at times) then try [this](https://github.com/cli/cli/blob/trunk/docs/install_linux.md) - and use old fathfull `yay -Sy github-cli`
    and then run `gh auth login`
    This actually turned into another rabbit hole I'm gonna explain below:

# TODO Figure out how to do those fancy hide section markdowns

[This](https://gitlab.com/hasecilu/dotfiles/-/snippets/2542670) guide shows how to create a GPG key and link it to your GitHub account. Keeps you from having to authorize the machine over and over again

- Ensure `gpg` is installed
- Run `gpg --full-generate-key`
- Run `gpg --list-secret-keys --keyid-format LONG`
- Run `gpg --armor --export "YOUR_KEY_HERE" >PGP_PUBLIC_KEY_BLOCK`
- [Goto](https://github.com/settings/keys) and setup the SSH key just generated
- Go and add the following to the main `.gitconfig` file:

```config
[user]
 name = username
 email = user@domain.com
 signingkey = "YOUR_KEY_HERE"

```

- You'll also want to run `gh auth login` one last time so the "GPG" key loads
  Another route would be to follow [this](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) guide.
  It follows a few simple steps on how to enable ssh signing (recommend using this on more permanent machines)

Cool now that you're starting to get you legs back fzf next (sessionx not working hey :) )

- fzf [install](https://github.com/junegunn/fzf)

  - Yip, `yay -Sy fzf`

- zoxide [intall](https://github.com/ajeetdsouza/zoxide)

  - Ja, `yay -Sy zoxide`

- ripgrep [rg]:(<https://github.com/BurntSushi/ripgrep>)
  - Jip, `yay -Sy ripgrep`
  - PS now Live Grep will start working in Nvim ("<leader> / ")
    Here is another fun one, at the time of writing this markdown file, I was in the process of creating this whole repo and though it relevant to be able to chill on my couch and code this from my Arch Installed laptop.

So `openssh` next:

- `yay -Sy openssh`
- `sudo systemctl enable --now sshd`

So I got bored of the normal promp and i kept finding myself using `pwd` way to much.

- `yay -Sy starship`

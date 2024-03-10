# Neovim as IDE

Neovim: Where the coding elite congregates, leaving "modern" IDEs in their feeble attempts to catch up. It's my go-to remedy for those IDEs that make you question if you're coding or waiting for a spaceship launch. Behold the surge of power as I orchestrate Neovim wizardry, while "modern" IDE users are still making coffee. But come on, who are we fooling? (Or maybe not fooling at all.) I'm simply head over heels for this text-editor sorcery and modern IDEs. Well, they can keep hitting that snooze button! 😈

# NvChad

Here I am using NvChad 🗿, that makes the Neovim super cool. Also, not to forget about Nerd Fonts that I am using for WSL 2 terminal JetBrains Mono.

# Setup

NvChad takes care of all the setup hardwork, thus all we need to configure NvChad. Thus follow official Docs for installation: [NvChad Docs]('https://nvchad.com/docs/quickstart/install')

# Customization

Here is the my custom files at the following path: `~/.config/nvim/lua/custom/`

## Adding custom plugins

To add custom plugins, NvChad suggests to create respective configurations inside `custom` directory.

- Add expose `custom/plugins.lua` inside `custom/chadrc.lua` add the following line
  ```lua
  ...
  M.plugins = 'custom.plugins'
  ...
  ```
- Copy the plugins inside `custom/plugins.lua` file
- Similarly, copy `custom/config` directory inside `custom` directory.
- Now, restart the `nvim` & terminal
- Finally open the `nvim`, wait for NvChad package manager to fetch plugins & for safety run `:MasonInstallAll`

# LLBlumire Developer Environment

This repository documents dotfiles and software installations which enable me
to have a consistent, cross platform environment for development. The drivers
of this cross platform unified environment are:

 - `wezterm` terminal emulator.
 - `nushell` data based shell.
 - `starship` command prompt configurator.
 - `neovim` editing environment.


## Installation

First, install the software that powers the above setup.

 1. Install rustup from <https://rustup.rs/>
 2. Install wezterm from <https://wezfurlong.org/wezterm/>
 3. Install nushell with `cargo install nu --locked`
 4. Install starship with `cargo install starship --locked`

Also install

  * `ripgrep` a grep alternative with `cargo install ripgrep --locked`
  * `fd-find` a filesystem searcher with `cargo install fd-find --locked`
  * `justfile` a script alternative with `cargo install just --locked`
  * `mprocs` a multiprocess runner with `cargo install mprocs --locked`
  * JetBrains Mono from <https://www.jetbrains.com/lp/mono/>

## Dotfiles

There are a number of config files that need to go in the appropriate places.
On linux this is generally `~/.config/<software>`. On windows, it might be at
`%APPDATA%/<software>`, or `%LOCALAPPDATA%/<software>`, you'll need to check.

All of the relevant dotfiles can be found in the `/dotfiles` directory. Copy
paste these or use symlinks.

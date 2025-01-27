# Environment variables from Zsh configuration
# Maintained for Fish shell

# Ensure safe working directory
if status is-login
    cd $HOME
end

# Environment variables

# Set XDG directories
set -gx XDG_CONFIG_HOME (set -q XDG_CONFIG_HOME; and echo $XDG_CONFIG_HOME; or echo $HOME/.config)
set -gx XDG_DATA_HOME (set -q XDG_DATA_HOME; and echo $XDG_DATA_HOME; or echo $HOME/.local/share)
set -gx XDG_CACHE_HOME (set -q XDG_CACHE_HOME; and echo $XDG_CACHE_HOME; or echo $HOME/.cache)
set -gx ZDOTDIR (set -q ZDOTDIR; and echo $ZDOTDIR; or echo $XDG_CONFIG_HOME/zsh)

# Ensure path arrays do not contain duplicates
set -U fish_user_paths $fish_user_paths

# Rustup shell initialization
if test -f $HOME/.cargo/env.fish
    source $HOME/.cargo/env.fish
end

# Add completions path for Homebrew managed fish
if test -d (brew --prefix)"/share/fish/completions"
    set -gx fish_complete_path $fish_complete_path (brew --prefix)/share/fish/completions
end

if test -d (brew --prefix)"/share/fish/vendor_completions.d"
    set -gx fish_complete_path $fish_complete_path (brew --prefix)/share/fish/vendor_completions.d
end

# Homebrew settings
set -gx HOMEBREW_CASK_OPTS "--appdir=~/Applications"
set -gx HOMEBREW_MAKE_JOBS 6

# Comment: Additional env vars will be added here during migration

# ===== Core Environment Configuration =====

# XDG Base Directories
set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx XDG_DATA_HOME "$HOME/.local/share"
set -gx XDG_STATE_HOME "$HOME/.local/state"
set -gx XDG_CACHE_HOME "$HOME/.cache"

# Mise Configuration
set -gx MISE_HOME "$HOME/.local/share/mise"
set -gx MISE_SHIMS "$MISE_HOME/shims"

# Initialize mise (must happen before anything else)
if command -q mise
    if not contains $MISE_SHIMS $PATH
        set -gx --prepend PATH $MISE_SHIMS
    end
    mise activate fish --shims | source
    mise activate fish | source
end


# Tool Homes
source "$HOME/.cargo/env.fish"
source "$HOME/.local/share/../bin/env.fish"
set -gx CARGO_HOME "$HOME/.cargo"
set -gx RUSTUP_HOME "$HOME/.rustup"
set -gx HOMEBREW_PREFIX /opt/homebrew

# Homebrew Configuration
set -gx HOMEBREW_CASK_OPTS "--appdir=~/Applications"
set -gx HOMEBREW_MAKE_JOBS (sysctl -n hw.ncpu)

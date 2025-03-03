# ===== PATH Configuration =====

# Define paths in priority order
set -l paths \
    $CARGO_HOME/bin \
    $HOME/.local/bin \
    # $HOMEBREW_PREFIX/opt/llvm/bin \
    $HOMEBREW_PREFIX/bin \
    $HOMEBREW_PREFIX/sbin \
    /usr/local/bin \
    /usr/bin \
    /bin \
    /usr/sbin \
    /sbin

# Set PATH while removing duplicates
set -gx PATH
for p in $paths
    if test -d $p; and not contains -- $p $PATH
        set -gxa PATH $p
    end
end

# Add Homebrew completions
for dir in "$HOMEBREW_PREFIX/share/fish/"{completions,vendor_completions.d}
    if test -d $dir
        set -gxa fish_complete_path $dir
    end
end


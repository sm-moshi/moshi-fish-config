# PATH configuration migrated from Zsh
# Note: Fish automatically updates command paths - no rehash needed
# Structured in priority order

# Comment: This file will contain the converted PATH setup
# from .zshenv, organized in the same priority order:
# 1. System paths
# 2. Language-specific tools
# 3. Development tools
# 4. GNU tools

# PATH configuration

set -gx PATH \
    # Language-specific tools (highest priority)
    $HOME/.cargo/bin \
    $HOME/.rustup/toolchains/*/bin \
    $HOME/.asdf/bin \
    $HOME/.asdf/shims \
    # System paths
    /opt/homebrew/bin \
    /opt/homebrew/sbin \
    # Development tools
    /opt/homebrew/opt/llvm/bin \
    /opt/homebrew/opt/openjdk/bin \
    /opt/homebrew/opt/dotnet/bin \
    /opt/homebrew/opt/bison/bin \
    /opt/homebrew/opt/m4/bin \
    /opt/homebrew/opt/ncurses/bin \
    /opt/homebrew/opt/curl/bin \
    /opt/homebrew/opt/net-snmp/bin \
    /opt/homebrew/opt/net-snmp/sbin \
    /opt/homebrew/opt/poppler-qt5/bin \
    /opt/homebrew/opt/tcl-tk@8/bin \
    /opt/homebrew/opt/coreutils/libexec/gnubin \
    /opt/homebrew/opt/grep/libexec/gnubin \
    /opt/homebrew/opt/gnu-sed/libexec/gnubin \
    /opt/homebrew/opt/findutils/libexec/gnubin \
    /opt/homebrew/opt/make/libexec/gnubin \
    /opt/homebrew/opt/libtool/libexec/gnubin \
    /opt/homebrew/opt/gnu-getopt/bin \
    /opt/homebrew/opt/gawk/bin \
    /opt/homebrew/opt/binutils/bin \
    $HOME/.cache/lm-studio/bin \
    $PATH

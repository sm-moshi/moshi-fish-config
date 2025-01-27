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

# Define path groups
set -l user_paths \
    $HOME/.cargo/bin \
    $HOME/.rustup/toolchains/*/bin \
    $HOME/.asdf/{bin,shims}

set -l brew_paths \
    $BREW_PREFIX/{bin,sbin}

set -l tool_paths \
    $BREW_PREFIX/opt/{llvm,openjdk,dotnet,bison,m4,ncurses,curl,net-snmp,poppler-qt5,"tcl-tk@8"}/bin

set -l gnu_paths \
    $BREW_PREFIX/opt/{coreutils,grep,gnu-sed,findutils,make,libtool}/libexec/gnubin \
    $BREW_PREFIX/opt/{gnu-getopt,gawk,binutils}/bin

# Combine all paths
set -gx PATH \
    $user_paths \
    $brew_paths \
    $tool_paths \
    $gnu_paths \
    $HOME/.cache/lm-studio/bin \
    $PATH

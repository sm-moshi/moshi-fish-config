# Programming tools configuration

# Homebrew base configuration
set -gx BREW_PREFIX /opt/homebrew

# Library and include paths
set -l brew_opt "$BREW_PREFIX/opt"
set -gx BREW_INCLUDE \
    "$BREW_PREFIX/include" \
    "$brew_opt/openssl@3/include" \
    "$brew_opt/ncurses/include" \
    "$brew_opt/curl/include"

set -gx BREW_LIB \
    "$BREW_PREFIX/lib" \
    "$brew_opt/openssl@3/lib" \
    "$brew_opt/ncurses/lib" \
    "$brew_opt/curl/lib"

# OpenSSL configuration
set -gx OPENSSL_PATH "$brew_opt/openssl@3"

# PKG_CONFIG configuration
set -gx PKG_CONFIG_PATH \
    "$OPENSSL_PATH/lib/pkgconfig" \
    "$brew_opt/llvm/lib/pkgconfig" \
    "$brew_opt/curl/lib/pkgconfig" \
    "$brew_opt/ncurses/lib/pkgconfig" \
    "$brew_opt/tcl-tk@8/lib/pkgconfig" \
    "$BREW_PREFIX/lib/pkgconfig"

# Compiler flags
set -gx CFLAGS "-O3 -flto=thin -march=native -pipe -I$BREW_PREFIX/opt/llvm/include"
set -gx CXXFLAGS "$CFLAGS"
set -gx LDFLAGS "-L$BREW_LIB -L$BREW_PREFIX/opt/llvm/lib -L$BREW_PREFIX/opt/llvm/lib/c++ -L$BREW_PREFIX/opt/llvm/lib/unwind -lunwind -Wl,-z,relro -Wl,-z,now -fuse-ld=lld"
# LLVM toolchain configuration
set -l llvm_prefix "$brew_opt/llvm"
set -gx CC "$llvm_prefix/bin/clang"
set -gx CXX "$llvm_prefix/bin/clang++"
set -gx LD "$llvm_prefix/bin/ld.lld"
set -gx AR "$llvm_prefix/bin/llvm-ar"
set -gx NM "$llvm_prefix/bin/llvm-nm"
set -gx RANLIB "$llvm_prefix/bin/llvm-ranlib"


# Compiler and linker flags
set -gx CPPFLAGS "-I$BREW_INCLUDE"

# System paths for builds
set -gx CPATH "/usr/include:$BREW_INCLUDE"
set -gx LIBRARY_PATH "/usr/lib:$BREW_LIB"

# Rust configuration
set -gx RUSTFLAGS "-C link-arg=-fuse-ld=lld -C target-cpu=native -C opt-level=3 -C embed-bitcode=yes"

# Java configuration (ASDF-managed)
if type -q asdf
    set -gx JAVA_HOME (asdf where java)
    set -gx CPPFLAGS "$CPPFLAGS -I $JAVA_HOME/include"
end

# Dotnet configuration
set -gx DOTNET_ROOT /opt/homebrew/opt/dotnet

# TCL/TK configuration
set -gx TCL_LIBRARY "/opt/homebrew/opt/tcl-tk@8/lib/tcl8.6"
set -gx TK_LIBRARY "/opt/homebrew/opt/tcl-tk@8/lib/tk8.6"

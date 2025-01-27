# Programming tools configuration

# Homebrew paths
set -gx BREW_PREFIX /opt/homebrew
set -gx BREW_INCLUDE "$BREW_PREFIX/include" \
    "$BREW_PREFIX/opt/openssl@3/include" \
    "$BREW_PREFIX/opt/ncurses/include"
"$BREW_PREFIX/opt/curl/include"

set -gx BREW_LIB "$BREW_PREFIX/lib" \
    "$BREW_PREFIX/opt/openssl@3/lib" \
    "$BREW_PREFIX/opt/ncurses/lib -ltinfo" \
    "$BREW_PREFIX/opt/curl/lib"

# OpenSSL configuration
set -gx OPENSSL_PATH "$BREW_PREFIX/opt/openssl@3"

# PKG_CONFIG configuration
set -gx PKG_CONFIG_PATH \
    "$OPENSSL_PATH/lib/pkgconfig" \
    "$BREW_PREFIX/opt/llvm/lib/pkgconfig" \
    "$BREW_PREFIX/opt/curl/lib/pkgconfig" \
    "$BREW_PREFIX/opt/ncurses/lib/pkgconfig" \
    "$BREW_PREFIX/opt/libffi/lib/pkgconfig" \
    "$BREW_PREFIX/opt/tcl-tk@8/lib/pkgconfig" \
    "$BREW_PREFIX/lib/pkgconfig"

# LLVM configuration (optimized for Apple Silicon)
set -gx CC "$BREW_PREFIX/opt/llvm/bin/clang"
set -gx CXX "$BREW_PREFIX/opt/llvm/bin/clang++"
set -gx LD "$BREW_PREFIX/opt/llvm/bin/ld.lld"
set -gx AR "$BREW_PREFIX/opt/llvm/bin/llvm-ar"
set -gx NM "$BREW_PREFIX/opt/llvm/bin/llvm-nm"
set -gx RANLIB "$BREW_PREFIX/opt/llvm/bin/llvm-ranlib"

# Compiler flags
set -gx CFLAGS "-O3 -flto=thin -march=native -pipe -I$BREW_PREFIX/opt/llvm/include"
set -gx CXXFLAGS "$CFLAGS"
set -gx LDFLAGS "-L$BREW_LIB -L$BREW_PREFIX/opt/llvm/lib -L$BREW_PREFIX/opt/llvm/lib/c++ -L$BREW_PREFIX/opt/llvm/lib/unwind -lunwind -Wl,-z,relro -Wl,-z,now -fuse-ld=lld"
set -gx CPPFLAGS "-I$BREW_INCLUDE"

# Rust configuration
set -gx RUSTFLAGS "-C link-arg=-fuse-ld=lld -C target-cpu=native -C opt-level=3 -C embed-bitcode=yes"

# Java configuration (ASDF-managed)
if type -q asdf
    set -gx JAVA_HOME (asdf where java)
    set -gx CPPFLAGS "$CPPFLAGS -I$JAVA_HOME/include"
end

# Dotnet configuration
set -gx DOTNET_ROOT /opt/homebrew/opt/dotnet

# TCL/TK configuration
set -gx TCL_LIBRARY "/opt/homebrew/opt/tcl-tk@8/lib/tcl8.6"
set -gx TK_LIBRARY "/opt/homebrew/opt/tcl-tk@8/lib/tk8.6"

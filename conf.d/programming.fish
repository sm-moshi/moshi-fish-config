# Programming tools configuration

# OpenSSL configuration
set -gx OPENSSL_PATH "/opt/homebrew/opt/openssl@3"
set -gx LDFLAGS "-L$OPENSSL_PATH/lib"
set -gx CPPFLAGS "-I$OPENSSL_PATH/include"
set -gx PKG_CONFIG_PATH "$OPENSSL_PATH/lib/pkgconfig"

# PKG_CONFIG configuration
set -gx PKG_CONFIG_PATH \
    "/opt/homebrew/opt/openssl@3/lib/pkgconfig" \
    /opt/homebrew/opt/llvm/lib/pkgconfig \
    /opt/homebrew/opt/curl/lib/pkgconfig \
    /opt/homebrew/opt/ncurses/lib/pkgconfig \
    /opt/homebrew/opt/libffi/lib/pkgconfig \
    "/opt/homebrew/opt/tcl-tk@8/lib/pkgconfig" \
    /opt/homebrew/lib/pkgconfig

# LLVM configuration (optimized for Apple Silicon)
set -gx CC /opt/homebrew/opt/llvm/bin/clang
set -gx CXX "/opt/homebrew/opt/llvm/bin/clang++"
set -gx LD "/opt/homebrew/opt/llvm/bin/ld.lld"
set -gx AR /opt/homebrew/opt/llvm/bin/llvm-ar
set -gx NM /opt/homebrew/opt/llvm/bin/llvm-nm
set -gx RANLIB /opt/homebrew/opt/llvm/bin/llvm-ranlib

# Compiler flags
set -gx CFLAGS "-O3 -flto=thin -march=native -pipe -I/opt/homebrew/opt/llvm/include"
set -gx CXXFLAGS "-O3 -flto=thin -march=native -pipe -I/opt/homebrew/opt/llvm/include"
set -gx LDFLAGS "$LDFLAGS -L/opt/homebrew/opt/llvm/lib -L/opt/homebrew/opt/llvm/lib/c++ -L/opt/homebrew/opt/llvm/lib/unwind -lunwind -Wl,-z,relro -Wl,-z,now -fuse-ld=lld"

# Rust configuration
set -gx RUSTFLAGS "-C link-arg=-fuse-ld=lld -C target-cpu=native -C opt-level=3 -C embed-bitcode=yes -C debuginfo=2"

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

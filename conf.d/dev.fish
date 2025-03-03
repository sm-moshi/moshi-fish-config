# ===== Development Configuration =====

# LLVM toolchain configuration
#set -gx CC clang
#set -gx CXX clang++
#set -gx LD lld
#set -gx AR llvm-ar
#set -gx RANLIB llvm-ranlib
#set -gx STRIP llvm-strip
#set -gx OBJCOPY llvm-objcopy
#set -gx OBJDUMP llvm-objdump
#set -gx READELF llvm-readelf

# Build flags
set -gx MAKEFLAGS -j(sysctl -n hw.ncpu)
# More conservative Rust flags
set -gx RUSTFLAGS "-C opt-level=3" # -C link-arg=-fuse-ld=lld"

# Common compiler flags - remove global LTO for better compatibility
set -l common_flags "-O3 -pipe"
set -gx CFLAGS $common_flags
set -gx CXXFLAGS $common_flags

# Essential build libraries from Homebrew
set -l lib_paths
# Only include commonly needed build dependencies
for pkg in \
    openssl@3 \
    zlib \
    readline \
    curl \
    ncurses #\
    # libzip \
    # libsodium \
    # icu4c \
    #llvm

    set -l pkg_path $HOMEBREW_PREFIX/opt/$pkg
    if test -d $pkg_path
        set -a lib_paths $pkg_path
    end
end

# Build include and lib flags - single rpath per library
set -gx CPPFLAGS
set -gx LDFLAGS "-Wl,-rpath,$HOMEBREW_PREFIX/lib"
for path in $lib_paths
    if test -d $path/include
        set -ga CPPFLAGS "-I$path/include"
    end
    if test -d $path/lib
        set -ga LDFLAGS "-L$path/lib"
    end
end

# PKG_CONFIG_PATH
set -gx PKG_CONFIG_PATH (string join ':' $lib_paths"/lib/pkgconfig")

# ASDF version manager configuration

# Load ASDF if installed
if test -f $HOME/.asdf/asdf.fish
    source $HOME/.asdf/asdf.fish
end

# Python build configuration
set -gx PYTHON_BUILD_ARIA2_OPTS "-x 10 -k 1M"
set -gx PYTHON_BUILD_MIRROR_URL "https://www.python.org/ftp/python"
set -gx PYTHON_CONFIGURE_OPTS "--enable-optimizations --with-lto"
set -gx ASDF_PYTHON_VERSION_PREFIX "" # Prevent custom suffixes
set -gx ASDF_PYTHON_DEFAULT_PACKAGES_FILE "$XDG_CONFIG_HOME/asdf/default-python-packages"

# Ruby build configuration
set -gx RUBY_CONFIGURE_OPTS "--disable-dtrace --enable-yjit --enable-shared --with-gcc=clang --with-openssl-dir=$OPENSSL_PATH"
set -gx RUBY_CFLAGS "-Wno-error=implicit-function-declaration -DRUBY_FUNCTION_NAME_STRING=__func__"
set -gx RUBY_YJIT_ENABLE 1

# Node.js build configuration
set -gx NODEJS_CHECK_SIGNATURES no

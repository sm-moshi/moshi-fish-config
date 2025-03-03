# ===== Homebrew Updater =====
function brewup --description "Update and clean Homebrew packages"
    echo "🔄 Updating Homebrew..."
    brew update

    echo "⬆️  Upgrading installed packages (including casks)..."
    brew upgrade --greedy

    echo "🗑 Cleaning up old versions..."
    brew cleanup --prune=all

    echo "🚮 Removing unnecessary dependencies..."
    brew autoremove

    echo "🩺 Running 'brew doctor' for potential issues..."
    brew doctor

    echo "✅ Homebrew update and cleanup complete!"
end
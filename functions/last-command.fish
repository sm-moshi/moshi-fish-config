# ===== Command History Utilities =====
# Function to display and explain the last executed command
function last-command
    set cmd (history | head -n 1 | string trim)
    if test -z "$cmd"
        echo "No previous command found"
        return 1
    end
    echo "Last command: $cmd"
end
alias last='last-command'

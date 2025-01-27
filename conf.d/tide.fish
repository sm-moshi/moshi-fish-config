# Tide Theme Configuration (p10k replacement)

# Configure Tide prompt style
set -g tide_prompt_icon_connection ' '
set -g tide_left_prompt_separator_diff_color ''
set -g tide_right_prompt_separator_diff_color ''

# Git configuration
set -g tide_git_icon ''
set -g tide_git_truncation_length 24

# Enable necessary prompt items (removed rust from right_prompt_items)
set -g tide_left_prompt_items os pwd git newline character
set -g tide_right_prompt_items status cmd_duration context jobs node python time

# Configure colors and icons
set -g tide_pwd_color_dirs blue
set -g tide_pwd_color_truncated_dirs cyan

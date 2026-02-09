[[ "${BASH_SOURCE[0]}" != "$0" ]] || {
  echo "This file must be sourced"
  exit 1
}

# Function to get color code by name
colorize() {
    local color_name="$1"
    
    # Safety check: only allow alphanumeric and underscore characters
    if [[ ! "$color_name" =~ ^[a-zA-Z_]+$ ]]; then
        echo "Error: Invalid color name. Only letters and underscores allowed." >&2
        return 1
    fi
    
    # Convert to uppercase
    color_name="${color_name^^}"
    
    # Declare associative array for color mappings
    declare -A colors=(
        # Reset
        ["RESET"]="\e[0m"
        
        # Regular Colors
        ["BLACK"]="\e[30m"
        ["RED"]="\e[31m"
        ["GREEN"]="\e[32m"
        ["YELLOW"]="\e[33m"
        ["BLUE"]="\e[34m"
        ["MAGENTA"]="\e[35m"
        ["CYAN"]="\e[36m"
        ["WHITE"]="\e[37m"
        
        # Bold Colors
        ["BOLD_BLACK"]="\e[1;30m"
        ["BOLD_RED"]="\e[1;31m"
        ["BOLD_GREEN"]="\e[1;32m"
        ["BOLD_YELLOW"]="\e[1;33m"
        ["BOLD_BLUE"]="\e[1;34m"
        ["BOLD_MAGENTA"]="\e[1;35m"
        ["BOLD_CYAN"]="\e[1;36m"
        ["BOLD_WHITE"]="\e[1;37m"
        
        # Underline Colors
        ["UL_BLACK"]="\e[4;30m"
        ["UL_RED"]="\e[4;31m"
        ["UL_GREEN"]="\e[4;32m"
        ["UL_YELLOW"]="\e[4;33m"
        ["UL_BLUE"]="\e[4;34m"
        ["UL_MAGENTA"]="\e[4;35m"
        ["UL_CYAN"]="\e[4;36m"
        ["UL_WHITE"]="\e[4;37m"
        
        # Background Colors
        ["BG_BLACK"]="\e[40m"
        ["BG_RED"]="\e[41m"
        ["BG_GREEN"]="\e[42m"
        ["BG_YELLOW"]="\e[43m"
        ["BG_BLUE"]="\e[44m"
        ["BG_MAGENTA"]="\e[45m"
        ["BG_CYAN"]="\e[46m"
        ["BG_WHITE"]="\e[47m"
        
        # High Intensity Colors
        ["HI_BLACK"]="\e[90m"
        ["HI_RED"]="\e[91m"
        ["HI_GREEN"]="\e[92m"
        ["HI_YELLOW"]="\e[93m"
        ["HI_BLUE"]="\e[94m"
        ["HI_MAGENTA"]="\e[95m"
        ["HI_CYAN"]="\e[96m"
        ["HI_WHITE"]="\e[97m"
        
        # Bold High Intensity
        ["BOLD_HI_BLACK"]="\e[1;90m"
        ["BOLD_HI_RED"]="\e[1;91m"
        ["BOLD_HI_GREEN"]="\e[1;92m"
        ["BOLD_HI_YELLOW"]="\e[1;93m"
        ["BOLD_HI_BLUE"]="\e[1;94m"
        ["BOLD_HI_MAGENTA"]="\e[1;95m"
        ["BOLD_HI_CYAN"]="\e[1;96m"
        ["BOLD_HI_WHITE"]="\e[1;97m"
        
        # High Intensity Backgrounds
        ["BG_HI_BLACK"]="\e[100m"
        ["BG_HI_RED"]="\e[101m"
        ["BG_HI_GREEN"]="\e[102m"
        ["BG_HI_YELLOW"]="\e[103m"
        ["BG_HI_BLUE"]="\e[104m"
        ["BG_HI_MAGENTA"]="\e[105m"
        ["BG_HI_CYAN"]="\e[106m"
        ["BG_HI_WHITE"]="\e[107m"
        
        # 256 Color Palette
        ["ORANGE"]="\e[38;5;208m"
        ["DARK_ORANGE"]="\e[38;5;166m"
        ["LIGHT_ORANGE"]="\e[38;5;214m"
        ["BROWN"]="\e[38;5;130m"
        ["LIGHT_BROWN"]="\e[38;5;180m"
        ["DARK_GREEN"]="\e[38;5;22m"
        ["LIME_GREEN"]="\e[38;5;82m"
        ["SPRING_GREEN"]="\e[38;5;48m"
        ["SEA_GREEN"]="\e[38;5;85m"
        ["NAVY"]="\e[38;5;17m"
        ["ROYAL_BLUE"]="\e[38;5;63m"
        ["SKY_BLUE"]="\e[38;5;117m"
        ["STEEL_BLUE"]="\e[38;5;67m"
        ["PURPLE"]="\e[38;5;93m"
        ["VIOLET"]="\e[38;5;135m"
        ["PINK"]="\e[38;5;213m"
        ["GRAY"]="\e[38;5;244m"
        ["DARK_GRAY"]="\e[38;5;238m"
        ["LIGHT_GRAY"]="\e[38;5;250m"
        
        # Special Effects
        ["DIM"]="\e[2m"
        ["BOLD"]="\e[1m"
        ["ITALIC"]="\e[3m"
        ["BLINK"]="\e[5m"
        ["REVERSE"]="\e[7m"
        ["HIDDEN"]="\e[8m"
        ["STRIKETHROUGH"]="\e[9m"
    )
    
    # Return the color code if it exists, otherwise return empty string
    if [[ -n "${colors[$color_name]}" ]]; then
        echo -e "${colors[$color_name]}"
    else
        echo "Error: Unknown color!" >&2
        return 1
    fi
}

# Example usage:
# echo "$(colorize green)This is green text$(colorize reset)"
# echo "$(colorize "red; rm -rf /")This won't work - rejected!" # SAFE!
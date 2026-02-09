[[ "${BASH_SOURCE[0]}" != "$0" ]] || {
  echo "This file must be sourced"
  exit 1
}

if validate_editor "$2"; then
  EDITOR="$2"
else
  EDITOR="nano"
fi

# Set config
set_config() {
  local key="$1"
  local value="$2"
  local file="$CONFIG_USER"

  mkdir -p "$(dirname "$file")"

  if grep -q "^$key=" "$file" 2>/dev/null; then
    sed -i "s|^$key=.*|$key=\"$value\"|" "$file"
  else
    echo "$key=\"$value\"" >> "$file"
  fi
}

# Usage
set_config EDITOR vim
set_config COLORS blue:cyan

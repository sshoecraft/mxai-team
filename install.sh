#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
CONFIG_DIR="$HOME/.config/mxai"

echo "mxai-team installer"
echo "==================="
echo

# Ask for server URL
read -p "Enter Matrix server URL (e.g. http://192.168.1.100:8008): " SERVER_URL
if [ -z "$SERVER_URL" ]; then
    echo "Error: server URL is required"
    exit 1
fi

# Create config directories
mkdir -p "$CONFIG_DIR/bots"
mkdir -p "$CONFIG_DIR/roles"
mkdir -p "$CONFIG_DIR/credentials"
chmod 700 "$CONFIG_DIR/credentials"
mkdir -p "$HOME/logs"

# Install role files
echo "Installing role files..."
cp "$SCRIPT_DIR/roles/"*.txt "$CONFIG_DIR/roles/"

# Install bot configs with server URL and home dir substituted
echo "Installing bot configs..."
for bot in "$SCRIPT_DIR/bots/"*.toml; do
    filename="$(basename "$bot")"
    sed -e "s|SERVER_URL|$SERVER_URL|g" -e "s|HOME_DIR|$HOME|g" "$bot" > "$CONFIG_DIR/bots/$filename"
done

# Install mkteam launcher
echo "Installing mkteam..."
cp "$SCRIPT_DIR/mkteam" "$HOME/.local/bin/mkteam" 2>/dev/null || \
    cp "$SCRIPT_DIR/mkteam" "$HOME/bin/mkteam" 2>/dev/null || \
    { echo "Warning: could not install mkteam to ~/.local/bin or ~/bin"; }

echo
echo "Installation complete."
echo "Config installed to: $CONFIG_DIR"
echo "Logs directory: $HOME/logs"
echo
echo "Note: credentials are not included in this repo."
echo "Each bot will register automatically on first run if register=true."

#!/bin/bash

# Update and upgrade the system
echo "Updating and upgrading the system..."
sudo apt update && sudo apt upgrade -y

# Install Node.js and NPM
echo "Installing Node.js and NPM..."
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt install -y nodejs

# Verify Node.js and NPM installation
echo "Verifying Node.js and NPM installation..."
node_version=$(node -v)
npm_version=$(npm -v)

if [[ $node_version == v20* ]] && [[ $npm_version ]]; then
    echo "Node.js $node_version and NPM $npm_version installed successfully!"
else
    echo "Node.js and NPM installation failed."
    exit 1
fi

# Install Rivalz Node CLI globally
echo "Installing Rivalz Node CLI globally..."
sudo npm i -g rivalz-node-cli

# Verify Rivalz Node CLI installation
echo "Verifying Rivalz Node CLI installation..."
if command -v rivalz &> /dev/null
then
    echo "Rivalz Node CLI installed successfully!"
else
    echo "Rivalz Node CLI installation failed."
    exit 1
fi

# Install tmux
echo "Installing tmux..."
sudo apt install -y tmux

# Start a new tmux session and run the Rivalz Node CLI inside it with sudo
echo "Starting a new tmux session and running Rivalz Node CLI with sudo..."
tmux new-session -d -s rclient_session 'sudo rivalz run'

# Provide instructions to attach to the tmux session
echo "To attach to the tmux session, use the following command:"
echo "tmux attach -t rclient_session"

echo "Rivalz Node CLI setup completed successfully!"

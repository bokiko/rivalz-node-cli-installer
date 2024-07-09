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

# Install rClient CLI globally
echo "Installing rClient CLI globally..."
sudo npm i -g rivalz-node-cli

# Verify rClient CLI installation
echo "Verifying rClient CLI installation..."
if command -v rivalz &> /dev/null
then
    echo "rClient CLI installed successfully!"
else
    echo "rClient CLI installation failed."
    exit 1
fi

# Install tmux
echo "Installing tmux..."
sudo apt install -y tmux

# Start a new tmux session and run the rClient CLI inside it
echo "Starting a new tmux session and running rClient CLI..."
tmux new-session -d -s rclient_session 'rivalz run'

# Provide instructions to attach to the tmux session
echo "To attach to the tmux session, use the following command:"
echo "tmux attach -t rclient_session"

echo "rClient CLI setup completed successfully!"

# Rivalz Node CLI Installation Script

Welcome to the Rivalz Node CLI installation script repository. This repository contains a one-click script to install Node.js, NPM, the Rivalz Node CLI, and `tmux` on an Ubuntu system. The script ensures that the Rivalz Node CLI continues to run even after the SSH session is closed by using `tmux`.

## Prerequisites

Ensure your system meets the following requirements:

- RAM 4GB

- 4 Cores (2.2GHz)

- 50GB SSD

- 1Mbps Internet

- Ubuntu operating system

## Installation

Follow these steps to install and run the Rivalz Node CLI using the provided script.

### Step 1: Clone the Repository

Clone this repository to your local machine:

```bash
git clone https://github.com/your-username/rivalz-node-cli-installer.git
cd rivalz-node-cli-installer
 ```




## Step 2: Make the Script Executable
Make the installation script executable:
```bash
chmod +x install_rclient.sh
```
## Step 3: Run the Script
Execute the script to install and run the Rivalz Node CLI:
```bash
./install_rclient.sh
```
## Step 4: Reattach to the tmux Session
To reattach to the tmux session where the Rivalz Node CLI is running:
```bash
tmux attach -t rclient_session
```
## Step 5: Configure the Node
After reattaching to the tmux session, follow the prompts to configure the node by entering the following information:

- Your wallet address
- CPU cores
- RAM size
- Select disk type (click enter if you have only one)
- Select disk serial number (click enter)
- Enter disk size you want to allow the client to use
- you can safely close the SSH screen, the node will continue working

## What the Script Does
- Updates and upgrades the system to ensure all packages are current.
- Installs Node.js and NPM using NodeSource.
- Verifies the installation of Node.js and NPM.
- Installs the Rivalz Node CLI globally using NPM.
- Verifies the installation of the Rivalz Node CLI.
- Installs tmux for session management.
- Starts a new tmux session named rclient_session and runs rivalz run inside it.

## Using tmux to Check the node
To attach to the tmux session:
```bash
tmux attach -t rclient_session
```
To detach from the tmux session (without stopping the process):

Press Ctrl+B, then D.

## Contributing
Feel free to fork this repository, make improvements, and submit pull requests. We welcome contributions from the community!

## License
This project is licensed under the MIT License - see the LICENSE file for details.



#!/bin/bash

USERNAME="dev"

apt update -y

apt install sudo git ansible -y

usermod -aG sudo ${USERNAME}


# Define the line to add to the sudoers file
SUDOERS_LINE="${USERNAME} ALL=(ALL) NOPASSWD:ALL"

# Check if the line already exists in the sudoers file
if sudo grep -q "${SUDOERS_LINE}" /etc/sudoers; then
    echo "Passwordless sudo is already configured for ${USERNAME}."
else
    # Add the line to the sudoers file if it doesn't exist
    echo "${SUDOERS_LINE}" | sudo tee -a /etc/sudoers > /dev/null
    echo "Passwordless sudo has been configured for ${USERNAME}."
fi


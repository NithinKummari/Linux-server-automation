#!/bin/bash

USERNAME="$1"
PUBKEY="$2"

if id "$USERNAME" &>/dev/null; then
    echo "User $USERNAME already exists."
else
    useradd -m -s /bin/bash "$USERNAME"
    mkdir -p /home/$USERNAME/.ssh
    echo "$PUBKEY" > /home/$USERNAME/.ssh/authorized_keys
    chmod 700 /home/$USERNAME/.ssh
    chmod 600 /home/$USERNAME/.ssh/authorized_keys
    chown -R $USERNAME:$USERNAME /home/$USERNAME/.ssh
    echo "SSH key added for user $USERNAME"
fi

#!/bin/bash

. ./remote_config.sh

# Function to pull files from the remote server
pull_files() {
  rsync -avz -e "ssh -p $PORT" --include='*' "${USER}@${IP}:${REMOTE_DIR}/" "${LOCAL_DIR}"
}

# Function to push files to the remote server
push_files() {
  rsync -avz -e "ssh -p $PORT" --include='*' "${LOCAL_DIR}/" "${USER}@${IP}:${REMOTE_DIR}"
}

# Prompt the user for pull or push
read -p "Do you want to pull or push files? (pull/push): " action

case $action in
  pull)
    pull_files
    ;;
  push)
    push_files
    ;;
  *)
    echo "Invalid option. Please enter 'pull' or 'push'."
    ;;
esac

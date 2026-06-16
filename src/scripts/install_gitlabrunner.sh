#!/bin/bash

# Install and configure GitLab Runner on Ubuntu 22.04 LTS

# GitLab instance settings
GITLAB_URL="..."
GITLAB_TOKEN="..."

add_gitlab_runner_repo() {
    echo "Adding GitLab Runner repository..."
    curl -fsSL https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh | sudo bash
    echo "GitLab Runner repository added."
}

install_gitlab_runner() {
    echo "Installing GitLab Runner..."
    sudo apt-get update
    sudo apt-get install -y gitlab-runner
    echo "GitLab Runner installed."
}

register_gitlab_runner() {
    echo "Registering GitLab Runner with the predefined URL and token..."
    echo "Enter a description for your Runner:"
    read runner_description
    echo "Enter tags for the Runner (optional, press Enter to skip):"
    read runner_tags

    sudo gitlab-runner register \
        --url "$GITLAB_URL" \
        --registration-token "$GITLAB_TOKEN" \
        --description "$runner_description" \
        --tag-list "$runner_tags" \
        --executor "shell"
    echo "GitLab Runner registered."
}

start_gitlab_runner() {
    echo "Starting GitLab Runner..."
    sudo gitlab-runner start
    echo "GitLab Runner started."
}

check_gitlab_runner_status() {
    echo "Checking GitLab Runner status..."
    sudo gitlab-runner status
}

echo "Installing and configuring GitLab Runner on Ubuntu 22.04 LTS"
add_gitlab_runner_repo
install_gitlab_runner
register_gitlab_runner
start_gitlab_runner
check_gitlab_runner_status

echo "GitLab Runner installation and configuration complete."

#!/bin/bash

# Repository URLs
CICD_REPO_URL=...
SIMPLEBASH_REPO_URL=...

# Create a workspace directory for the projects
cd ~ || { echo "Failed to navigate to home directory"; exit 1; }
mkdir -p projects
cd projects || { echo "Failed to enter projects folder"; exit 1; }

echo "Cloning CICD project..."
git clone "$CICD_REPO_URL"
cd DO6_CICD-1 || { echo "Failed to enter CICD project folder"; exit 1; }

echo "Switching to develop branch in CICD project..."
git checkout develop || { echo "develop branch not found in CICD project"; exit 1; }

cd ..

echo "Cloning SimpleBash project..."
git clone "$SIMPLEBASH_REPO_URL"
cd C3_SimpleBashUtils || { echo "Failed to enter SimpleBash project folder"; exit 1; }

echo "Switching to develop branch in SimpleBash project..."
git checkout develop || { echo "develop branch not found in SimpleBash project"; exit 1; }

echo "Both projects have been successfully cloned and switched to develop branch."

#!/bin/bash

# Переменные для ссылок на репозитории
CICD_REPO_URL=...
SIMPLEBASH_REPO_URL=...

# Создание в домашней папке папки для проектов
cd ~ || { echo "Failed to navigate to home directory"; exit 1; }
mkdir -p projects
cd projects || { echo "Failed to enter projects folder"; exit 1; }

# Клонирование проекта DO6-CICD
echo "Cloning CICD project..."
git clone "$CICD_REPO_URL"
cd DO6_CICD-1 || { echo "Failed to enter CICD project folder"; exit 1; }

# Переключение на ветку develop
echo "Switching to develop branch in CICD project..."
git checkout develop || { echo "develop branch not found in CICD project"; exit 1; }

cd ..

# Клонирование C3_SimpleBashUtils
echo "Cloning SimpleBash project..."
git clone "$SIMPLEBASH_REPO_URL"
cd C3_SimpleBashUtils || { echo "Failed to enter SimpleBash project folder"; exit 1; }

echo "Switching to develop branch in SimpleBash project..."
git checkout develop || { echo "develop branch not found in SimpleBash project"; exit 1; }

echo "Both projects have been successfully cloned and switched to develop branch."


#!/bin/bash

# Telegram bot credentials
TELEGRAM_BOT_TOKEN="..."
TELEGRAM_USER_ID="..."

URL="https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage"

# Build a notification message from GitLab CI variables
TEXT="Job name: $CI_JOB_NAME%0A%0AStatus:+$CI_JOB_STATUS"

curl -s -d "chat_id=$TELEGRAM_USER_ID&disable_web_page_preview=1&text=$TEXT" $URL > /dev/null

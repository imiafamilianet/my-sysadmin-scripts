#!/bin/bash

LOG_FILE="/var/log/user_setup.log"
USERNAME=$1
USER_DIR="/home/$USERNAME"

if [ -z "$USERNAME" ]; then
    echo "Ошибка: Не указано имя пользователя!"
    echo "Использование: $0 <имя_пользователя>"
    exit 1
fi

echo "Создание директории: $USER_DIR"
mkdir -p "$USER_DIR"

BASHRC_PATH="$USER_DIR/.bashrc"
echo "Создание файла: $BASHRC_PATH"
bash -c "cat << 'EOF' > $BASHRC_PATH
# Кастомный файл .bashrc
export PATH=\$PATH:/usr/local/bin
alias ll='ls -lh'
EOF"

echo "========================================="
echo "Привет, $USERNAME! Добро пожаловать!"
echo "Ваша директория и файлы успешно созданы."
echo "========================================="

TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
LOG_ENTRY="[$TIMESTAMP] Создано окружение для пользователя: $USERNAME (Директория: $USER_DIR)"

bash -c "echo '$LOG_ENTRY' >> $LOG_FILE"
echo "Факт создания записан в лог: $LOG_FILE"

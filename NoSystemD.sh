#!/bin/bash

# Предупреждение
echo "Этот скрипт удалит systemd. Убедитесь, что у вас есть резервная копия данных!"
read -p "Вы уверены, что хотите продолжить? (y/n): " confirm

if [[ "$confirm" != "y" ]]; then
    echo "Отмена."
    exit 1
fi

lsblk


echo "Введите название диска с корневой системой, а после прожмите ctrl + X => shift + Y => enter:"
echo "Выберите диск с корневым катологом(только /)" 

read -p "Вы уверены, что хотите продолжить? (y/n): " confirm

if [[ "$confirm" != "y" ]]; then
    echo "Отмена."
    exit 1
fi

nano disk_name.txt
 
# Чтение названия диска из файла
DISK_NAME=$(cat ~/disk_name.txt)

# Проверка, что переменная не пустая
if [ -z "$DISK_NAME" ]; then
    echo "Название диска не указано. Пожалуйста, введите название диска в disk_name.txt."
    exit 1
fi

# Пример использования названия диска (можно заменить на нужную команду)
echo "Выбранный диск: $DISK_NAME"
# Здесь можно добавить команды для работы с диском, например, монтирование или проверка состояния




# Монтирование корневой файловой системы (если необходимо)
# Замените /dev/sdXn на ваш корневой раздел
echo "Монтирование корневой файловой системы..."
mount /dev/$DISK_NAME /mnt

# Переход в chroot
echo "Переход в chroot..."
arch-chroot /mnt << EOF

# Удаление файлов systemd
echo "Удаление systemd..."
rm -rf /lib/systemd /etc/systemd /usr/lib/systemd /usr/bin/systemctl /usr/bin/systemd

# Обновление конфигурации загрузчика (пример для GRUB)
echo "Обновление конфигурации GRUB..."
grub-mkconfig -o /boot/grub/grub.cfg

EOF

# Перезагрузка системы
echo "Перезагрузка системы..."
reboot

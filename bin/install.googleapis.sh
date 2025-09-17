#!/bin/sh

URL="https://github.com/googleapis/googleapis/archive/refs/heads/master.zip"
TEMP_ZIP="/tmp/googleapis.zip"
TARGET="/usr/share"
CURRENT_NAME="/usr/share/googleapis-master"
NORMAL_NAME="/usr/share/googleapis"

# Проверка прав
if [ ! -w "/usr/share" ]; then
  echo "Требуются права root. Запустите: sudo $0"
  exit 1
fi

# Скачивание
echo "Скачивание..."
curl -sL -o "$TEMP_ZIP" "$URL" || wget -q -O "$TEMP_ZIP" "$URL" || {
  echo "Ошибка скачивания. Установите curl или wget"
  exit 1
}

# Распаковка
echo "Распаковка..."
mkdir -p "$TARGET"
unzip -q -o "$TEMP_ZIP" -d "$TARGET" && rm "$TEMP_ZIP" && echo "Готово!" || {
  echo "Ошибка распаковки. Установите unzip"
  rm -f "$TEMP_ZIP"
  exit 1
}

echo "rename"
mv -R $CURRENT_NAME $NORMAL_NAME

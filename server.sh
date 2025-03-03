#!/bin/bash

# Apagar nginx y ngrok
echo "Apagando Nginx..."
sudo systemctl stop nginx

echo "Apagando Ngrok..."
pkill -f "ngrok"

# Verificar que nginx y ngrok se apagaron correctamente
if ! pgrep -x "nginx" > /dev/null; then
    echo "Nginx apagado correctamente."
else
    echo "Nginx no pudo apagarse o no se encuentra prendido."
fi

if ! pgrep -x "ngrok" > /dev/null; then
    echo "Ngrok apagado correctamente."
else
    echo "Ngrok no pudo apagarse o no se encuentra prendido."
fi

# Entrar a la ruta de HTML
echo "Entrando en la ruta del portafolio..."
cd /var/www/html || exit

# Verificamos si existe la carpeta y si sí, la eliminamos y creamos una nueva
if [ -d "/var/www/html/Portfolio" ]; then
    echo "Eliminando el repositorio antiguo..."
    sudo rm -r /var/www/html/Portfolio
fi

echo "Clonando el nuevo repositorio..."
git clone https://github.com/JoseCQUADY/Portfolio /var/www/html/Portfolio

echo "Buildeando la nueva imagen del portafolio..."
cd /var/www/html/Portfolio || exit
npm install
npm run build

echo "Versión actualizada de la web."

# Encender Nginx y generar URL de Ngrok
echo "Prendiendo Nginx..."
sudo systemctl start nginx

echo "Generando URL de Ngrok..."
ngrok http 80

echo "Script finalizado con éxito."




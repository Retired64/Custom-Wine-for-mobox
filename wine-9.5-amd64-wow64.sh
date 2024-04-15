#!/bin/bash

# Verificar si Python está instalado
if ! command -v python &>/dev/null; then
    echo "Python no está instalado. Instalando Python..."
    yes|pkg install python -y
fi

# Verificar si la biblioteca gdown está instalada
if ! python -c "import gdown" &>/dev/null; then
    echo "La biblioteca gdown no está instalada. Instalando la biblioteca gdown..."
    pip install gdown
fi

# Descargar el archivo usando gdown
echo "Descargando el archivo..."
gdown https://drive.google.com/uc?id=1Ek7ycDPhGDhssLkgRgM2YI7lg2Qq-cmE

# Verificar si la descarga fue exitosa
if [ $? -eq 0 ]; then
    echo "Descarga exitosa. Descomprimiendo el archivo..."
    # Descomprimir el archivo
read -p $'\e[32mNombre del Wine Mobox a Remplazar\e[0m' nombre_mobox
    tar xfk wine-9.5-amd64-wow64.tar.xz -C $PREFIX/glibc/ --transform="s/wine-9.5-amd64-wow64/$nombre_mobox/"
    echo "Descompresión completada."
else
    echo "Error al descargar el archivo."
fi

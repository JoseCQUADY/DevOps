#!/bin/bash

# Verificar si se proporcionó un argumento
if [ -z "$1" ]; then
    echo "Uso: $0 <nombre_pokemon>"
    exit 1
fi

POKEMON_NAME=$(echo "$1" | tr '[:upper:]' '[:lower:]') # Convertir a minúsculas
API_URL="https://pokeapi.co/api/v2/pokemon/$POKEMON_NAME"
CSV_FILE="pokemon_data.csv"

# Consultar la API y almacenar la respuesta con el código de estado
HTTP_RESPONSE=$(curl -s -w "%{http_code}" -o response.json "$API_URL")

# Verificar si la respuesta es 200 (OK)
if [ "$HTTP_RESPONSE" -ne 200 ]; then
    echo "Error: No se encontró el Pokémon '$POKEMON_NAME' o la API no está disponible."
    rm -f response.json # Eliminar respuesta inválida
    exit 1
fi

# Verificar que el archivo JSON es válido antes de procesarlo
if ! jq empty response.json > /dev/null 2>&1; then
    echo "Error: La respuesta de la API no es válida."
    rm -f response.json
    exit 1
fi

# Extraer datos con jq
ID=$(jq -r '.id' response.json)
NAME=$(jq -r '.name' response.json)
WEIGHT=$(jq -r '.weight' response.json)
HEIGHT=$(jq -r '.height' response.json)
ORDER=$(jq -r '.order' response.json)

# Imprimir los datos
echo "$NAME (No. $ID)"
echo "Id = $ID"
echo "Weight = $WEIGHT"
echo "Height = $HEIGHT"
echo "Order = $ORDER"

# Verificar si el archivo CSV existe, si no, agregar la cabecera
if [ ! -f "$CSV_FILE" ]; then
    echo "id,name,weight,height,order" > "$CSV_FILE"
fi

# Agregar los datos al archivo CSV
echo "$ID,$NAME,$WEIGHT,$HEIGHT,$ORDER" >> "$CSV_FILE"

# Limpiar archivo temporal
rm -f response.json

#!/bin/bash

# Verificar si se pasó un parámetro
if [ -z "$1" ]; then
  echo "Por favor, ingresa el nombre de un Pokémon."
  exit 1
fi

# Nombre del Pokémon desde el primer parámetro
pokemon_name=$1

# Realizar la consulta a la PokeAPI
response=$(curl -s "https://pokeapi.co/api/v2/pokemon/$pokemon_name")

# Verificar si la respuesta contiene un error (si el Pokémon no existe)
if echo "$response" | jq -e '.detail' > /dev/null; then
  echo "El Pokémon '$pokemon_name' no fue encontrado."
  exit 1
fi

# Parsear la respuesta JSON usando jq
id=$(echo "$response" | jq '.id')
name=$(echo "$response" | jq -r '.name')
weight=$(echo "$response" | jq '.weight')
height=$(echo "$response" | jq '.height')
order=$(echo "$response" | jq '.order')

# Imprimir los resultados
echo "$name (No. $id)"
echo "Id = $id"
echo "Weight = $weight"
echo "Height = $height"
echo "Order = $order"
echo ""

# Guardar los resultados en un archivo CSV (concatenado)
echo "$id,$name,$weight,$height,$order" >> pokemon_data.csv

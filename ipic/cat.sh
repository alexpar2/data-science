#!/bin/bash
# Mi versión de cat

for archivo in "$@"; do
    if [ -f "$archivo" ]; then
        while IFS= read -r linea; do
            printf "%s\n" "$linea"
        done < "$archivo"
    else
        echo "Error: '$archivo' no existe o no es un archivo regular." >&2
    fi
done

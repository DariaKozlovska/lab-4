#!/bin/bash

show_date() {
    echo "Dzisiejsza data: $(date +'%Y-%m-%d')"
}

while [[ $# -gt 0 ]]; do
    key="$1"

    case $key in
        --date)
            show_date
            exit 0
            ;;
        *)
            echo "Nieznana flaga: $key. Użyj --date, aby wyświetlić dzisiejszą datę."
            exit 1
            ;;
    esac
    shift
done

#!/bin/bash

create_logs() {
    for ((i=1; i<=100; i++)); do
        filename="log${i}.txt"
        echo "Nazwa pliku: $filename" > "$filename"
        echo "Nazwa skryptu: $0" >> "$filename"
        echo "Data: $(date +'%Y-%m-%d %H:%M:%S')" >> "$filename"
    done
}

while [[ $# -gt 0 ]]; do
    key="$1"

    case $key in
        --logs)
            create_logs
            exit 0
            ;;
        *)
            echo "Nieznana flaga: $key. Użyj --logs, aby utworzyć 100 plików logowych."
            exit 1
            ;;
    esac
    shift
done


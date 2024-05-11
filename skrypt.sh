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

#!/bin/bash

create_logs() {
    local num_logs=$1
    for ((i=1; i<=$num_logs; i++)); do
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
            if [[ -z $2 ]]; then
                echo "Brak określonej liczby plików. Użyj --logs <liczba_plików>."
                exit 1
            fi
            create_logs "$2"
            exit 0
            ;;
        *)
            echo "Nieznana flaga: $key. Użyj --logs <liczba_plików>, aby utworzyć określoną liczbę plików logowych."
            exit 1
            ;;
    esac
    shift
done

#!/bin/bash

print_help() {
    echo "Użycie: ./skrypt.sh [OPCJE]"
    echo "Dostępne opcje:"
    echo "  --help      Wyświetla pomoc"
    echo "  --logs N    Tworzy N plików logowych"
    echo "  --date      Wyświetla dzisiejszą datę"
}

while [[ $# -gt 0 ]]; do
    key="$1"

    case $key in
        --help)
            print_help
            exit 0
            ;;
        *)
            echo "Nieznana flaga: $key. Użyj --help, aby wyświetlić wszystkie możliwe opcje."
            exit 1
            ;;
    esac
    shift
done



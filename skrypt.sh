#!/bin/bash

show_date() {
    echo "Dzisiejsza data: $(date +'%Y-%m-%d')"
}

while [[ $# -gt 0 ]]; do
    key="$1"

    case $key in
        --date -d)
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
        --logs -l)
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

print_help() {
    echo "Użycie: ./skrypt.sh [OPCJE]"
    echo "Dostępne opcje:"
    echo "  --help, -h      Wyświetla pomoc"
    echo "  --logs N, -l N  Tworzy N plików logowych"
    echo "  --date, -d      Wyświetla dzisiejszą datę"
}

while [[ $# -gt 0 ]]; do
    key="$1"

    case $key in
        --help|-h)
            print_help
            exit 0
            ;;
        --logs|-l)
            if [[ -z $2 ]]; then
                echo "Brak określonej liczby plików. Użyj --logs <liczba_plików> lub -l <liczba_plików>."
                exit 1
            fi
            num_logs="$2"
            shift
            ;;
        --date|-d)
            echo "Dzisiejsza data: $(date +'%Y-%m-%d')"
            exit 0
            ;;
        *)
            echo "Nieznana flaga: $key. Użyj --help lub -h, aby wyświetlić wszystkie możliwe opcje."
            exit 1
            ;;
    esac
    shift
done

if [[ -n $num_logs ]]; then
    echo "Tworzenie $num_logs plików logowych..."
    # Tutaj dodaj kod do tworzenia plików logowych
fi



#!/bin/bash

function show_date() {
  echo "data: $(date)"
}

if [ "$1" = "--logs" ]; then
    for i in $(seq 1 100); do
        filename="log${i}.txt"
        echo "Nazwa: $filename" > "$filename"
        echo "Skrypt: $0" >> "$filename"
        echo "Data: $(date)" >> "$filename"
    done
fi
if [ "$1" = "--logs30" ]; then
    for i in $(seq 1 30); do
        filename="log${i}.txt"
        echo "Nazwa: $filename" > "$filename"
        echo "Skrypt: $0" >> "$filename"
        echo "Data: $(date)" >> "$filename"
    done
fi

function create_errors() {
  local number=$1
  for i in $(seq 1 $number); do
    echo "Error in file $i" > "error$i.txt"
  done
  echo "Created $number error files."
}


function help_menu() {
  echo " --help pomoc"
  echo "--date  dzisiejsza data"
  echo "--logs pliki 1-100"
  echo "--init  klonowanie"
  echo "--error  "
}

case "$1" in
  -h|--help)
    help_menu
    ;;
  -d|--date)
    show_date
    ;;
  -l|--logs)
    create_logs "$2"
    ;;
  --init)
    git clone https://github.com/EweKis/lab4.git
    cd lab4 || exit
    export PATH="$PATH:$(pwd)"
    ;;

esac
if [ "$1" = "--tag" ]; then
    git tag v1.0
    git push origin v1.0
fi

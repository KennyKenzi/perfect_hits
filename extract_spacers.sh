#!/bin/bash



blastn -query "$1" -subject "$2" -task "blastn-short" -outfmt "6 std" -out temp_file

awk '$2 == 100 && $3==$4' temp_file > "$3"
wc -l "$3" 
rm temp_file
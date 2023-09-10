#!/bin/bash



# blastn -query "$1" -subject "$2" -task "blastn-short" -outfmt "6 std" -out temp_file

# awk '$2 == 100 && $3==$4' temp_file > "$3"
# wc -l "$3" 
# rm temp_file

blastn -query "$1" -subject "$2" -task "blastn-short" -outfmt "6 std qlen " -out temp_file

awk '$3 == 100 && $4==$13' temp_file > temp_1

awk '{print $2, $9, $10}' temp_1 > temp_1a

awk '{
    col1[NR] = $2
    col2[NR] = $3
}
END {
    for (i = 1; i < NR; i++) {

            col1[i] = col2[i]
            col2[i] = col1[i+1]
 
    }

    for (i = 1; i <= NR; i++) {
        print $1, col1[i], col2[i]-1
    }
}' temp_1a > temp_2.bed



seqtk subseq "$2" temp_2.bed > "$3"

wc -l "$3" 
rm temp_file temp_2.bed temp_3
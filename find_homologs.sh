#!/bin/bash

query="$1"
subject="$2"
output="$3"

tblastn -query "$query" -subject "$subject" -outfmt '6 std qlen' |
awk 'BEGIN {OFS="\t"} $3 > 30 && $4 > 0.90*$13 {print $1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12}' > "$output"

wc -l < "$output"

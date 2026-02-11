#!/bin/bash

declare -a id_list

while read -r line; do
    if [[ $line =~ id:\ ([0-9]+) ]]; then
        id_list+=("${BASH_REMATCH[1]}")
    fi
done < <(xsetwacom --list)

for id in "${id_list[@]}"; do
    xsetwacom set "$id" Rotate ccw
done

#!/bin/bash
# 1. Replace with your target directory
baseDir="$(pwd)/five-year-journal" 
# 2. Replace with your start and end year
startYear=2025
endYear=2029

mkdir -p "$baseDir"

for month in $(seq -w 1 12); do
    monthDir="$baseDir/$month"
    mkdir -p "$monthDir"
    # Calculate max days in month
    if [ "$month" = "02" ]; then
        maxDays=29
    elif [ "$month" = "04" ] || [ "$month" = "06" ] || [ "$month" = "09" ] || [ "$month" = "11" ]; then
        maxDays=30
    else
        maxDays=31
    fi
    for day in $(seq -w 1 $maxDays); do
        dayFolder="$monthDir/$month-$day"
        mkdir -p "$dayFolder"
        for year in $(seq $startYear $endYear); do
            # Only create 02-29 for leap years
            if [ "$month" = "02" ] && [ "$day" = "29" ]; then
                if ! ( (( $year % 4 == 0 && $year % 100 != 0 )) || (( $year % 400 == 0 )) ); then
                    continue
                fi
            fi
            fileName="$year-$month-$day.md"
            filePath="$dayFolder/$fileName"
            # 3. Generate file content (YAML tags + title)
            echo "---
tags: [daily]
---

# $year-$month-$day Journal

- " > "$filePath"
        done
    done
done

echo "Journal templates generated for $startYear to $endYear! Path: $baseDir"
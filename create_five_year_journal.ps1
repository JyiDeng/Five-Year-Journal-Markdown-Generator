# 1. Replace with your target directory
$baseDir = "F:\Light_Projects\five-year-journal"  
# 2. Replace with your start and end year
$startYear = 2025  
$endYear = 2029 

# Create all months and day folders
foreach ($month in 1..12) {
    $monthStr = $month.ToString("00")
    $monthDir = Join-Path $baseDir $monthStr
    New-Item -ItemType Directory -Path $monthDir -Force | Out-Null

    # Calculate max days in month (handle leap year for Feb)
    $maxDays = 31
    if ($month -eq 2) {
        $maxDays = 29
    } elseif ($month -in 4,6,9,11) {
        $maxDays = 30
    }

    foreach ($day in 1..$maxDays) {
        $dayStr = $day.ToString("00")
        $dayFolder = Join-Path $monthDir "$monthStr-$dayStr"
        New-Item -ItemType Directory -Path $dayFolder -Force | Out-Null

        foreach ($year in $startYear..$endYear) {
            # Only create 02-29 for leap years
            if ($month -eq 2 -and $day -eq 29) {
                if (-not [DateTime]::IsLeapYear($year)) { continue }
            }
            $fileName = "$year-$monthStr-$dayStr.md"
            $filePath = Join-Path $dayFolder $fileName

            # 3. Generate file content (YAML tags + title)
            $fileContent = @"
---
tags: [daily]
---

# $year-$monthStr-$dayStr Journal

"@
            # Add year block
            $fileContent += @"
- 
"@
            # Write file (UTF-8, compatible with Obsidian)
            [System.IO.File]::WriteAllText($filePath, $fileContent, [System.Text.Encoding]::UTF8)
        }
    }
}

Write-Host "Journal templates generated for $startYear to $endYear! Path: $baseDir"

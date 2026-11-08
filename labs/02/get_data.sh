#!/usr/bin/env bash

# Task 4 - Download and inspect cinema attendance data
#
# This script downloads the Stuttgart cinema dataset
# and prints basic information about the CSV file.
#
# Run with: ./get_data.sh
#
# Source: Statistisches Amt der Landeshauptstadt Stuttgart
# Original data source: Filmfoerderungsanstalt (FFA)
# Dataset: Kinos und Filmbesucher
# Licence: CC BY 4.0
# https://creativecommons.org/licenses/by/4.0/
#
# Attribution:
# "Kinos und Filmbesucher", Statistisches Amt der
# Landeshauptstadt Stuttgart, based on FFA data.
# https://opendata.stuttgart.de/dataset/kinos-und-filmbesucher

# Download URL and target file
URL="https://opendata.stuttgart.de/dataset/6ba6a607-4490-48ad-8b7d-4318e2b36433/resource/8baa9317-34bb-4060-87a1-16261ce9af62/download/kinos_und_filmbesucher_in_stuttgart_seit_1981.csv"

TARGET="data/raw/stuttgart_kino.csv"

# Create directory
mkdir -p data/raw

# Download dataset
curl -fL -o "$TARGET" "$URL" || exit 1

# Record download information
echo "$(date '+%Y-%m-%d %H:%M:%S') | $URL | $TARGET" >> data/raw/SOURCES.txt

# Print basic information
echo "== Size"
ls -lh "$TARGET"

echo "== Type and Encoding"
file "$TARGET"

echo "== Lines"
wc -l < "$TARGET"

echo "== Columns"
head -n 1 "$TARGET" | awk -F';' '{print NF}'

echo "== First three lines"
head -n 3 "$TARGET"

# Comparison with Lab 1:
# In dataset.md, I counted 264 data rows and 3 columns.
# The script reports 265 lines because the CSV also contains
# one header row. Therefore, the results are consistent.
# The file uses UTF-8 encoding and CRLF line endings.

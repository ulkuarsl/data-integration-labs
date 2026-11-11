# Lab 3 – Version Control Software

## Overview

This folder contains the files and documentation for Lab 3 of the Data Integration course.

The lab focuses on Git version control, reproducible data downloads, commit history, branching and collaboration.

## Dataset

I use the dataset **"Kinos und Filmbesucher in Stuttgart seit 1981"** from the Open Data Portal of the City of Stuttgart.

The dataset contains information about cinemas and cinema attendance in Stuttgart.

- **Source:** Open Data Portal Stuttgart
- **License:** Creative Commons Attribution 4.0 International (CC BY 4.0)
- **Format:** CSV
- **Encoding:** UTF-8
- **Separator:** Semicolon (`;`)

## Reproducing the Data

To download the dataset, clone the repository and run the following command from the repository's root directory:

```bash
./labs/03/get_data.sh
```

The script downloads the CSV file to:

```text
data/raw/stuttgart_kino.csv
```

It also records the source URL and download time in:

```text
data/raw/SOURCES.txt
```

The downloaded files are excluded from Git using `.gitignore`.

## Verifying the Data

The SHA-256 checksum is stored in `labs/03/checksums.sha256`.

To verify the downloaded dataset, run the following command from the repository's root directory:

```bash
sha256sum -c labs/03/checksums.sha256
```

If the file matches the recorded checksum, the terminal displays:

```text
data/raw/stuttgart_kino.csv: OK
```

## Files

- `graph.md` – Git graph predictions and results.
- `git.md` – Git setup, commit history and undo operations.
- `get_data.sh` – Script for downloading the dataset.
- `.gitignore` – Rules for excluding raw data.
- `README.md` – Instructions for reproducing the data.
- `checksums.sha256` – SHA-256 checksum of the downloaded dataset.

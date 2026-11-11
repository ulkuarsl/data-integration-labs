# Data Integration Labs

This repository contains my lab assignments and exercises for the Data Integration module at TH Köln.

## About

- **Student:** Sebahat Ülkü Arslan
- **GitHub:** [ulkuarsl](https://github.com/ulkuarsl)
- **Course Repository:** [Data Integration](https://github.com/breuert/data-integration)
- **Team Project Repository:** [Projekt](https://github.com/chaymaeloukili/data-integration-projekt)

## Labs

| Lab | Description | Link |
|-----|-------------|------|
| 01 | GitHub, Markdown, Open Source and Open Data | [Lab 01](labs/01/) |

## Licence

The code in this repository is licensed under the [MIT License](LICENSE).

Original written content is licensed under CC BY 4.0.

Datasets and materials from external sources retain their original licences and must be credited accordingly.

------

Data: "Kinos und Filmbesucher", Statistisches Amt der Landeshauptstadt Stuttgart, based on information from the Filmförderungsanstalt (FFA), available at OpenData Stuttgart, licensed under CC BY 4.0.

The original data has not been modified at this stage.

If I clean, transform or combine the dataset later, I will indicate the changes.

Sources:
- (https://opendata.stuttgart.de/dataset/kinos-und-filmbesucher)
- (https://creativecommons.org/licenses/by/4.0/)


## Lab 3 – Reproducible Data Download

### Dataset

For this lab, I use the dataset **"Kinos und Filmbesucher in Stuttgart seit 1981"** from the Open Data Portal of the City of Stuttgart.

The dataset contains information about cinemas and cinema attendance in Stuttgart.

- **Source:** Open Data Portal Stuttgart
- **License:** CC BY 4.0
- **Format:** CSV
- **Encoding:** UTF-8
- **Separator:** Semicolon (`;`)

### Downloading the Data

The dataset can be downloaded by running the following command from the repository's root directory:

```bash
./labs/03/get_data.sh
```

The script downloads the CSV file to:

```text
data/raw/stuttgart_kino.csv
```

It also records the source URL and download time in `data/raw/SOURCES.txt`.

### Ignoring Raw Data

The `.gitignore` file contains the following rule:

```gitignore
data/raw/
```

This prevents downloaded raw data files from being accidentally added to the Git repository.

The download script is tracked by Git, so the dataset can be downloaded again when needed.

### Data Integrity

I calculated a SHA-256 checksum for the downloaded CSV file.

The checksum is stored in:

```text
labs/03/checksums.sha256
```

To verify the downloaded file, run:

```bash
sha256sum -c labs/03/checksums.sha256
```

The verification result was:

```text
data/raw/stuttgart_kino.csv: OK
```

This confirms that the downloaded file matches the recorded checksum.

### Git Workflow

I used small, meaningful commits to document the individual steps:

1. `Ignore downloaded raw data files`
2. `Add reproducible cinema data download script`
3. `Add SHA-256 checksum for cinema dataset`

This makes the development history easier to understand.

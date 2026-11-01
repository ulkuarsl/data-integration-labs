# Dataset Analysis - Cinema Attendance Trends
## Task 5 - Find Dataset
### 1. Dataset Search

For my Data Integration project, I am interested in cinema attendance trends in Germany.

I want to explore how cinema attendance has changed over time, especially before, during and after the COVID-19 pandemic.

I am also interested in the possible relationship between cinema attendance and the increasing popularity of streaming services.

To find suitable data, I searched different open data platforms.

#### Source 1: GovData
**Link:** [Kinos und Filmbesucher](https://www.govdata.de/suche/daten/kinos-und-filmbesucher)
**Format:** CSV

I found a dataset called "Kinos und Filmbesucher", published by the Statistical Office of Stuttgart.

The dataset contains information about cinema attendance, cinemas, screens and seats in Stuttgart.

It is available as a CSV file and covers the years 1981–2025.



#### Source 2: Kaggle
**Link:** [Letterboxd Movie Ratings Data](https://www.kaggle.com/datasets/samlearner/letterboxd-movie-ratings-data)
**Format:** CSV
**License:** CC BY 4.0 (as stated on Kaggle)

**Description:**
This dataset contains movie information, user ratings and user data collected from Letterboxd. The movie data was also enriched with information from TMDB.
It includes three CSV files:

`movie_data.csv`
`ratings_export.csv`
`users_export.csv`

**Possible use:**
I could use this dataset to analyze movie genres, user ratings and film popularity.

It could help me explore audience preferences and identify patterns in movie ratings.

However, the dataset does not directly measure cinema attendance. It also contains scraped data, so the original sources and their usage conditions need to be considered.



#### Source 3: GovData
**Link:** [Kinos and Filmbesucher im Großstadtvergleich](https://www.govdata.de/suche/daten/kinos-und-filmbesucher-im-grossstadtvergleich)
**Format:** CSV
**License:** CC BY 4.0
**Data source:** FFA

**Description:** 
This dataset contains statistics about cinema attendance in major German cities.
It provides information about:

- Number of cinema locations
- Number of cinema screens
- Number of cinema seats
- Number of cinema visits

**Possible use:**
I could use this dataset to compare cinema attendance trends between different German cities.

It would also allow me to investigate changes before and after the COVID-19 pandemic.

One limitation is that the criteria for including cities changed in 2022. Therefore, comparisons across years require careful attention to the cities included.


### 2. Search like a machine
| API | Hit (count) | Titel of the first hit | Where the licence is given |
|-----|-------------|------------------------|----------------------------|
| GovData | 129 | Kino | `license_id` is empty `resource[].license` is empty for all 6 resources|

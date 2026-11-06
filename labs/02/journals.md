# Task 3 – Mine half a million journal articles

## Question 1: Shape

### Column names

**Command:**

```bash
head -n 1 2014-01_JA.tsv | tr '\t' '\n' | cat -n
```

**Output:**

```text
     1  File
     2  Creator
     3  Issue
     4  Volume
     5  Journal
     6  ISSN
     7  ID
     8  Citation
     9  Title
    10  Place Labe
    11  Language
    12  Publisher
    13  Date
```

**Answer:**

The dataset contains 13 columns. The name of column 10, `Place Labe`, is truncated. It was probably intended to be `Place Label`.

# Task 3 – Mine Half a Million Journal Articles

## Question 1: Shape

### 1. Column names

**Command:**

```bash
head -n 1 2014-01_JA.tsv | tr '\t' '\n' | cat -n
```

**Output:**

```text
     1  File
     2  Creator
     3  Issue
     4  Volume
     5  Journal
     6  ISSN
     7  ID
     8  Citation
     9  Title
    10  Place Labe
    11  Language
    12  Publisher
    13  Date
```

### 2. Comparing headers

**Command:**

```bash
for file in *.tsv; do
    echo "$file"
    head -n 1 "$file"
done
```

**Output:**

All four files have the same header:

```text
File | Creator | Issue | Volume | Journal | ISSN | ID | Citation | Title | Place Labe | Language | Publisher | Date
```

### 3. Number of articles

**Command:**

```bash
wc -l *.tsv
```

**Output:**

```text
13712 2014-01-31_JA-africa.tsv
27392 2014-01-31_JA-america.tsv
507732 2014-01_JA.tsv
5375 2014-02-02_JA-britain.tsv
554211 total
```

**Answer:**

The dataset contains 13 columns. Column 10, `Place Labe`, has a truncated name, 
which was probably meant to be `Place Label`.

All four TSV files have identical headers.

After subtracting the header row, the files contain 13,711 articles (Africa), 
27,391 articles (America), 507,731 articles (January) and 5,374 articles (Britain).

## Question 2: Missing Values

**Command:**

```bash
cut -f 11 2014-01_JA.tsv | sort | uniq -c | sort -nr | head -n 20
```

**Output:**

```text
403284 eng
 40155 fre
 36100
 28192 ger
     1 Language
```

**Answer:**

There are **36,100 articles with missing language information**.

The dataset contains three languages: English (`eng`) with 403,284 articles, French (`fre`) with 40,155 articles, and German (`ger`) with 28,192 articles.

The value `Language` is the column header and is not counted as an article.

## Question 3: Years

**Commands:**

```bash
tail -n +2 2014-01_JA.tsv | cut -f 13 | sort | uniq -c | sort -nr | head -n 20

tail -n +2 2014-01_JA.tsv | cut -f 13 | sort -n | uniq -c | tail -n 20

cut -f 5,8,9,13 2014-01_JA.tsv | grep '2077$' | head -n 5
```

**Output (shortened):**

```text
30813 1997
28215 1998
27968 1996
27916 2002
27335 2001
```

```text
25831 2008
25264 2009
24912 2010
24788 2011
21804 2012
8430 2013
20 2077
```

```text
FRANCAIS DANS LE MONDE  FRANCAIS DANS LE MONDE 353(SUPP), 2-2. (2077)  Le francais, frein au developpement de l'Afrique?  2077
```

**Answer:**

The year with the most articles is **1997**, with 30,813 articles.

The year **2077** is incorrect because the dataset is from 2014. There are 20 articles with this invalid year, all published in the journal *FRANCAIS DANS LE MONDE*.

The correct year was probably **2007**, because issue 353 of the journal was published in 2007.

## Question 4: Lines are not fields

**Commands:**

```bash
grep -ic 'africa' 2014-01_JA.tsv
cut -f 9 2014-01_JA.tsv | grep -ic 'africa'
```

**Output:**

```text
33577
13711
```

**Answer:**

The word `africa` appears in 33,577 lines of the dataset, but only 13,711 article titles contain it.

The numbers differ because the first command searches the entire line, including all columns, while the second command searches only the `Title` column.

## Question 5: Where does a file come from?

### Africa file

**Commands:**

```bash
tail -n +2 2014-01_JA.tsv | cut -f 9 | grep -i 'africa' > africa_original.txt
tail -n +2 2014-01-31_JA-africa.tsv | cut -f 9 > africa_file.txt
diff africa_original.txt africa_file.txt | head -n 20
```

**Output:**

```text
No output.
```

**Answer:**

The comparison shows no differences. The article titles in the Africa file match the titles containing `africa` in the original dataset.

### America file

**Commands:**

```bash
tail -n +2 2014-01_JA.tsv | cut -f 9 | grep -i 'america' > america_original.txt
tail -n +2 2014-01-31_JA-america.tsv | cut -f 9 > america_file.txt
diff america_original.txt america_file.txt | head -n 20
```

**Output:**

```text
12280c12280
< British Trade with Spanish America, 1763Ã¯Â¿Â½1808 - by Pearce, A. J.
---
> British Trade with Spanish America, 1763ï¿½1808 - by Pearce, A. J.
```

**Answer:**

The Africa file matches the original dataset, but the America file contains a difference in one article title.

The difference is probably caused by a character encoding problem. The title is the same, but a character in the date range is represented differently.

Therefore, the claim is correct for the Africa file, but the America file is not an exact match.

## Question 6: Spreadsheet Damage

### 1. Most frequent Issue values

**Command:**

```bash
tail -n +2 2014-01_JA.tsv | cut -f 3 | sort | uniq -c | sort -nr | head -n 20
```

**Output:**

```text
99743 1
96514 2
75421 3
58325 4
30668
9650 5
5325 6
4219 01-Feb
3157 03-Apr
2736 7
2077 8
2035 10
2009 12
1965 11
1829 9
1731 02-Mar
793 SUM
781 AUT
732 WIN
707 SPR
```

### 2. Comparing Issue and Citation

**Commands:**

```bash
cut -f 3,8 2014-01_JA.tsv | grep '^01-Feb' | head -n 10
cut -f 3,8 2014-01_JA.tsv | grep '^03-Apr' | head -n 10
cut -f 3,8 2014-01_JA.tsv | grep '^02-Mar' | head -n 10
```

**Output (shortened):**

```text
01-Feb  WASHINGTON MONTHLY 28(1/2), 4-9. (1996)
03-Apr  INTERNATIONALES ASIENFORUM 26(3/4), 233-248. (1995)
02-Mar  NORTHEAST AFRICAN STUDIES 1(2/3), 7-18. (1994)
```

### 3. Number of affected rows

**Command:**

```bash
tail -n +2 2014-01_JA.tsv | cut -f 3 | grep -Ec '^[0-9]{2}-[A-Za-z]{3}$'
```

**Output:**

```text
11632
```

### Answer

Some values in the `Issue` column were incorrectly converted into dates.

For example, `1/2` became `01-Feb`, `3/4` became `03-Apr`, and `2/3` became `02-Mar`.

By comparing the `Issue` and `Citation` columns, I found that the original issue numbers were written as fractions.

This was probably caused by automatic date conversion in spreadsheet software such as Excel.

A total of **11,632 rows contain date-formatted Issue values**, which suggests that these rows may have been affected by this conversion.

Other non-numeric values, such as `SUM`, `AUT`, `WIN` and `SPR`, represent seasons and are not necessarily errors.

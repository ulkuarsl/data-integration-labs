# Task 6 – Analyzing Git History

## 1. Repository

For this task, I analyzed the Git history of the following public repository:

**Repository:** `datasets/co2-ppm`

**URL:** https://github.com/datasets/co2-ppm

The repository contains atmospheric CO₂ datasets.

I cloned it using:

```bash
git clone https://github.com/datasets/co2-ppm.git
cd co2-ppm
```

I used Git commands to investigate the repository's history, contributors, commits and changes to individual files.

## 2. General commit history

First, I inspected the latest ten commits:

```bash
git log -10 --oneline
```

The latest commits included:

```text
52f2be5 Commit from GitHub Actions (Update Data from NOAA)
8c40972 Commit from GitHub Actions (Update Data from NOAA)
c38f24f Commit from GitHub Actions (Update Data from NOAA)
146bdc6 Commit from GitHub Actions (Update Data from NOAA)
7a67754 Commit from GitHub Actions (Update Data from NOAA)
9f751e7 Commit from GitHub Actions (Update Data from NOAA)
15827da Commit from GitHub Actions (Update Data from NOAA)
46baae2 feat(chart): add Keeling Curve Observable Plot view with 350/400ppm reference lines
5518b6c Fix co2-ppm simple views for reliable rendering
4ae30e8 fix: harden NOAA fetch and restore co2-mm-mlo output
```

Many recent commit messages indicate that CO₂ data is updated through GitHub Actions.

This suggests that the repository uses automated updates.

## 3. First and latest commits

I used the following command to identify the first commit:

```bash
git log --reverse --format="%h %ad %s" --date=short | head -n 1
```

**Output:**

```text
9f88bbd 2015-01-05 [README][m]: (old: ?) unfinished README.
```

The earliest commit in the current branch's history was created on **January 5, 2015**.

To inspect the latest commit, I used:

```bash
git log -1 --format="Commit: %h%nAuthor: %an%nEmail: %ae%nDate: %ad%nMessage: %s"
```

**Output:**

```text
Commit: 52f2be5
Author: github-actions
Email: 41898282+github-actions[bot]@users.noreply.github.com
Date: Sun Nov 1 02:55:57 2026 +0000
Message: Commit from GitHub Actions (Update Data from NOAA)
```

The latest commit in my local copy was created on **November 1, 2026**, by the GitHub Actions bot.

## 4. Number of commits

I counted the commits using:

```bash
git rev-list --count HEAD
```

**Output:**

```text
95
```

The current `main` branch contained **95 commits** at the time of my analysis.

## 5. Changes in the latest commit

I used:

```bash
git show --stat --oneline HEAD
```

**Output:**

```text
52f2be5 Commit from GitHub Actions (Update Data from NOAA)

data/co2-annmean-gl.csv |   8 +-
data/co2-gr-gl.csv      |  18 ++--
data/co2-gr-mlo.csv     |   2 +-
data/co2-mm-gl.csv      | 213 ++++++++++++++++++++++++------------------------
data/co2-mm-mlo.csv     |  81 +++++++++---------

5 files changed, 162 insertions(+), 160 deletions(-)
```

The latest commit modified five CSV files.

In total, **162 lines were added** and **160 lines were removed**.

This shows that the commit updated existing data rather than only adding new files.

## 6. History of a specific file

I investigated the file:

`data/co2-mm-mlo.csv`

I used:

```bash
git log -5 --oneline -- data/co2-mm-mlo.csv
```

**Output:**

```text
52f2be5 Commit from GitHub Actions (Update Data from NOAA)
8c40972 Commit from GitHub Actions (Update Data from NOAA)
c38f24f Commit from GitHub Actions (Update Data from NOAA)
146bdc6 Commit from GitHub Actions (Update Data from NOAA)
7a67754 Commit from GitHub Actions (Update Data from NOAA)
```

All five commits were labeled as data updates from NOAA.

I also checked the last modification date:

```bash
git log -1 --format="%ad" --date=short -- data/co2-mm-mlo.csv
```

**Output:**

```text
2026-11-01
```

The file was last modified in the repository on **November 1, 2026**.

## 7. Inspecting changes with git diff

I used the following command to inspect the most recent changes to the file:

```bash
git log -1 -p -- data/co2-mm-mlo.csv
```

The output showed the differences between the previous and current versions.

For example, a value for December 1975 changed:

```diff
-1975-12,1975.9583,330.77,331.74,-01,-9.99,0.00
+1975-12,1975.9583,330.77,331.73,-01,-9.99,0.00
```

Another value for October 1993 changed:

```diff
-1993-10,1993.7917,354.23,357.61,28,0.29,0.11
+1993-10,1993.7917,354.23,357.60,28,0.29,0.11
```

These examples show that older data points can be corrected during later updates.

This is important when working with scientific datasets because the data may change even for historical periods.

Git makes these changes transparent and traceable.

## 8. Contributors

I used:

```bash
git shortlog -sne HEAD
```

The output included:

```text
30  github-actions
26  Soren Jones
14  Søren Jones
 7  Rufus Pollock
 5  Ola Rubaj
 4  mikanebu
 2  Luccas Gomes
 2  subhankar
 1  Anuar Ustayev (aka Anu)
 1  Joel
 1  Yoana Popova
 1  anuveyatsu
 1  mayor
```

According to the Git author metadata, `github-actions` appeared most frequently, with **30 commits**.

The names `Soren Jones` and `Søren Jones` shared the same email address but were listed separately because Git groups contributions by author identity.

The output also contained multiple author names associated with Anuar Ustayev's email address.

Therefore, the number of entries in `git shortlog` does not necessarily equal the number of unique contributors.

## 9. What I learned

Git history provides useful information about the development and maintenance of a dataset.

With `git log`, I can inspect previous commits, their authors, dates and messages.

With `git show`, I can see which files were changed in a commit.

With `git log -p`, I can inspect the actual changes to a file.

With `git shortlog`, I can investigate contributors and their commit counts.

The `co2-ppm` repository demonstrates why version control is useful for data projects: it allows users to track updates, identify corrections to historical data and understand how a dataset has changed over time.

It also shows that Git can be used not only for software development but also for maintaining datasets.

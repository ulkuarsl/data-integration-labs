# Task 5 – Branches and Merge Conflicts

## 1. Creating the initial CSV file

First, I created the file `labs/03/countries.csv` with five countries and their ISO3 codes.

```csv
name,iso3
Czech Republic,CZE
Germany,DEU
Macedonia,MKD
Swaziland,SWZ
Turkey,TUR
```

I committed the file using:

```bash
git add labs/03/countries.csv
git commit -m "Add initial country code mapping"
```

Commit: `db9a470`

## 2. Creating a branch and performing a fast-forward merge

I created a new branch:

```bash
git switch -c feature/iso2
```

On this branch, I added an `iso2` column to the CSV file.

After committing the changes, I switched back to `main` and merged the branch:

```bash
git switch main
git merge feature/iso2
```

Git displayed:

```text
Updating db9a470..aa8e607
Fast-forward
```

The merge was a fast-forward merge because `main` had not received any new commits since the branch was created.

Therefore, Git could move the `main` pointer forward without creating a separate merge commit.

## 3. Creating two different lines of development

I created another branch:

```bash
git switch -c feature/new-names
```

On this branch, I updated four country names:

- Czech Republic → Czechia
- Macedonia → North Macedonia
- Swaziland → Eswatini
- Turkey → Türkiye

I committed the changes:

```bash
git commit -m "Update country names to current official names"
```

Commit: `e9f4ae5`

Afterwards, I switched back to `main` and added a `numeric` column containing ISO numeric country codes.

```bash
git commit -m "Add numeric ISO country codes"
```

Commit: `7ebfb30`

At this point, the branches had diverged because they contained different commits based on the same earlier commit.

## 4. Creating a merge conflict

While on `main`, I tried to merge the feature branch:

```bash
git merge feature/new-names
```

Git displayed the following message:

```text
Auto-merging labs/03/countries.csv
CONFLICT (content): Merge conflict in labs/03/countries.csv
Automatic merge failed; fix conflicts and then commit the result.
```

Both branches had modified the same lines in `countries.csv`.

Git could not automatically decide how to combine the new country names with the additional numeric column.

The conflicted file contained:

```text
<<<<<<< HEAD
name,iso3,iso2,numeric
Czech Republic,CZE,CZ,203
Germany,DEU,DE,276
Macedonia,MKD,MK,807
Swaziland,SWZ,SZ,748
Turkey,TUR,TR,792
=======
name,iso3,iso2
Czechia,CZE,CZ
Germany,DEU,DE
North Macedonia,MKD,MK
Eswatini,SWZ,SZ
Türkiye,TUR,TR
>>>>>>> feature/new-names
```

The conflict markers have the following meanings:

- `<<<<<<< HEAD`: The version from the current branch (`main`).
- `=======`: The separator between the two versions.
- `>>>>>>> feature/new-names`: The version from the branch being merged.

## 5. Resolving the conflict

I resolved the conflict manually by keeping both changes: the updated country names and the numeric country codes.

The final CSV file contained:

```csv
name,iso3,iso2,numeric
Czechia,CZE,CZ,203
Germany,DEU,DE,276
North Macedonia,MKD,MK,807
Eswatini,SWZ,SZ,748
Türkiye,TUR,TR,792
```

I removed all conflict markers and checked the file:

```bash
cat labs/03/countries.csv
git diff --check
```

The `git diff --check` command produced no output.

Then I staged the resolved file:

```bash
git add labs/03/countries.csv
```

Git confirmed:

```text
All conflicts fixed but you are still merging.
```

To complete the merge, I used:

```bash
git commit -m "Merge country name updates and resolve CSV conflict"
```

## 6. What I learned

A fast-forward merge is possible when the target branch has not diverged from the feature branch.

A merge conflict can occur when two branches modify the same lines differently.

Git marks conflicting sections with `<<<<<<<`, `=======` and `>>>>>>>`.

To resolve a conflict, I must decide which changes to keep, remove the conflict markers, stage the corrected file and complete the merge commit.

In this exercise, I preserved the changes from both branches.

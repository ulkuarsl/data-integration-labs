### Most frequently changed files

I used the following command to find out which files were changed most frequently:

```bash
git log --name-only --format="" | grep -v '^$' | sort | uniq -c | sort -nr | head -n 10
```

The results showed that `labs/01/cheatsheet.md` and `AI_USAGE.md` were the most frequently changed files, each appearing in four commits.

The files `labs/01/open-source.md`, `labs/01/dataset.md` and `README.md` each appeared in three commits.

This shows that I updated my documentation several times while working on Labs 1 and 2.

### Commit email addresses

I checked the email addresses used in my previous commits with:

```bash
git log --format="%ae" | sort -u
```

The result showed that my previous commits used my personal Gmail address.

I also checked the email address configured for future commits:

```bash
git config user.email
```

The result was my GitHub `noreply` email address.

This means that my future commits will use the privacy-protecting `noreply` address instead of my personal email address.

Changing the Git configuration does not automatically change the email addresses in previous commits.


## Step by step

### Git history

I used the following command in the `labs/03` directory to examine the commit history:

```bash
git log --oneline -- .
```

**Output:**

```text
c1ef656 Add SHA-256 checksum for cinema dataset
4681355 Add reproducible cinema data download script
1953c28 Document Git setup and repository history
7fd95a5 Add Git operations predictions and results to graph.md
```

The output shows four commits that affected files in the `labs/03` directory.

### Ignored files

I used the following command to check which files Git ignores:

```bash
git status --ignored
```

**Output:**

```text
On branch main
Your branch is up to date with 'origin/main'.

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        undo-practice.txt

Ignored files:
  (use "git add -f <file>..." to include in what will be committed)
        ../../data/

nothing added to commit but untracked files present
```

The output confirms that Git ignores the `data/` directory because of the `.gitignore` rule.

The file `undo-practice.txt` is untracked because it was created for the undo exercises in Task 4.

### Questions

**1. Why does the `.gitignore` belong in the repository, but `data/raw/` does not?**

The `.gitignore` file should be included in the repository because it defines which files Git should ignore. This ensures that all team members use the same rules.

The `data/raw/` directory contains downloaded datasets that can be recreated using the download script. Therefore, these files do not need to be stored in Git.

**2. What does a teammate need to get the raw data?**

A teammate needs to clone the repository and run the download script from the repository's root directory:

```bash
./labs/03/get_data.sh
```

The script downloads the dataset from the original source and saves it in `data/raw/`.

**3. How can a teammate verify the downloaded data?**

A teammate can verify the downloaded CSV file using:

```bash
sha256sum -c labs/03/checksums.sha256
```

If the file matches the recorded checksum, the terminal displays:

```text
data/raw/stuttgart_kino.csv: OK
```

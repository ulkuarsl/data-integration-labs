# Lab 3 – Version Control Software

## Task 2 – Setup

### Repository

I cloned my GitHub repository to my local computer.

Repository: `data-integration-labs`

GitHub URL: https://github.com/ulkuarsl/data-integration-labs

I used the following commands to inspect my repository:

```bash
git status
git remote -v
git log --oneline
```

**Git status:**

```text
On branch main
Your branch is up to date with 'origin/main'.

nothing to commit, working tree clean
```

**Git remote:**

```text
origin  https://github.com/ulkuarsl/data-integration-labs.git (fetch)
origin  https://github.com/ulkuarsl/data-integration-labs.git (push)
```

### Commit history

At the beginning of Lab 3, my repository contained **25 commits**.

I had created the previous commits through the GitHub web interface.

Some examples of my previous commit messages were:

```text
Add Git operations predictions and results to graph.md
Update AI usage documentation for Labs 1 and 2
Add Lab 2 Task 4 shell script and output
Create shell.md
Initial commit
```

### Improving commit messages

I selected two commit messages and rewrote them to make them more descriptive.

**Original message 1:**

`Create shell.md`

**Improved message:**

`Add Lab 2 shell environment analysis and Bashcrawl documentation`

**Original message 2:**

`Add Lab 2 Task 4 shell script and output`

**Improved message:**

`Add reproducible cinema data download script and verification results`

These messages describe more clearly what was added and why.

I did not change the original commit history. I only documented the improved messages.

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

This means that my future commits use the privacy-protecting `noreply` address instead of my personal email address.

Changing the Git configuration does not automatically change the email addresses of previous commits.

Enabling GitHub's email privacy settings helps protect my email address in future commits, but it cannot remove an email address that has already been recorded in the existing Git history.

### Most frequently changed files

I used the following command to find out which files appeared most frequently in my commit history:

```bash
git log --name-only --format="" | grep -v '^$' | sort | uniq -c | sort -nr | head -n 10
```

**Output:**

```text
4 labs/01/cheatsheet.md
4 AI_USAGE.md
3 labs/01/open-source.md
3 labs/01/dataset.md
3 README.md
2 labs/02/shell.md
1 labs/03/graph.md
1 labs/02/journals.md
1 labs/02/get_data.txt
1 labs/02/get_data.sh
```

The most frequently changed files were `labs/01/cheatsheet.md` and `AI_USAGE.md`, each appearing in four commits.

This shows that I updated my documentation several times while working on Labs 1 and 2.

### First commit and push from my computer

After cloning the repository, I created and edited `labs/03/git.md`.

I used the following commands to commit and push the file:

```bash
git add labs/03/git.md
git commit -m "Document Git setup and repository history"
git push origin main
```

The new commit was:

```text
1953c28 Document Git setup and repository history
```

**Git status before pushing:**

```text
On branch main

Your branch is ahead of 'origin/main' by 1 commit.
```

**Git status after pushing:**

```text
On branch main
Your branch is up to date with 'origin/main'.

nothing to commit, working tree clean
```

The push successfully uploaded my local commit to GitHub.

I learned that `git add` prepares changes, `git commit` saves them locally, and `git push` uploads commits to the remote repository.

---

## Task 3 – Step by step

### Copying the download script

I copied the download script from Lab 2 into Lab 3:

```bash
cp labs/02/get_data.sh labs/03/get_data.sh
```

The script downloads the dataset *Kinos und Filmbesucher in Stuttgart seit 1981* from Stuttgart's Open Data Portal.

I committed the script with:

```bash
git add labs/03/get_data.sh
git commit -m "Add reproducible cinema data download script"
```

### Ignoring raw data

I created a `.gitignore` file containing:

```gitignore
data/raw/
```

The rule prevents downloaded raw datasets from being included in the repository.

I checked whether Git ignored the dataset:

```bash
git check-ignore -v data/raw/stuttgart_kino.csv
```

**Output:**

```text
.gitignore:2:data/raw/  data/raw/stuttgart_kino.csv
```

This confirmed that the downloaded dataset was ignored.

I also created a `.gitignore` file in `labs/03/` as required by the assignment.

### Downloading the dataset

I ran the script from the repository's root directory:

```bash
./labs/03/get_data.sh
```

**Output (shortened):**

```text
== Size
8.0K

== Type and Encoding
Unicode text, UTF-8 text, with CRLF line terminators

== Lines
265

== Columns
3

== First three lines
Jahr;Kategorie;Wert
1981;Kinotheater;0,00
1982;Kinotheater;0,00
```

The dataset contains 265 lines, including the header, and three columns.

### Checking data integrity

I calculated a SHA-256 checksum:

```bash
sha256sum data/raw/stuttgart_kino.csv
```

**Output:**

```text
af960d0927cd5e19558ee1b53e4c31018504e902051d9bd8e7c67db09266829b *data/raw/stuttgart_kino.csv
```

I saved the checksum:

```bash
sha256sum data/raw/stuttgart_kino.csv > labs/03/checksums.sha256
```

Then I verified it:

```bash
sha256sum -c labs/03/checksums.sha256
```

**Output:**

```text
data/raw/stuttgart_kino.csv: OK
```

This confirmed that the downloaded file matched the recorded checksum.

### Interactive staging with git add -p

I made two separate changes to `get_data.sh`.

First, I added comments explaining the purpose and usage of the script:

```bash
# Downloads cinema attendance data from Stuttgart Open Data.
# Usage: Run from the repository root with ./labs/03/get_data.sh
```

Second, I added a command to print a Git checksum:

```bash
echo "== Checksum"
git hash-object --no-filters "$TARGET"
```

I inspected both changes with:

```bash
git diff get_data.sh
```

Then I used interactive staging:

```bash
git add -p get_data.sh
```

Git displayed two separate hunks.

For the first hunk, I answered `y` to stage the comments.

For the second hunk, I answered `n` to leave the checksum change unstaged.

I checked the selected changes:

```bash
git diff --staged
```

The output showed only the new comments.

I committed the first change:

```bash
git commit -m "Document how to run the cinema download script"
```

Then I staged and committed the remaining checksum change:

```bash
git add get_data.sh
git commit -m "Print Git checksum after downloading cinema data"
```

After running the script again, it printed:

```text
== Checksum
016b5409a29550215a74e585d8ee0dbca4591682
```

This exercise showed me how to use `git add -p` to separate unrelated changes into smaller, meaningful commits.

### Git history

I ran the following command in the `labs/03` directory:

```bash
git log --oneline -- .
```

**Output at the time of the exercise:**

```text
c1ef656 Add SHA-256 checksum for cinema dataset
4681355 Add reproducible cinema data download script
1953c28 Document Git setup and repository history
7fd95a5 Add Git operations predictions and results to graph.md
```

The output showed four commits affecting files in the `labs/03` directory at that point.

### Ignored files

I ran:

```bash
git status --ignored
```

**Output:**

```text
On branch main
Your branch is up to date with 'origin/main'.

Untracked files:
        undo-practice.txt

Ignored files:
        ../../data/

nothing added to commit but untracked files present
```

The output confirmed that Git ignored the downloaded data directory.

The file `undo-practice.txt` was untracked because I had created it for the undo exercises.

### Questions

**1. Why does the `.gitignore` belong in the repository, but `data/raw/` does not?**

The `.gitignore` file belongs in the repository because it defines which files Git should ignore. Sharing this file ensures that all team members use the same rules.

The `data/raw/` directory contains downloaded datasets that can be recreated using the download script. Therefore, these files do not need to be stored in Git.

**2. What does a teammate need to get the raw data?**

A teammate needs to clone the repository and run the download script from the repository's root directory:

```bash
./labs/03/get_data.sh
```

The script downloads the dataset from the original source and stores it in `data/raw/`.

**3. How can the downloaded data be verified?**

The teammate can verify the downloaded CSV file using:

```bash
sha256sum -c labs/03/checksums.sha256
```

If the file matches the recorded checksum, Git Bash displays `OK`.

---

## Task 4 – Undo

### 1. Restoring an accidentally deleted file

I deleted the download script using:

```bash
rm labs/03/get_data.sh
```

After deleting the file, I checked its status:

```bash
git status
```

**Output:**

```text
Changes not staged for commit:
    deleted: labs/03/get_data.sh
    modified: labs/03/git.md
```

I restored the deleted script using:

```bash
git restore labs/03/get_data.sh
```

Then I checked whether the file existed again:

```bash
ls labs/03/get_data.sh
```

**Output:**

```text
labs/03/get_data.sh
```

**What happened?**

Git restored the deleted script from its latest committed version.

The file was available again without creating a new commit.

**Which files could Git not have brought back?**

Git cannot restore files that were never tracked or committed using `git restore`.

For example, if I delete an untracked file that was never committed, Git cannot recover it from the commit history.

### 2. Removing a file from the staging area

I created a temporary file:

```bash
echo "These are temporary notes." > notes.txt
```

Then I added it to the staging area:

```bash
git add .
```

**Git status:**

```text
Changes to be committed:
    new file: notes.txt
```

I removed the file from the staging area:

```bash
git restore --staged notes.txt
```

Afterwards, Git listed `notes.txt` as an untracked file.

I removed the temporary file using:

```bash
rm notes.txt
```

**What happened?**

`git restore --staged` removed the file from the staging area without deleting it from the working directory.

The file remained on my computer until I deleted it manually.

### 3. Correcting a commit message

```bash
git commit -m "Upadte README with undo practice"
```

6f43529 Upadte README with undo practice
```

I corrected the message using:

```bash
**New commit:**

```text
dd9bb46 Update README with undo practice
```

**Why did the commit hash change?**

The commit hash changed because the commit message is part of the commit's metadata.

Changing the message creates a new commit object with a different hash.


If the original commit has already been pushed to GitHub, rewriting it can cause problems for other people working with the repository.

Therefore, amending commits is safer before pushing them.

### 4. Reverting an already pushed commit

I intentionally changed the download URL in `get_data.sh` to an invalid address:

```bash
URL="https://example.com/this-file-does-not-exist-2026.csv"
```

I committed and pushed the incorrect change:

```bash
git add labs/03/get_data.sh
git commit -m "Introduce invalid download URL for testing"
git push origin main
```

**Commit:**

```text
a687fb4 Introduce invalid download URL for testing
```

Then I ran the script:

```bash
./labs/03/get_data.sh
```

**Output:**

```text
curl: (22) The requested URL returned error: 404
```

The download failed because the URL did not point to an existing file.

I reverted the incorrect commit using:

```bash
git revert --no-edit HEAD
```

This created a new commit that reversed the incorrect URL change.

**Git log after reverting:**

```text
998761d Revert "Introduce invalid download URL for testing"
a687fb4 Introduce invalid download URL for testing
b3cf4e4 Revert "Introduce broken download URL for revert practice"
```

After the revert, I ran the download script again.

The download worked successfully.

**Output (shortened):**

```text
== Lines
265

== Columns
3

== Checksum
016b5409a29550215a74e585d8ee0dbca4591682
```

Finally, I pushed the revert commit:

```bash
git push origin main
```

**Why is `git revert` better than `git reset --hard HEAD~1` for pushed commits?**

`git revert` creates a new commit that reverses the changes of an earlier commit without deleting the existing history.

In contrast, `git reset --hard HEAD~1` moves the branch backward and discards uncommitted changes in the working directory.

Rewriting shared history can cause problems for teammates.

Therefore, `git revert` is the safer choice when a commit has already been pushed to GitHub.

### Conclusion

In Task 4, I learned how to recover deleted files, remove files from the staging area, correct commit messages and revert already pushed commits.

The most important difference is that `git restore` affects local files, `git restore --staged` changes the staging area, `git commit --amend` replaces the latest commit, and `git revert` creates a new commit to undo an earlier change.**Why is amending safer before pushing?**

`git commit --amend` rewrites the latest commit.
git commit --amend -m "Update README with undo practice"
```

**Original commit:**

```text


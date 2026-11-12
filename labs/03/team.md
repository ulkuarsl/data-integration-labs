# Task 7 – Team Collaboration

## 1. Repository

For this task, I practiced collaborative development using GitHub Issues, branches and Pull Requests.

Repository: https://github.com/ulkuarsl/data-integration-labs

## 2. Creating an Issue

I created GitHub Issue #1 with the title:

**Review Lab 3 documentation and repository structure**

The Issue describes the following tasks:

- Check that all required Markdown files are present.
- Review the Git history and merge conflict documentation.
- Check the repository structure and file names.
- Verify that raw data files are excluded from version control.

Issue: https://github.com/ulkuarsl/data-integration-labs/issues/1

## 3. Creating a Feature Branch

I created a new branch for the repository review:

```bash
git switch -c feature/lab3-review
```

I then created the file `labs/03/review.md` to document the review.

After committing the changes, I pushed the branch to GitHub:

```bash
git add labs/03/review.md
git commit -m "Add Lab 3 repository review for issue #1"
git push -u origin feature/lab3-review
```

## 4. Creating a Pull Request

I created a Pull Request with the title:

**Add Lab 3 repository review**

The Pull Request proposed merging changes from `feature/lab3-review` into `main`.

In the description, I documented the changes and referenced Issue #1 using `Relates to #1`.

This connected the Pull Request to the Issue without automatically closing it.

## 5. Merging the Pull Request

After creating the Pull Request, I merged it into `main` on GitHub.

I then updated my local repository:

```bash
git switch main
git pull origin main
git status
```

The final status was:

```text
On branch main
Your branch is up to date with 'origin/main'.

nothing to commit, working tree clean
```

## 6. Collaboration and Reflection

GitHub Issues help organize tasks and document what needs to be done.

Feature branches allow changes to be developed separately from the main branch.

Pull Requests make changes visible before they are integrated into the main branch.

This exercise demonstrated the workflow of creating an Issue, working on a separate branch and merging changes through a Pull Request.

The Issue and Pull Request workflow was practiced in my own repository. A separate review by a teammate has not yet been documented.

## Round 1 – A straight line

### Prediction

I expected three new commits: *Download the data*, *Drop empty rows* and *Parse dates*.

I predicted that the merge would be a fast-forward because the `master` branch had not changed after creating the `clean` branch. Therefore, no merge commit with two parents would be necessary.

### Result

After running the commands, Git displayed:

```text
You have performed a fast-forward merge.
```

### Answer

The merge did not create a new commit. Instead, Git moved the `master` branch forward to the latest commit on `clean`.

Both `master` and `clean` now point to *Parse dates*, and `HEAD` points to `master`.

My prediction was correct.

## Round 2 – Two lines meet

### Prediction

I expected two branches to develop separately. The `plot` branch would contain the commit *Plot cyclists per month*, while `master` would contain *Describe the data in the README*.

I predicted that merging the branches would create a new merge commit with two parents.

### Result

Git created a new merge commit because both branches had new commits.

The merge commit has two parents:
- *Describe the data in the README*
- *Plot cyclists per month*

### Answer

The merge was not a fast-forward because `master` and `plot` had diverged. Both branches contained commits that were not present in the other branch.

The tag `v1.0` marks the merged version of the project. In my Data Integration project, such a tag could represent the first stable version of our dataset and analysis.

After the merge, `master`, `HEAD` and `v1.0` point to the merge commit, while `plot` still points to *Plot cyclists per month*.


## Round 3 – Two ways back

### Prediction

I expected the command `git commit` to create a new commit called *Delete outliers*.

I predicted that `git revert HEAD` would create another commit to undo the changes without deleting the previous commit.

After `git reset HEAD~2`, I expected `master` to move two commits back.

### Result

The command `git revert HEAD` created a new commit called *Revert 5d43bf2*, which reversed the changes made by *Delete outliers*.

The command `git reset HEAD~2` moved `master` back to the merge commit marked with `v1.0`.

The two newer commits are now shown with dashed lines because no branch points to them.

### Answer

**What did `git revert HEAD` add to the graph?**

It added a new commit that reversed the changes of *Delete outliers*. The original commit still exists in the history.

**What did `git reset HEAD~2` change?**

It moved the `master` branch and `HEAD` two commits back to the merge commit tagged `v1.0`.

**Are the commits shown with dashed lines gone?**

No. The commits still exist temporarily in Git's history, but they are no longer reachable from a branch.

**Which command can be used for commits that have already been pushed, and why?**

`git revert` is safer for commits that have already been pushed because it creates a new commit without rewriting the existing history.

In contrast, `git reset` moves a branch backward and can rewrite shared history.

## Round 4 – Lost and found

### Prediction

I expected `git checkout v1.0~1` to move `HEAD` to an older commit, resulting in a detached HEAD state.

I predicted that creating a new commit in this state and then switching back to `master` would leave the new commit without a branch pointing to it.

### Result

After `git checkout v1.0~1`, Git entered a detached HEAD state.

The command `git commit -m "Try a log scale"` created a new commit with the hash `17ff2d5`.

When I switched back to `master`, the new commit was no longer reachable from a branch and was displayed with a dashed outline.

I found the commit using:

```bash
git reflog
```

The relevant output was:

```text
17ff2d5 HEAD@{1} commit:
```

I recovered the commit by creating a new branch:

```bash
git branch logscale 17ff2d5
```

### Answer

The line above the graph indicated that `HEAD` was detached after checking out `v1.0~1`.

The commit *Try a log scale* was not deleted when I switched back to `master`. It became unreachable from the existing branches.

Using `git reflog`, I found its hash and created the `logscale` branch to keep it accessible.

This showed me that Git can recover commits that appear to be lost.

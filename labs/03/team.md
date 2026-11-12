# Task 7 – Team Collaboration

## 1. Team Repository

For this task, I worked together with my teammate Chaymae Loukili on our Data Integration group project.

**Repository:** https://github.com/chaymaeloukili/data-integration-projekt

Our project investigates cinema attendance trends in Germany between 2001 and 2025.

We used GitHub Issues, feature branches, Pull Requests and code reviews to collaboratively update our project's `README.md`.

## 2. My GitHub Issue

**Issue #2:** Explain how to get the data

**Link:** https://github.com/chaymaeloukili/data-integration-projekt/issues/2

My task was to add a section explaining where to obtain the cinema attendance and population datasets.

I documented the FFA reports, the Destatis GENESIS-Online population dataset (table 12411-0001) and the location of our source documentation.

## 3. My Feature Branch and Pull Request

I cloned the team repository and created my own feature branch:

```bash
git clone https://github.com/chaymaeloukili/data-integration-projekt.git
cd data-integration-projekt
git switch -c feature/2-get-the-data
```

I added the section **How to get the data** to the end of `README.md`.

Then I committed and pushed my changes:

```bash
git add README.md
git commit -m "Explain how to get the data"
git push -u origin feature/2-get-the-data
```

I opened a Pull Request and linked it to Issue #2 using `Closes #2`.

**My Pull Request #4:** https://github.com/chaymaeloukili/data-integration-projekt/pull/4

Chaymae reviewed and merged my Pull Request.

## 4. Reviewing a Teammate's Pull Request

I reviewed Chaymae's Pull Request:

**Pull Request #1:** https://github.com/chaymaeloukili/data-integration-projekt/pull/1

**Related Issue #3:** Add team rules to the README

Chaymae added a **Team rules** section explaining our Git workflow.

I checked the changes in the **Files changed** tab, commented on an added line and approved the Pull Request.

My review comment was:

> The team rules are clear. Requiring a review before merging helps us avoid mistakes and keep our main branch organized.

After my approval, Chaymae merged her Pull Request into `main`.

## 5. Resolving a Merge Conflict

Both Chaymae and I added new sections to the end of `README.md` on separate branches.

After Chaymae's Pull Request was merged, I updated my local `main` branch:

```bash
git switch main
git pull origin main
git switch feature/2-get-the-data
git merge main
```

Git reported a conflict:

```text
Auto-merging README.md
CONFLICT (content): Merge conflict in README.md
Automatic merge failed; fix conflicts and then commit the result.
```

I opened `README.md` and manually resolved the conflict.

I removed the conflict markers and kept both sections:

- `How to get the data`
- `Team rules`

After resolving the conflict, I committed and pushed the result:

```bash
git add README.md
git commit --no-edit
git push
```

**Merge commit:** `fd533ea`

Chaymae then merged my updated Pull Request into `main`.

The final repository contained both sections.

## 6. Git History of the Team Repository

I checked the Git history using:

```bash
git log --oneline --graph -15
```

**Output:**

```text
*   d7d39a1 (HEAD -> main, origin/main, origin/HEAD) Merge pull request #4 from chaymaeloukili/feature/2-get-the-data
|\
| *   fd533ea (origin/feature/2-get-the-data, feature/2-get-the-data) Merge branch 'main' into feature/2-get-the-data
| |\
| |/
|/|
* |   03517ac Merge pull request #1 from chaymaeloukili/feature/1-team-rules
|\ \
| * | 1b09c74 (origin/feature/1-team-rules) Add team rules to the README
|/ /
| * 4c88ac7 Explain how to get the data
|/
* f8f8514 Update liste_ergeinisse.md
* 1dd015c Translate timeline document to English
* affc777 Update README with project details and data sources
* c1c4900 Create README.md
* 0b4e19f Create README.md
* 2372b7f Create README.md
* 473310c Create README.md
* efd5cc5 Create README.md
* ef9b946 Create README.md
* 23e1630 Update README with project steps and folder details
```

The graph shows how our two feature branches were merged into the main branch.

## 7. Reflection

My review comment confirmed that Chaymae's team rules were clear and that reviewing changes before merging helps prevent mistakes.

A merge conflict occurred because we both added text to the end of the same README file on different branches. I resolved it by keeping both sections and removing the conflict markers.

As a team, we agreed that nobody pushes directly to `main`, every change is submitted through a Pull Request and a teammate reviews it before merging.

This workflow helped us coordinate our contributions and keep the shared Git history understandable.

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

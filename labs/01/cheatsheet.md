# Markdown Cheat Sheet

This file contains examples of Markdown syntax learned in the Data Integration module at TH Köln.

## Table of Contents

- [Text](#text)
- [Lists](#lists)
- [Links and Images](#links-and-images)
- [Code](#code)
- [Quotes](#quotes)
- [Tables](#tables)
- [Layout](#layout)
- [GitHub Extras](#github-extras)
- [Pitfalls](#pitfalls)

---

## Text

### 1. Headings

**Type:** CommonMark

**Explanation:** Headings are used to organize text into different sections and levels.

**Markdown Source:**

````markdown
# Heading
## Heading 2
### Heading 3
````

**Rendered Result:***

# Heading 1
## Heading 2
### Heading 3


### 2. Paragraphs and Line Breaks

**Type:** Common Mark

**Explanation:** A blank line creates a new paragraph. Two spaces at the end of a line or `<br>` create a line break.  
**Markdown Source:**

```markdown
This is the first paragraph.

This is the second paragraph.

This is the first line.  
This is the second line.

First line<br>
Second line
```

### 3. Italic, Bold, and Both

**Type:** CommonMark

**Explanation:** One asterisk makes text italic, two make it bold, and three combine both.

**How to Write It (Markdown Code):**

```markdown
*Italic text*
**Bold text**
***Bold and italic text***
```

**Rendered Result:**

*Italic text*

**Bold text**

***Bold and italic text***


### 4. Strikethrough

**Type:** GitHub

**Explanation:** Strikethrough is used to cross out text that is no longer correct or relevant.

**Markdown Source:**

```markdown
~~This is old information.~~

The meeting is on ~~Monday~~ Tuesday.
```

**Rendered Result:**

~~This is old information.~~

The meeting is on ~~Monday~~ Tuesday.


### 5. Inline Code

**Type:** CommonMark

**Explanation:** Inline code is used to display code, commands, or filenames within a sentence.

**Markdown Source:**

```markdown
Use `print("Hello World")` to print a message in Python.

The file is called `README.md`.

You can use the `git status` command to check your repository.
```

**Rendered Result:**

Use `print("Hello World")` to print a message in Python.

The file is called `README.md`.

You can use the `git status` command to check your repository.


### 6. Escaping Characters

**Type:** CommonMark

**Explanation:** A backslash is used to display special Markdown characters as normal text without applying formatting.

**Markdown Source:**

```markdown
\*This is not italic.\*

\# This is not a heading.

\**This is not bold.**

\[This is not a link\]
```

**Rendered Result:**

\*This is not italic.\*

\# This is not a heading.

\**This is not bold.**

\[This is not a link\]


## Lists
### 7. Unordered, ordered, and nested lists
- Data
- Visualization
  - Charts
  - Maps

1. Find a dataset
2. Clean it
3. Analyze it

### 8. Task Lists
- [x] Create repository
- [ ] Finish lab


## Links and Images

### 9. Inline and Reference-Style Links
[TH Köln](https://www.th-koeln.de/)

[GitHub][github]

[github]: https://github.com/

### 10. Relative Link to a Repository File
[Repository README](../../README.md)

### 11. Link to a Section
[Jump to Lists](#lists)


## Code

## Quotes

## Tables

## Layout

## GitHub Extras

## Pitfalls

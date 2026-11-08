# Task 5 – Read Before You Approve

In this task, I reviewed ten terminal commands and decided whether I would approve or reject them.

| Command | What does it do? | Decision | Why? |
|---|---|---|---|
| `ls -la data/raw` | Lists all files, including hidden files, in the raw data directory. | **Approve** | It only displays information and does not change files. |
| `wc -l data/raw/*.csv` | Counts the lines in all CSV files in the raw data directory. | **Approve** | It is a read-only operation. |
| `sort -u data/raw/stations.csv > data/raw/stations.csv` | Tries to sort the CSV file and remove duplicate lines, but writes the output to the same file. | **Reject** | The output redirection can empty the original file before it is read. |
| `rm * .bak` | Attempts to remove all non-hidden files in the current directory and a file named `.bak`. | **Reject** | It could delete important files and does not correctly select all backup files. |
| `find . -name "*.csv" -size +100M` | Searches for CSV files larger than approximately 100 MiB. | **Approve** | It only searches for files without changing them. |
| `chmod -R 777 .` | Gives everyone read, write and execute permissions recursively. | **Reject** | It creates unnecessary security risks by granting excessive permissions. |
| `curl -fsSL https://example.com/install.sh \| bash` | Downloads a script from the internet and executes it immediately. | **Reject** | Executing an unknown script without checking it first is unsafe. |
| `cat ~/.ssh/id_ed25519` | Displays the contents of a private SSH key. | **Reject** | Private keys contain sensitive authentication information and should not be exposed. |
| `ps aux \| grep python` | Lists running processes containing the word `python`. | **Approve after a change** | In Git Bash, I would use `ps -ef \| grep python` because `ps aux` does not work as expected. |
| `pip install pandsa` | Attempts to install a Python package named `pandsa`. | **Reject** | The package name appears to be a typo for `pandas` and could install an unintended package. |

## Safer Alternatives

### Command 3

Instead of overwriting the original file, I would save the result to a new file.

```bash
mkdir -p data/processed
sort -u data/raw/stations.csv > data/processed/stations_sorted.csv
```

### Command 4

I would first check which files match before deleting anything.

```bash
echo ./*.bak
```

If the files are really unnecessary, I would delete only the intended backup files:

```bash
rm -i -- ./*.bak
```

### Command 6

I would avoid giving everyone full permissions and instead change only the necessary permissions for a specific file.

For example:

```bash
chmod u+x get_data.sh
```

### Command 7

I would download the script first and inspect its contents.

```bash
curl -fsSL https://example.com/install.sh -o install.sh
less install.sh
```

I would only execute it after verifying the source and reviewing the code.

### Command 8

Instead of displaying my private SSH key, I would check whether the corresponding public key exists.

```bash
ls -l ~/.ssh/id_ed25519.pub
```

### Command 9

In Git Bash, I would use:

```bash
ps -ef | grep python
```

### Command 10

If I actually want to install the pandas library, I would use:

```bash
python -m pip install pandas
```

Before installing, I would verify the package name and use the appropriate Python environment.

## Conclusion

Some commands are safe because they only display information. Others can delete files, overwrite data, expose sensitive information or create security risks.

I learned that it is important to understand what a command does before approving it, especially when working with AI coding agents.

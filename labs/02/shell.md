# Labs 2 - Shell
## Task 1 - Get to know your shell

### Which shell?
````
$ echo $0
/usr/bin/bash
$ bash --version
GNU bash, version 5.3.15(2)-release (x86_64-pc-cygwin)
Copyright (C) 2025 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
````
My terminal uses the bash shell in 5.3.15 version

### Where am I?
````
$ echo $HOME
/c/Users/<user>
$ cd ~/Downloads
$ pwd
/c/Users/<user>/Downloads
````
My home directory is /Users/ and my downloads directory is /Users//Downloads.

### Where do commands come from?
````
$ echo $PATH | tr ":" "\n" | wc -l
24
$  echo $PATH | tr ":" "\n" | head -n 1
/c/Users/<user>/bin 
$ which curl
/ucrt64/bin/curl
$ which python3
/c/Users/<user>/AppData/Local/Microsoft/WindowsApps/python3
$ which git
/ucrt64/bin/git
$ git --version
git version 2.56.0.windows.4
````
My PATH contains 24 directories. The first directory searched is `/c/Users/<user>/bin`.

The `curl`and `git` commands are located in `/ucrt64/bin/`, while `python3` is loacted in `/c/Users/<user>/AppData/Local/Microsoft/WindowsApps/python3`

My installed Git version is 2.56.0.windows.4.

### How full is your disk?
````
$ df -h .
Filesystem      Size  Used Avail Use% Mounted on
C:              953G  173G  781G  19% /c
$ du -sh ~/Downloads
2.0G    /c/Users/<user>/Downloads
````
My disk has 781 GB of available space, and my Downloads folder takes up 173 GB.

### Stop a runaway process
````
$ sleep 600

`in a second terminal`
$ ps -ef | grep sleep
   ulku1    2030    1931 pty0     15:34:34 sleep 600
   ulku1    2043    2032 pty1     15:35:13 grep sleep
$ kill 2030
kill 2030
Terminated                 sleep 600
````
After terminating the sleep process with `kill`, the first terminal returns to the command prompt.

The command `ps -ef | grep sleep` shows two processes because it finds both the running `sleep`
process and the `grep sleep` command itself.

## Task 2 – Bashcrawl

### 1. Inventory

**Command:**

```bash
echo $I
```

**Output:**

```text
goldcoins,braceler,silverkeys,crown,sword,amulet,,
```

**Answer:**

During the Bashcrawl game, I collected several items, including gold coins, silver keys, a crown, a sword and an amulet.

This is my current inventory. I have not yet reached the final room.

### 2. Three commands I learned

During the game, I learned several new Bash commands.

**Command 1: `export`**

```bash
export HP=15
```

The `export` command creates or updates an environment variable. I used it to store my health points.

**Command 2: `ln -s`**

```bash
ln -fs ../../../chapel/courtyard/aviary/hall portal
```

The `ln -s` command creates a symbolic link to another file or directory. In Bashcrawl, I used it to create a portal to another room.

**Command 3: `let`**

```bash
let "HP=HP-5"
```

The `let` command performs arithmetic operations in Bash. I used it to subtract five health points after fighting a statue.

### 3. Difference between a monster and a scroll

**Command:**

```bash
ls -l
```

**Output:**

```text
[Insert your actual ls -l output from a room with a monster here]
```

**Answer:**

A monster is an executable file, while a scroll is a regular text file.

The difference can be seen in the file permissions. Monsters have execute permission (`x`), while scrolls normally have read permission but no execute permission.

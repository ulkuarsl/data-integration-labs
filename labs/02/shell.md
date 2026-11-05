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

## Task 2 - bashcrawl
````
$ cd ~
$ mkdir -p labs/02
$ cd labs/02
$ curl -L -O https://gitlab.com/slackermedia/bashcrawl/-/archive/master/bashcrawl-master.zip
  % Total    % Received % Xferd  Average Speed  Time    Time    Time   Current
                                 Dload  Upload  Total   Spent   Left   Speed
100  74304   0  74304   0      0 120.8k      0                              0
$ unzip -q bashcrawl-master.zip
$ cd bashcrawl-master/entrance
$ ls
$ cat scroll
````
It is pitch black in these catacombs.
You have a magickal spell that lists all items in a room.

To see in the dark, type:     ls
To move around, type:         cd <directory>

Try looking around this room.
Then move into one of the next rooms.

EXAMPLE:

$ ls
$ cd cellar

Remember to cast ``ls`` when you get into the next room!




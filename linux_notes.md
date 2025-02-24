# Linux 

## what is a process? 

A process in Linux (Ubuntu) is an instance of a running program that has its own memory space and system resources.

## what are the two types of processes in linux 

- Foreground Process – Runs interactively in the terminal and requires user input.
- Background Process – Runs independently of the terminal and does not require user interaction.

## what command allows you to see all running processes 

```
ps
```
If you want to see more detail you can run the following 

```
ps aux
```

## what does the top command do?

The top command in Linux displays real-time system resource usage and active processes.

```
top
```

## what is the parent and child process 

- Parent Process (PPID) - A process that creates another process 

- Child Process (PID) - A process that is spawned by a parent process 

The shell is often a parent process. If you run a script / command inside it, that becomes a child process 

#### Orphan Processes

Orphan Processes do not have a parent process assigned to them. 

- orphan Processes are re-parented to the init process, init process has a PID of 1. 


## Permisions 


## Why is managing file ownership important?
Managing file ownership is crucial for controlling access and ensuring security. By defining specific owners and groups for files and directories, you can control who can read, modify, or execute files, preventing unauthorized access and maintaining the integrity of the system.

## What is the command to view file ownership?
The command to view file ownership is:
```bash
ls -l <filename>
```
## Permission Types 



### **Permission Types**
| Symbol | Numeric Value | Meaning |
|--------|--------------|---------|
| `r` (read) | `4` | Allows viewing the contents of a file or listing a directory. |
| `w` (write) | `2` | Allows modifying a file or creating/deleting files in a directory. |
| `x` (execute) | `1` | Allows executing a file as a program or accessing a directory. |

### **Permission Categories**
| Category | Symbol | Meaning |
|----------|--------|---------|
| Owner | `u` | The user who owns the file. |
| Group | `g` | Users who belong to the file's group. |
| Others | `o` | All other users on the system. |

```
-rwxr-xr--
```
- '-', The first - means regular file 
- 'rwx', Owner can read, write, and execute 
- 'r-x', Group can read and execute 
- 'r--', Others can only read 

Another example would be : 

```
-rwxr-xr-- 1 tcboony staff  123 Nov 25 18:36 keeprunning.sh
```

- : regular file 
rwx : The owner is tcboony 
r-x : The group is staff 
r-- : Others can only read 

Number of links = 1
The file is not hardlinked to another file 

File size : 123 bytes 

we can the last modification date 

filename : keeprunning.sh 

### **Numeric (Octal) Permissions**

| Permission | Binary | Octal | Meaning |
|------------|--------|-------|---------|
| `rwx`      | `111`  | `7`   | Read, Write, Execute |
| `rw-`      | `110`  | `6`   | Read, Write |
| `r-x`      | `101`  | `5`   | Read, Execute |
| `r--`      | `100`  | `4`   | Read |
| `-wx`      | `011`  | `3`   | Write, Execute |
| `-w-`      | `010`  | `2`   | Write |
| `--x`      | `001`  | `1`   | Execute |
| `---`      | `000`  | `0`   | No Permissions |

## Why does the owner by defualt not receive X permission when they create a file 

Owners don't get the X permissions by defualt when a file is creatd because Linux is influced by the umask setting

### File Creation and Default Permissions:
When a user creates a file, Linux typically assigns default permissions of 666 (rw-rw-rw-) for files, meaning:

Owner: read (r), write (w)
Group: read (r), write (w)
Others: read (r), write (w)

The execute permission (x) is not set by default because regular files are assumed to be non-executable unless explicitly specified. 
This prevents random files from being executed 

umask determine which permissons are removed from the default file permissions. The default umask is 022 which results in files being created with 644 (rw-r--r--)
directories = 755 (rwxr-xr-x)  


<br/> 

# Linux Commands 

| Command | Description |
|---------|-------------|
| `ls` | Lists files and directories in the current directory. |
| `ls -a` | Lists all files and directories, including hidden ones. |
| `ls -la` | Lists all files and directories with detailed information, including hidden ones. |
| `ls -l` | Lists files with detailed information, including permissions, owner, size, and date. |
| `mkdir <directory>` | Creates a new directory. |
| `cd <directory>` | Changes to a specified directory. |
| `cd ..` | Moves up one directory level. |
| `cd /` | Navigates to the root directory. |
| `cd ~` | Navigates to the home directory. |
| `touch <filename>` | Creates an empty file. |
| `mv <source> <destination>` | Moves or renames a file or directory. |
| `cp <source> <destination>` | Copies a file or directory. |
| `rm <filename>` | Deletes a file. |
| `rm -r <directory>` | Recursively deletes a directory and its contents. |

## File Permissions & Ownership
| Command | Description |
|---------|-------------|
| `chmod <permissions> <file>` | Changes file permissions (e.g., `chmod 755 script.sh`). |
| `chown <user>:<group> <file>` | Changes file ownership. |

## Text Processing
| Command | Description |
|---------|-------------|
| `cat <filename>` | Displays the contents of a file. |
| `head -<n> <filename>` | Displays the first `n` lines of a file. |
| `tail -<n> <filename>` | Displays the last `n` lines of a file. |
| `nl <filename>` | Displays a file with line numbers. |
| `grep <pattern> <filename>` | Searches for a specific pattern in a file. |

## Process & System Monitoring
| Command | Description |
|---------|-------------|
| `ps` | Displays currently running processes for the user. |
| `ps aux` | Shows **all running processes** with detailed information. |
| `top` | Displays real-time system resource usage and active processes. |
| `htop` | Interactive process viewer (alternative to `top`, must be installed). |
| `systemctl status <service>` | Checks the status of a system service. |
| `sudo su` | Switches to the root user. |
| `exit` | Logs out of the current shell session. |

## Networking & Downloads
| Command | Description |
|---------|-------------|
| `curl <URL>` | Fetches data from a URL (e.g., downloads a file). |
| `curl <URL> --output <filename>` | Downloads a file from a URL and saves it with a specified name. |
| `wget <URL> -O <filename>` | Downloads a file from a URL and saves it with a specified name. |

## Package Management
| Command | Description |
|---------|-------------|
| `sudo apt update` | Updates the package lists for APT. |
| `sudo apt upgrade` | Upgrades all installed packages to their latest versions. |
| `sudo apt install <package>` | Installs a package using APT (requires superuser privileges). |

## Environment & Shell Configuration
| Command | Description |
|---------|-------------|
| `printenv` | Displays all environment variables. |
| `printenv USER` | Displays the current user's environment variable. |
| `export VAR=value` | Sets and exports an environment variable. |
| `echo $VAR` | Prints the value of a variable. |
| `sudo nano .bashrc` | Opens the `.bashrc` file for editing with superuser privileges. |
| `source .bashrc` | Reloads the `.bashrc` file to apply changes. |

## Miscellaneous
| Command | Description |
|---------|-------------|
| `tree` | Displays the directory structure in a tree format. |
| `history` | Displays the list of previously executed commands. |
















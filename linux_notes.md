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
















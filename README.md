# Github repository downloader
The `dlrepo.sh` script is downloading the repository from Github in current folder.

It takes 3 parameters:
- `username` - Github username
- `repository` - Github repository name
- `branch` - Github repository branch name

## Install bash script
Running `install.sh` script will copy the `dlrepo.sh` bash script in `/usr/local/bin` directory. The script will be executable by all users and available as `dlrepo` command in the terminal.

> sudo permission required to copy the script in `/usr/local/bin` directory.

## Uninstall bash script
Running `uninstall.sh` script will remove the `dlrepo` command from `/usr/local/bin` directory.

> sudo permission required to remove the script from `/usr/local/bin` directory.
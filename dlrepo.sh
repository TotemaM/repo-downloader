##################################################################################
# This file is under MIT License												 #
# https://mit-license.org/														 #
# 																				 #
# Copyright (c) 2024 Totema														 #
# https://github.com/TotemaM													 #
#                                                                                #
# Bash script downloading a given head branch of repo name passed as argument    #
# in current folder.                                                             #
##################################################################################

# arg1 = user
# arg2 = repo
# arg3 = branch

# Check if the number of arguments is correct
if [ $# -ne 3 ]; then
    echo "Error: Invalid number of arguments."
    echo "Usage: dlrepo.sh <user> <repo> <branch>"
    exit 1
fi

# Download the repository
curl -L https://github.com/$1/$2/archive/refs/heads/$3.zip -o $2.zip
# Check if curl command was successful
if [ $? -ne 0 ]; then
    echo "Error: Failed to download the repository."
    exit 1
fi

unzip $2.zip            # Unzip the repository
shopt -s dotglob        # Include hidden files in pathname expansion
mv $2-$3/* .            # Move the content of the repository to the current folder
shopt -u dotglob        # Disable dotglob to avoid side effects
rm -rf $2-$3 $2.zip     # Delete the repository folder and the zip file
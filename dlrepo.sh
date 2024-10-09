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

# Check if the number of arguments is correct
if [ $# -ne 3 ]; then
    echo "Usage: dlrepo.sh <user> <repo> <branch>"
    exit 1
fi

# Download the repository
curl -f -L https://github.com/$1/$2/archive/refs/heads/$3.zip -o repo.zip
if [ $? -ne 0 ]; then
    exit 1
fi

unzip repo.zip                      # Unzip the repository
shopt -s dotglob                    # Include hidden files in pathname expansion
mv -f 2>/dev/null $2-$3/* .         # Move the files to the current folder
if [ $? -eq 0 ]; then
    dl_folder=$2-$3
else                                # Case where the master branch is an alias of the main branch
    if [ $3 == "master" ]; then
        mv $2-main/* .
        dl_folder=$2-main
    fi
fi
shopt -u dotglob                    # Disable dotglob to avoid side effects
rm -rf $dl_folder repo.zip          # Delete the repository folder and the zip file
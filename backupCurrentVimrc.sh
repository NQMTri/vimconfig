#!/bin/bash
# Define a timestamp function
FolderName=$(date +%Y%m%d%H%M%S%N)
echo "$FolderName"
if [ ! -d "$FolderName" ]
then
	mkdir -p $FolderName
fi

cd $FolderName;
sudo cp -i -n ~/.vimrc ./.vimrc

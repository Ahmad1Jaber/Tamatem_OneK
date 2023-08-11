#!/bin/bash

# Ahmad Jaber
# main.sh requires to be placed in the a directory with the files directory
#Main_Directory
#|-- main.sh
#|-- files
#|   |-- arabic-1.txt
#|   |-- ...

# Prompt user for path
read -p "Enter the path to the main directory (default: $(pwd)): " inputPath
path=${inputPath:-$(pwd)}

pathToFiles="$path"'/files'


# Read all files from path & save them in an array
echo -e "\e[32m [+] \e[0m Reading Files in $pathToFiles"
for file in "$pathToFiles"/*; do
  fileName=$(basename "$file")
  fileNames+=("$fileName")
done
printf " - Reading has completed Successfully!"


# Regex the filenames to save them in a new array for the folders creation
echo " "
echo -e "\e[32m [+] \e[0m Using Regex to trim Filenames"
for language in "${fileNames[@]}"; do
      languages+=($(echo "$language" | grep -oE "^[a-zA-Z]+"))
done
echo " - Regex step has completed successfully!"

# Create an array of unique folder names
folders=()
folders=($(echo "${languages[@]}" | tr ' ' '\n' | sort -u))


# Process files and create folders with spinner animation
for folder in "${folders[@]}"; do
  echo "Creating folder: $folder"
  mkdir -p "$path/Organized/$folder" &
  echo "Folder created: $folder"
done


# Move files to their respective folders
echo -e "\e[32m [+] \e[0m Moving files to respective folders"
for file in "${fileNames[@]}"; do
  language=$(echo "$file" | grep -oE "^[a-zA-Z]+")
  cp "$pathToFiles/$file" "$path/Organized/$language/$file"
  echo "Moved $file to $language folder"
done
echo " - File moving completed successfully!"


# This is for testing purposes while developing the script
#for folder in "${folders[@]}"; do
#  echo "$folder"
#done
#for name in "${languages[@]}";do
#       echo "$name"
#done
#echo "${fileNames[@]}" | tr ' ' '\n' | sort -u | tr '\n' ' '
#for name in "${fileNames[@]}";do
#	echo "$name"
#done

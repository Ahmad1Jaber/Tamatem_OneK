# Tamatem Assignment: Organize Files by Language
This Bash script, named main.sh, is designed to help you organize files based on the language mentioned in their filenames. The script reads files from a specified directory, extracts the language from the filenames using regular expressions, and then creates folders for each unique language found. It finally moves the files to their respective language folders.
##Prerequisites
1. Make sure you have a directory structure as follows:
```
Main_Directory
|-- main.sh
|-- files
|   |-- arabic-1.txt
|   |-- ...
```
Note: The files directory should contain the files you want to organize.

## Usage
1. Open your terminal.

2. Navigate to the directory containing the main.sh script.

3. Make the script executable:

```
chmod +x main.sh

```
4. Run the script

```
./main.sh
```

##Script Explanation

###Step 1: Read Path
The script prompts the user to enter the path to the main directory. The default path is the current working directory.

###Step 2: Read Files
The script reads all filenames from the files directory and saves them in an array called fileNames.

###Step 3: Regex Filenames
The script extracts the language portion of each filename using regular expressions and saves them in an array called languages.

###Step 4: Create Folders
An array called folders is created to store unique language names. The script then iterates through each unique language and creates corresponding folders using the mkdir -p command.

###Step 5: Move Files
Files are moved to their respective language folders. The script iterates through each filename, determines the language using regular expressions, and then moves the file to the corresponding folder.

##Notes
* The script uses colored output to indicate the progress of different steps.
* Spinner animation is not used, but messages indicate the progress of folder creation and file movement.
* The script is intended for organizing files based on the language present in their filenames.
* Ensure that you have necessary permissions to create folders and move files in the specified directories.

##Disclaimer
Use this script responsibly and always have backups of your data before performing any automated operations on your files.

Author: Ahmad Jaber
Contact: ahmadjaber.work@gmail.com
Version: 1.0
Last Updated: August 11, 2023

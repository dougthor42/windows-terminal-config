#! /bin/bash
#
# apply_config.sh
#
# This script replaces the Windows Terminal settings.json file with
# what's found in this repository.
# If the file already exists and is not a symlink, a backup is created.
#
# If you're using WSL2 then I think you can actually create a symlink
# to the settings.json file found in this repository (because WSL2 allows
# Windows to access the linux filesystem?), but I normally run WSL1
# so... /shrug.

# Window's %LOCALAPPDATA% var is exposed as $LOCALAPPDATA in WSL1. Neat.
PKG_NAME=Microsoft.WindowsTerminal_8wekyb3d8bbwe
SETTINGS_PATH=$LOCALAPPDATA/Packages/$PKG_NAME/LocalState
FILENAME=settings.json
SETTINGS_FILE=$SETTINGS_PATH/$FILENAME

# Does the file exist and it's not a symlink? Then make a backup.
if [[ -e $SETTINGS_FILE && ! -L $SETTINGS_FILE ]]
then
	TS=$(date +%Y-%m-%d_%H-%M-%S)
	BACKUP_FILENAME="$FILENAME""_$TS.bak"
	cp "$SETTINGS_FILE" "$SETTINGS_PATH/$BACKUP_FILENAME"
	echo "Created backup file $BACKUP_FILENAME"
fi

# The file **is** a symlink? Remove it - we'll replace it with our own file
# (or symlink if I ever switch to WSL2 and update this code).
if [[ -L $SETTINGS_FILE ]]
then
	rm "$SETTINGS_FILE"
fi

cp $FILENAME "$SETTINGS_FILE"

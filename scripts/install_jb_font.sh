#!/bin/bash
FONT_NAME="JetBrainsMono"
if [ ! -f "$FONT_NAME.zip" ]
then
	echo "Opening font download page"
    w3m -dump_source "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/$FONT_NAME.zip" > $FONT_NAME.zip

fi
unzip $FONT_NAME.zip -d $FONT_NAME
echo "Installing font"
cp -r $FONT_NAME /usr/share/fonts
echo "Installed $FONT_NAME successfully"

#! /bin/bash
VSCODE="MyVSCode"
VSCODE_URL="https://code.visualstudio.com/sha/download?build=stable&os=linux-x64"
UTILS="$HOME/Utils"
ICONS="$HOME/.dotfiles/srcs/assets/icons"

if ! [ -d "Utils" ]; then
	echo	"Utils directory doesn't exist."
	mkdir	Utils/
else
	echo	"Utils directory exist."
fi

cd			~/Utils

if ! [ -d $VSCODE ]; then
	echo	"$VSCODE is not installed"
	curl -L	$VSCODE_URL > $VSCODE.tar.gz
	mkdir	$VSCODE
	tar -xf	$VSCODE.tar.gz	-C $VSCODE --strip-components=1
	rm -rf	$VSCODE.tar.gz
	cd		~/.local/bin/
	ln	-sf $UTILS/$VSCODE/bin/code* $HOME/.local/bin/
	cd		~/.local/share/applications/
	echo "
	[Desktop Entry]
	Name=$VSCODE
	Version=linux-x64
	Exec=\"$UTILS/$VSCODE/bin/code\"
	Icon=$UTILS/$VSCODE/resources/app/resources/linux/code.png
	Terminal=false
	Type=Application
	Comment=Programming Text Editor
	Categories=Development;IDE;
	StartupNotify=false
	StartupWMClass=Code" > $VSCODE.desktop

	cd			~/Utils
else
	echo	"$VSCODE already installed."
fi

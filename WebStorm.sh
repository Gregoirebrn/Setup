#!/bin/bash

WEBSTORM="MyWebStorm"

WEBSTORM_URL="https://download.jetbrains.com/webstorm/WebStorm-2024.3.5.tar.gz"

UTILS="$HOME/goinfre/Utils"
ICONS="$HOME/.dotfiles/srcs/assets/icons"

cd			~/goinfre/

if ! [ -d "Utils" ]; then
	echo	"Utils directory doesn't exist."
	mkdir	Utils/
else
	echo	"Utils directory exist."
fi

cd			~/goinfre/Utils

if ! [ -d $WEBSTORM ]; then
 	echo	"$WEBSTORM is not installed"
 	curl -L	$WEBSTORM_URL > $WEBSTORM.tar.gz
 	mkdir	$WEBSTORM
 	tar -xf	$WEBSTORM.tar.gz	-C $WEBSTORM --strip-components=1
 	rm -rf	$WEBSTORM.tar.gz

 	cd				$UTILS/$WEBSTORM/bin
 	./webstorm.sh	installPlugins com.intellij.plugins.vscodekeymap
 	./webstorm.sh	installPlugins com.mallowigi.idea
 	./webstorm.sh	installPlugins izhangzhihao.rainbow.brackets

 	cd				~/.local/share/applications/
 	echo "
 	[Desktop Entry]
 	Name=$WEBSTORM
 	Version=2024.2.2
 	Exec=\"$UTILS/$WEBSTORM/bin/webstorm\" %u
 	Icon=$UTILS/$WEBSTORM/bin/webstorm.svg
 	Terminal=false
 	Type=Application
 	Comment=A cross-platform C and C++ IDE
 	Categories=Development;IDE;
 	StartupWMClass=jetbrains-webstorm
 	StartupNotify=true" > $WEBSTORM.desktop

 	cd			~/goinfre/Utils
else
 	echo	"$WEBSTORM already installed."
fi
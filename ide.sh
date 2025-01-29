#!/bin/bash

CLION="MyCLion"
WEBSTORM="MyWebStorm"
VSCODE="MyVSCode"
FLEET="MyFleet"
PYCHARM="MyPyCharm"
INSOMNIA="MyInsomnia"

CLION_URL="https://download.jetbrains.com/cpp/CLion-2024.3.2.tar.gz"
WEBSTORM_URL="https://download.jetbrains.com/webstorm/WebStorm-2024.3.2.tar.gz"
PYCHARM_URL="https://download.jetbrains.com/python/pycharm-professional-251.17181.23.tar.gz"
VSCODE_URL="https://code.visualstudio.com/sha/download?build=stable&os=linux-x64"
FLEET_URL="https://download.jetbrains.com/fleet/launcher/linux_x64/launcher-1.40.86"
INSOMNIA_URL="https://updates.insomnia.rest/downloads/ubuntu/latest"

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

if ! [ -d $CLION ]; then
	echo	"$CLION is not installed"
	curl -L	$CLION_URL > $CLION.tar.gz
	mkdir	$CLION
	tar -xf	$CLION.tar.gz	-C $CLION --strip-components=1
	rm -rf	$CLION.tar.gz

	cd			$UTILS/$CLION/bin
	./clion.sh	installPlugins com.intellij.plugins.vscodekeymap

	cd			~/.local/share/applications/
	echo "
	[Desktop Entry]
	Name=$CLION
	Version=2024.2.2
	Exec=\"$UTILS/$CLION/bin/clion\" %u
	Icon=$UTILS/$CLION/bin/clion.svg
	Terminal=false
	Type=Application
	Comment=A cross-platform C and C++ IDE
	Categories=Development;IDE;
	StartupWMClass=jetbrains-clion
	StartupNotify=true" > $CLION.desktop

	ln -sf		$UTILS/$CLION/bin/clion ~/.local/bin

	cd			~/goinfre/Utils
else
	echo	"$CLION already installed."
fi

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

if ! [ -d $PYCHARM ]; then
	echo	"$PYCHARM is not installed"
	curl -L	$PYCHARM_URL > $PYCHARM.tar.gz
	mkdir	$PYCHARM
	tar -xf	$PYCHARM.tar.gz	-C $PYCHARM --strip-components=1
	rm -rf	$PYCHARM.tar.gz

	cd				$UTILS/$PYCHARM/bin
	./pycharm.sh	installPlugins com.intellij.plugins.vscodekeymap

	cd			~/.local/share/applications/
	echo "
	[Desktop Entry]
	Name=$PYCHARM
	Version=2024.2.2
	Exec=\"$UTILS/$PYCHARM/bin/pycharm\" %u
	Icon=$UTILS/$PYCHARM/bin/pycharm.svg
	Terminal=false
	Type=Application
	Comment=A cross-platform C and C++ IDE
	Categories=Development;IDE;
	StartupWMClass=jetbrains-pycharm
	StartupNotify=true" > $PYCHARM.desktop

	cd			~/goinfre/Utils
else
	echo	"$PYCHARM already installed."
fi

if ! [ -d $INSOMNIA ]; then
	echo	"$INSOMNIA is not installed"
	curl -L	$INSOMNIA_URL > $INSOMNIA.deb
	dpkg -x $INSOMNIA.deb  $INSOMNIA
	rm -rf	$INSOMNIA.deb

	cd			~/.local/share/applications/
	echo "
	[Desktop Entry]
	Name=$INSOMNIA
	Exec=\"$UTILS/$INSOMNIA/opt/Insomnia/insomnia\" %U
	Icon=$ICONS/insomnia.svg
	Terminal=false
	Type=Application
	Comment=The Collaborative API Design Tool
	Keywords=GraphQL;REST;gRPC;SOAP;openAPI;GitOps;
	Categories=Development;
	StartupWMClass=Insomnia
	StartupNotify=true" > $INSOMNIA.desktop

	cd			~/goinfre/Utils
else
	echo	"$INSOMNIA already installed."
fi

# if ! [ -d $FLEET ]; then
# 	echo	"$FLEET is not installed"
# 	curl -L	$FLEET_URL > $FLEET.tar.gz
# 	mkdir	$FLEET
# 	tar -xf	$FLEET.tar.gz	-C $FLEET --strip-components=1
# 	rm -rf	$FLEET.tar.gz

# 	# cd		$UTILS/$FLEET/bin
# 	#	install extension with fleet.sh ??

# 	cd		~/.local/share/applications/
# 	echo "
# 	[Desktop Entry]
# 	Name=$FLEET
# 	Version=2024.1.2
# 	Exec=\"$UTILS/$FLEET/bin/fleet\" %u
# 	Icon=$UTILS/$FLEET/bin/fleet.svg
# 	Terminal=false
# 	Type=Application
# 	Comment=A cross-platform C and C++ IDE
# 	Categories=Development;IDE;
# 	StartupWMClass=jetbrains-webstorm
# 	StartupNotify=true" > $FLEET.desktop

# 	cd			~/goinfre/Utils
# else
# 	echo	"$FLEET already installed."
# fi

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

	cd			~/goinfre/Utils
else
	echo	"$VSCODE already installed."
fi

gsettings set org.gnome.shell favorite-apps "['org.gnome.Nautilus.desktop', 'org.gnome.Terminal.desktop', 'google-chrome.desktop', '$CLION.desktop', '$WEBSTORM.desktop', '$PYCHARM.desktop', '$INSOMNIA.desktop', '$VSCODE.desktop', 'discord.desktop', 'slack.desktop']"

# https://data.services.jetbrains.com/products?code=CL&fields=releases
# https://data.services.jetbrains.com/products?code=WS&fields=releases
# https://data.services.jetbrains.com/products?code=PCP&fields=releases

# {CODE} :
	# clion: CL
	# datagrip: DG
	# phpstorm: PS
	# dataspell: DS
	# aqua: QA
	# mps: MPS
	# appcode: AC
	# rubymine: RM
	# rustrover: RR
	# writerside: WRS
	# webstorm: WS
	# goland: GO
	# pycharm: PCP
	# intellij: IIU
	# fleet: FLL

# echo "Configuration (idea.config.path):"
# "#~/.config/JetBrains/IDE"
# ln -sf /sgoinfre/xcharra/.config ~/.config/JetBrains

# echo "Plugins (idea.plugins.path):"
# ln -sf /sgoinfre/xcharra/.local/share ~/.local/share/JetBrains
# "#~/.local/share/JetBrains/IDE"

# echo "System (idea.system.path):"
# ln -sf /sgoinfre/xcharra/.cache/JetBrains ~/.cache/JetBrains
# "#~/.cache/JetBrains/IDE"

# echo "Logs (idea.log.path):"
# "#~/.cache/JetBrains/IDE/log"

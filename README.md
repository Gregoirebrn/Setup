# Setup
Command &amp; Files for automated Install on Linux of Clion, Pycharm &amp; Webstorm

---

### Update

The links of each ide should be updated by hand in the script.

To do so you can see the latest updates of each one below.

Enable the pretty-print case when you clicked on a link, it will be much more redable. 

Clion :
```
https://data.services.jetbrains.com/products?code=CL&fields=releases
```

Pycharm :
```
https://data.services.jetbrains.com/products?code=PCP&fields=releases
```

WebStorm :
```
https://data.services.jetbrains.com/products?code=WS&fields=releases
```

---

### Install
Copy the ide.sh in your ~/local/bin 

```
vim .local/bin/ide.sh
```

---

### Notice

If you only want some of the ide you can comment the if part in the code of the one you don't want like this part :
Fleet is commented because it doesn't work for know.

Example of the code :
```
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
```

---

### Command to launch

After saving it in a file you now should do :
```
source ide.sh
```
If you don't have the permissions type :

```
chmod +x ide.sh
```
---
### Startup Application for linux

You add this command to your startup applications on the command line :
```
"/home/<username>/.local/bin/ide.sh" %u
```

## Check For Updates

For all editors check the OS !

WebStorm    : https://www.jetbrains.com/webstorm/download/#section=linux

Clion       : https://www.jetbrains.com/clion/download/#section=linux

## If you ❤️Like❤️ the project you can give it a ⭐Star⭐

#!/bin/bash
# https://www.zotero.org/support/installation

[ -d "$REPOS" ] || REPOS="."
IDIR="$REPOS/zotero"

ZSYSTEM="$HOME/.local/share/zotero/system"
[ -d "$ZSYSTEM" ] || mkdir -p "$ZSYSTEM"
# ZLIBRARY="$HOME/data/Zotero"

if [ "$1" == "" ]; then	
	curl -L -o zotero.tar.bz2 "https://www.zotero.org/download/client/dl?channel=release&platform=linux-x86_64&version=6.0.27"
	[ "$(command -v dtrx)" ] || sudo apt install dtrx
	dtrx --one rename zotero.tar.bz2
	mv zotero "$IDIR"
	rm zotero.tar.bz2

	# update .desktop file for install location and link for launchers
	"$IDIR/set_launcher_icon"
	desktoplink="$HOME/.local/share/applications/zotero.desktop" 
	if [ -e "$desktoplink" ]; then
		rm "$desktoplink"
	fi
	ln -sv "$(realpath $IDIR/zotero.desktop)" "$desktoplink"

	# separate metadata from pdfs for syncing

elif [ "$1" == "remove" ]; then
	read -p "Uninstall Zotero repo? (y/n): "
	if [[ $REPLY =~ ^[Yy]$ ]]; then
	  [ -d "$desktoplink" ] && rm "$IDIR"
		[ -d "$IDIR" ] && rm -r "$IDIR"
	else
		echo "User aborted uninstall"
	fi
fi

# plugins
# local plugins="$HOME/.local/share/zotero/plugins"
# cd "$plugins"
# wget https://github.com/jlegewie/zotfile/releases/download/v5.1.2/zotfile-5.1.2-fx.xpi
# wget https://github.com/retorquere/zotero-better-bibtex/releases/download/v6.7.122/zotero-better-bibtex-6.7.122.xpi
# wget https://github.com/wshanks/Zutilo/releases/download/v3.10.0/zutilo.xpi

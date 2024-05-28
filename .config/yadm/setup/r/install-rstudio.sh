#!/usr/bin/env bash
# ubuntu 22.04, https://dailies.rstudio.com/links/#stable-builds
TYPE=${1:-desktop}
case "$TYPE" in
	desktop)
		URL="https://rstudio.org/download/latest/stable/desktop/jammy/rstudio-latest-amd64.deb"
		DEB="rstudio-latest-amd64.deb"
		;;
	server)
		URL="https://rstudio.org/download/latest/stable/server/jammy/rstudio-server-latest-amd64.deb"
		DEB="rstudio-server-latest-amd64.deb"
		;;
	*)
		echo "Usage: $0 [desktop|server]"
		exit 1
esac
wget "$URL" -O "$DEB"
sudo dpkg -i "$DEB" 
rm "$DEB"

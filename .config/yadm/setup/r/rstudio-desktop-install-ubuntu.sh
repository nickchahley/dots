#!/bin/bash
# stable builds at https://posit.co/download/rstudio-desktop/#download
# daily builds for ubuntu 22.04 at https://dailies.rstudio.com/rstudio/spotted-wakerobin/desktop/jammy/
sudo apt install -y gdebi-core
wget https://download1.rstudio.org/electron/jammy/amd64/rstudio-2023.09.0-463-amd64.deb
sudo gdebi rstudio-2023.09.0-463-amd64.deb

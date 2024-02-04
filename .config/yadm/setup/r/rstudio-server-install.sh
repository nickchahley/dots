#!/bin/bash
# ubuntu 22.04, https://posit.co/download/rstudio-server/
sudo apt install -y gdebi-core
wget https://download2.rstudio.org/server/jammy/amd64/rstudio-server-2023.06.0-421-amd64.deb
sudo gdebi rstudio-server-2023.06.0-421-amd64.deb

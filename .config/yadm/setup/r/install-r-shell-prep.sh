#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
# Add cran repo in order to install r >= 4.3 for compatability w/ bioconductor
# tools (ex. mageckflute)
sudo apt update -y
sudo apt install software-properties-common dirmngr -y
wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | sudo tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc

# The CRAN repository key fingerprint is E298A3A825C0D65DFD57CBB651716619E084DAB9. Can verify the downloaded key by printing it with the below command
#gpg --show-keys /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc

# prompts user to hit enter
sudo add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/"

# base r and devtools for installing packages from github (ex. tidyproteomics)
sudo apt install -y r-base r-base-dev r-cran-devtools

# add local library path to R environment if DNE
if [ ! -f ~/.Renviron ]; then
	echo "R_LIBS=~/.local/share/R" >> ~/.Renviron
fi

# Rscript to install bioconductor and friends in R
"$SCRIPT_DIR"/install-r-bioconductor-tools.r

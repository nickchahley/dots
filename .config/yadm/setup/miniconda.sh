# Bootstrap conda env
# Assumption is that paths added by `conda init` are already in shell configs
CONDA_INSTALL="$HOME/.miniconda3"
mkdir -p "$CONDA_INSTALL"
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O "$CONDA_INSTALL"/miniconda.sh
bash "$CONDA_INSTALL"/miniconda.sh -b -u -p "$CONDA_INSTALL"
rm -rf "$CONDA_INSTALL"/miniconda.sh

"$CONDA_INSTALL/bin/conda" update conda
"$CONDA_INSTALL/bin/conda" install -y python

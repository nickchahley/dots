#!/bin/bash
# Manual setup for nvim-dap-python

# might require
sudo apt install -y python3-venv

# nvim dap
VENV="$HOME/.virtualenvs"
if ! [[ -d "$VENV" ]]; then
	mkdir "$VENV"
fi
python3 -m venv "$VENV"/debugpy
pyexec="$VENV"/debugpy/bin/python
yes | "$pyexec" -m pip install debugpy pytest

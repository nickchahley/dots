#!/bin/bash
# Manual setup for nvim-dap-python

# might require
sudo apt install -y python3-venv

# nvim dap
D="$(pwd)"
VENV="$HOME/.virtualenvs"
if ! [[ -d "$VENV" ]]; then
	mkdir "$VENV"
fi
cd "$VENV"
python3 -m venv debugpy
debugpy/bin/python -m pip install -y debugpy
cd "$D"

debugpy/bin/python -m pip install -y pytest

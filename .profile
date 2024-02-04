# I remain very confused about all the profile, zprofile, bash_profile stuff.
# Sometimes variables declared here are/not accessible in my interactive shell,
# sometimes there is differential access between zsh and a script w/ #!/bin/bash
# Sourcing profile with .zshrc in compatability mode has not worked for me
# I just want to be able to have one place to sort out my PATH and still be able
# to use multiple shells
#
# Update 2023-11: env variables here 

export EDITOR=/usr/bin/nvim

# Keyboard layout (X servers)
# setxkbmap -layout us -variant colemak -option "caps:escape"
setxkbmap -option "caps:escape"

# trying for video acceleration (really just non-laggy browsers when videos
# playing)
export MOZ_DISABLE_RDD_SANDBOX=1
export MOZ_ENABLE_WAYLAND=1

# doubling up on PATH envs that are also in .zshenv
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/bin/scripts:$PATH"
. "$HOME/.cargo/env"

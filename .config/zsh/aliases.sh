ZAL="~/.config/zsh/aliases.sh"
source $XDG_CONFIG_HOME/aliases.sh
alias ra="source $ZAL"
alias alz="vim $ZAL && raz"

# trying some replacements for default unix tools
if [ -f "$HOME/.cargo/bin/eza" ]; then
	alias ls='eza'
	alias tree='eza --tree'
fi

# vim: ft=bash: ts=2: sw=2: set nowrap:

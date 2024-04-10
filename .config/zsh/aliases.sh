source $XDG_CONFIG_HOME/aliases.sh
alias raz='source ~/.config/zsh/aliases.sh'
alias alz='vim ~/.config/aliases.sh && raz'

# trying some replacements for default unix tools
if [ -f "$HOME/.cargo/bin/eza" ]; then
	alias ls='eza'
	alias tree='eza --tree'
fi

# Terminal clipboard utilites {{{
# `p` executes v cmd first and then substitutes it in place
# pwd | y %% echo `p` 
if [ $XDG_SESSION_TYPE = 'wayland' ]; then
	alias y='wl-copy'                      
	alias p='wl-paste'
	alias lns='ln -s "`wl-paste`"'
	alias lnp='linktopaste'
	alias ycd='pwd | y'
	alias cdp='cd "`wl-paste`"'
	alias mvp='mv "`wl-paste`" ./'
	alias ep='nvim `wl-paste`'
else
	alias y='xclip -selection clipboard'  # System clipboard
	alias p='xclip -o -selection clipboard'
	alias lns='ln -s "`xclip -o`"'
	alias ycd='pwd | y'
	alias cdp='cd "`xclip -o`"'
	alias mvp='mv "`xclip -o`" ./'
	alias ep='nvim `xclip -o`'
fi
# }}}

# vim: ft=bash: ts=2: sw=2: set nowrap:

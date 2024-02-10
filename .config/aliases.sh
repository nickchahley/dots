# TODO into bin for fish compat

# copy the hash of the previous commit to system clipboard
# alias gitlastci='git rev-parse --short HEAD | xclip -selection clipboard; echo SHA of last commit copied to clipboard'
alias giteditlastci='git rebase -i $(git rev-parse HEAD)'

# Populate commit message with those of orphaned commits (ex. when squashing
# after a soft resest)
alias gitcs='git commit --edit -m"$(git log --format=%B --reverse HEAD..HEAD@{1})"'

		# is_installed () {
		# 	dpkg -s "$@" | grep Status
		# }
		#
		# is_installed_verbose () {
		# 	for pkg in "$@"; do
		# 		s="$(dpkg -s "$@" | grep Status )"
		# 		echo "$pkg\t$s"
		# 	done
		# }
		# alias doihave='is_installed'
		# alias doihaves='is_installed_verbose'

# Aliases set using logic are moved to respective shell's aliases file
# ex. ~/.config/zsh/aliases.sh, ~/.config/fish/aliases.fish
alias vim='nvim' # Muscle memory is still vim
alias realias='source ~/.config/aliases.sh'
alias aliases='vim ~/.config/aliases.sh && realias'
alias ra='realias'
alias al='aliases'
alias whichdistro='lsb_release -a'
#alias thefuck='fuck'

alias ...='cd ../../'
alias ....='cd ../../../'
alias mkdirs='mkdir -p'
alias mine='chown -R nikoli:nikoli'
alias has='touch'
alias makework='chmod +x'
alias work='chmod +x'
alias pls='chmod +x'
alias please='chmod -R 770'
alias everyones='chmod -R 777'
alias tarzip='tar -czvf'
alias cp='cp -v'
alias mv='mv -v'
alias so='source'
alias rename='rename -v'
alias prename='perl-rename'
alias nrename='rename -n' # Up+home+del to actually run the rename
alias rp='realpath'
alias rl='readlink'
alias duh='du -h' # >> dust
alias rsync='rsync --info=progress2'
alias rsync_changes='rsync --info=progress2 --delete -r'
alias sudoe='sudo -E'
alias sudoedit='sudo -E nvim'
alias isudo='sudo -i'
alias tree='tree -C'
alias wcl='wc -l'

alias myip='dig +short myip.opendns.com @resolver1.opendns.com'
alias whatmyip='dig +short myip.opendns.com @resolver1.opendns.com'
alias pubip='curl ifconfig.me'


# TODO learn to use this crazy shit
# for the pushd and popd commands that I shoud use but don't understand
alias dirs='dirs -v'

# Navigation 
alias pro='cd ~/projects'
alias doc='cd ~/documents'
alias reports='cd ~/documents'
alias dat='cd ~/data'
alias data='cd ~/data'
alias db='cd ~/data/Databases'
alias dot="cd ~/.dotfiles"
alias con='cd ~/.config'
alias lbin="cd ~/.local/bin"
alias lb="cd ~/.local/bin"
alias lshare="cd ~/.local/share"
alias lsh="cd ~/.local/share"
alias repos="cd ~/.local/repos"
alias lr="cd ~/.local/repos"


	# Apt {{{
		alias addppa='sudo add-apt-repository'
		alias badppa='sudo add-apt-repository -r'
		alias agud='sudo apt update'
		alias agi='sudo apt install'
		alias agis='sudo apt install -s'
		alias agiy='sudo apt install -y'
		alias agug='sudo apt update && sudo apt upgrade'
		alias agr='sudo apt remove'
		alias agar='sudo apt autoremove'
		# search for by keywoard
		alias agcs='apt-cache search'
		alias afs='apt-file search'
		alias searchpkg='apt-file search'
		# purge: rm package and all config files
		alias agrp='sudo apt --purge remove'
		alias agpr='sudo apt --purge remove'
		alias agrpy='sudo apt --purge remove -y'
		alias agpry='sudo apt --purge remove -y'
	# }}}
# }}}
	# use for terminal {{{
		alias dontwant='\rm -r'
		alias dowant='cp -r'
		alias cya='sudo reboot'
		alias kthxbai='sudo shutdown now'
		# :(
		alias encourage='cat "/home/nikoli/Documents/Nice Words/micheal_blough"'
	# }}}
# }}}
# Literal Trash Commands {{{
	# Using rm to move files to trash is like weed. It is common and pleasing but
	# can be bad for you in the future. 
	# \rm : bypass alias you really need to use rm
	# alias rm='echo "This is not the command you are looking for."; false'
	alias tr='trash-put'
	alias trls='trash-list'
	alias tr-ls='trash-list'
	alias trrm='trash-empty'
	alias rmtr='trash-empty' #nicer to type vs trrm
	alias tr-rm='trash-empty'
	alias trrs='trash-restore'
	alias rstr='trash-restore'
	alias tr-rs='trash-restore'
# }}}
# Fortune {{{
	alias addfort='vim ~/.config/fortunes/nikoli && strfile ~/.config/fortunes/nikoli'
	alias addfortune='vim ~/.config/fortunes/nikoli && strfile ~/.config/fortunes/nikoli'
# }}}
# Misc {{{
	# Unicode char lookup : unidat | grep 'STRING'
	# now merged, b/c we can remember how to work a grep w/o a reminder
	alias unidat='cat ~/linux/UnicodeCharts/UnicodeData.txt | grep -i'
	# rebuild font cache (after putting new fonts into ~/.fonts)
	alias newfonts='fc-cache -f -v'
	alias buildfonts='fc-cache -f -v'
# }}}
# Executables {{{
	alias mp='setsid mupdf'
	alias ok='setsid okular'
	alias xo='xdg-open'
# }}}
# Music {{{
	alias tag='mid3v2' # mutagen based, id3 2.4 tags, play nice w/ scdl
	#alias scdl='scdl -c' # continue if music already exists
	#alias scdla='scdl --addtofile'
	alias ytdl='youtube-dl -x --audio-format mp3'
	alias mus='~/Music/'
	alias music='cd ~/music/library/'
# }}}
# media
# set default audio dev to bluetooth headphones (airpods)
alias pablu='paswitch blue'
alias pablue='paswitch blue'
# Dualshock 4
alias ds4='ds4drv --hidraw --led 000000'
alias ds4b='ds4drv --hidraw --led 00ffff'

# displays backlight, monitors
alias whichdisplays='xrandr -q | grep " connected"'
alias whichscreens='xrandr -q | grep " connected"'
alias light='brightnessctl set'
alias howbright='brightnessctl'
alias bedcoding='brightnessctl set 1'
alias bedtime='brightnessctl set 1'

alias ctla4uniprot='P16410'
alias ctla4string='ENSP00000497102'
alias ctla4string11='ENSP00000303939'

# https://askubuntu.com/questions/1163390/how-do-i-find-version-of-intel-graphics-card-drivers-installed
alias videoapaters="lspci -k | grep -EA3 'VGA|3D|Display'"
alias swaywindows='swaymsg -t get_tree | less'
alias swayouts='swaymsg -t get_outputs'

# alias ls='exa'
# Apply the bash default aliases for ls and grep 
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias bat='batcat'

alias cn='~/.config/nvim/lua'
alias cnm='nvim ~/.config/nvim/lua/modules'
alias cs='cd ~/.config/sway'
alias cq='cd ~/.config/qutebrowser'
alias ecq='vim ~/.config/qutebrowser/config.py'
alias csw='nvim ~/.config/sway'
alias es='nvim ~/.config/sway/config'
alias esc='vim ~/.config/sway/compatible.config'
alias eal='nvim ~/.config/alacritty/alacritty.yml'

# want to have these also cd into the current file dir
# cd %:p:h:pwd
alias wiki='nvim +VimwikiIndex +cd\ %:p:h'
alias diary='nvim +VimwikiMakeDiaryNote +cd\ %:p:h'

alias whichgtk='gsettings get org.gnome.desktop.interface gtk-theme'
alias ggdi='gsettings get org.gnome.desktop.interface'
alias gsdi='gsettings set org.gnome.desktop.interface'
alias color='hyprpicker -a'
alias update_starship='curl -sS https://starship.rs/install.sh | sh'
alias disable_conda_prompt_modifier='conda config --set changeps1 False'
alias pw='bw get password'
alias un-'bw get username'
alias genpw='bw generate -luns --length 14'
alias genpp='bw generate --passphrase --words 4 --separator --includeNumber'
alias network-connections='nmcli con show'
alias network-scan='nmcli -p device wifi'
alias f='source ranger'
alias ca='conda activate'
alias cg='conda activate graphs'
alias cap='conda activate preprocessing'
alias cel='conda env list'
alias co='conda'
alias amix='pavucontrol'

alias xm5-on='bluetoothctl connect 88:C9:E8:4A:03:97'
alias xm5-off='bluetoothctl disconnect 88:C9:E8:4A:03:97'
alias xm4-on='bluetoothctl connect F8:4E:17:34:41:12'
alias xm4-off='bluetoothctl disconnect F8:4E:17:34:41:12'

alias acget='curl --cookie ~/.cookies/adventofcode.txt >> input.txt'
alias lc='libreoffice --calc'
alias files='nautilus .'
alias fil='nautilus .'
alias sm='swaymsg'
alias keyvar='swaymsg input type:keyboard xkb_variant'
alias ya='yadm'
# vim: ft=bash: ts=2: sw=2: set nowrap:

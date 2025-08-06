# Aliases set using logic are moved to respective shell's aliases file
# ex. ~/.config/zsh/aliases.sh, ~/.config/fish/aliases.fish
[[ -f ~/.config/local.aliases.sh ]] && source ~/.config/local.aliases.sh

alias resh='exec $SHELL'

# TODO into bin for fish compat
alias psed='perl -i -p -e'

# fixme: these stall startup ??
# alias fzfp="fzf --preview='cat {}'"
# alias fpn="nvim $(fzf --preview='cat {}')"

# get octal permissions
alias perm='stat -c "%a %n"'

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
alias treed='\tree -d -C'
alias tt='tree -L2'
alias treed2='\tree -C -d -L 2'
alias t2='tree -L2'
alias tree3='tree -L3'
alias t3='tree -L3'
alias treed3='\tree -C -d -L 3'
alias tree4='tree -L4'
alias t4='tree -L4'
alias treed='\tree -C -d'
alias hg='history | grep'
alias svim='sudo -E nvim'
alias hg='history | grep'
alias vim='nvim' # Muscle memory is still vim
alias vims='vim -S Session.vim'
alias realias='source ~/.config/aliases.sh'
alias aliases='vim ~/.config/aliases.sh && realias'
alias ra='realias'
alias al='aliases'
alias whichdistro='lsb_release -a'
#alias thefuck='fuck'

# Terminal clipboard utilites. Deps on clip exec which should be tracked along
# with this file
alias y='clip copy'
alias p='clip paste'
alias pi='clip paste_im'
alias lns='ln -s "`y`"'
alias py='pwd | y'
alias cdp='cd "`p`"'
alias mvp='mv "`p`" ./'
alias ep='nvim `p`'

# copy the hash of the previous commit to system clipboard
# alias gitlastci='git rev-parse --short HEAD | xclip -selection clipboard; echo SHA of last commit copied to clipboard'
alias git-ammendci='git rebase -i $(git rev-parse HEAD)'

# Populate commit message with those of orphaned commits (ex. when squashing
# after a soft resest)
alias git-lastci='git commit --edit -m"$(git log --format=%B --reverse HEAD..HEAD@{1})"'
alias git-sci='git commit --edit -m"$(git log --format=%B --reverse HEAD..HEAD@{1})"'

# fast git and default dvc init
alias update-dvc='cp ~/data/dvc-bookmarks/config .dvc/config'
alias git-dvc='git init && dvc init && cp ~/data/dvc-bookmarks/config .dvc/config'
alias dvcinit='mkdir .dvc && cp ~/data/dvc-bookmarks/config .dvc/config'
alias cpdvc='cp ~/data/dvc-bookmarks/config .dvc/config'

alias dvcl='dvc list --dvc-only -R' 

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
	alias alug='apt list --upgradable'
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
alias dpi='sudo dpkg -i'
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
# Dualshock 4
alias ds4='ds4drv --hidraw --led 000000'
alias ds4b='ds4drv --hidraw --led 00ffff'

# displays backlight, monitors
alias whichdisplays='xrandr -q | grep " connected"'
alias whichscreens='xrandr -q | grep " connected"'
alias light='brightnessctl set'
alias howbright='brightnessctl'
alias dim='brightnessctl set 1'
alias bedcoding='brightnessctl set 1'
alias bedtime='brightnessctl set 1'

alias ctla4uniprot='P16410'
alias ctla4string='ENSP00000497102'
alias ctla4string11='ENSP00000303939'

# https://askubuntu.com/questions/1163390/how-do-i-find-version-of-intel-graphics-card-drivers-installed
alias videoapaters="lspci -k | grep -EA3 'VGA|3D|Display'"
alias swaywindows='swaymsg -t get_tree | vim'
alias swayouts="swaymsg -pt get_outputs | grep -e 'Output\|Current\|Position'"
alias sm='swaymsg'
alias smo="swayouts"
alias kr="kanshi-reload && swaymsg -p -t get_outputs | grep 'Output\|Current\|Position'"
alias kancon="vim ~/.config/kanshi/config && kanshi-reload"
alias dp1up='swaymsg output "eDP-1" position 0 1080 && swaymsg output "DP-1" position 0 0 mode 1920x1080'
alias sshcon="vim ~/.ssh/config"

# Apply the bash default aliases for ls and grep 
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias bat='batcat'
# ls aliases subject to be overwritten by scm-breeze
alias ls='ls --color=auto'
alias lal='ls -alF'
alias la='ls -A'
alias lsa='ls -A'
alias lsl='ls -alF'
alias l='\ls -CF'

alias cn='~/.config/nvim/lua'
alias cnm='nvim ~/.config/nvim/lua/modules'
alias cs='cd ~/.config/sway'
alias cq='cd ~/.config/qutebrowser'
alias ecq='vim ~/.config/qutebrowser/config.py'
alias csw='nvim ~/.config/sway'
alias es='nvim ~/.config/sway/config'
alias esc='vim ~/.config/sway/compatible.config'
alias eal='nvim ~/.config/alacritty/alacritty.yml'
alias ftl='/home/nikoli/.steam/debian-installation/steamapps/common/FTL Faster Than Light/FTL'

# want to have these also cd into the current file dir
# cd %:p:h:pwd
alias wiki='nvim +VimwikiIndex +cd\ %:p:h'
alias diary='nvim +VimwikiMakeDiaryNote +cd\ %:p:h'

alias whichgtk='gsettings get org.gnome.desktop.interface gtk-theme'
alias ggdi='gsettings get org.gnome.desktop.interface'
alias gsdi='gsettings set org.gnome.desktop.interface'
alias update_starship='curl -sS https://starship.rs/install.sh | sh'
alias disable_conda_prompt_modifier='conda config --set changeps1 False'

# Bitwarden cli
alias pw='bw get password'
alias un-'bw get username'
alias genpw='bw generate -luns --length 14'
alias genpp='bw generate --passphrase --words 4 --separator --includeNumber'

# writing docs and wanting to quickly take and name screenshots
alias grima='grimshot --notify save area'
alias grimw='grimshot --notify save window'


# Network
alias myip='dig +short myip.opendns.com @resolver1.opendns.com'
alias whatmyip='dig +short myip.opendns.com @resolver1.opendns.com'
alias pubip='curl ifconfig.me'
alias network-connections='nmcli con show'
alias network-scan='nmcli -p device wifi'

# Conda
alias ca='conda activate'
alias cg='conda activate graphs'
alias cap='conda activate preprocessing'
alias cel='conda env list'
alias co='conda'
alias crm='conda remove --yes --all -n'

# Bluetooth
alias blue='bluetoothctl'
alias xm5-on='bluetoothctl connect 88:C9:E8:4A:03:97'
alias xm5-off='bluetoothctl disconnect 88:C9:E8:4A:03:97'
alias xm4-on='bluetoothctl connect F8:4E:17:4D:07:77'
alias xm4-off='bluetoothctl disconnect F8:4E:17:4D:07:77'
alias xmfn='xm4-on'
alias xmff='xm4-off'
alias corne-init='bluetoothctl pair C6:C7:CE:8D:6C:C3 && bluetoothctl trust C6:C7:CE:8D:6C:C3 && bluetoothctl connect C6:C7:CE:8D:6C:C3'

alias dkr='docker kill rev-proxy-service'
alias csvl='csvlook'
alias csvc='csvcut'
alias acget='curl --cookie ~/.cookies/adventofcode.txt >> input.txt'
alias lc='libreoffice --calc'
alias files='nautilus .'
alias keyvar='swaymsg input type:keyboard xkb_variant'
alias ya='yadm'
alias fman='compgen -c | fzf | xargs man'
alias ts='tomatoshell'
alias userdata='cat /home/nikoli/projects/00007-aws-ec2/user-data/nikoli-user-data.yaml | y'
alias ta='tmux attach -t'
alias tat='tmux attach -t'
alias tad='tmux attach -t diary'
alias f='source ranger'
alias amix='pavucontrol'
alias trimtoken="rename 's/\?token.*//' *"
alias awso='aws sso login --profile admin'
alias colnames='csvcut --names'

# sway monitor overrides
alias so-hdmi-right='output "eDP-1" position 0 0 && sm output "HDMI-A-1" position 1920 0'

alias ports-listening='sudo lsof -i -P -n | grep LISTEN'
alias ports="sudo lsof -i -P -n"
alias kp="~/projects/00011-saas-proxy/rev-proxy-dev/scripts/kill_on_ports.sh"
alias rplp="~/projects/00011-saas-proxy/rev-proxy-dev/scripts/kill_on_ports.sh && ~/projects/00011-saas-proxy/rev-proxy-dev/scripts/launch_preamble.sh"
alias kdpr="sudo fuser -k 5000/tcp"

# vim: ft=bash: ts=2: sw=2: set nowrap:

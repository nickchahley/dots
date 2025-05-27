P10K=true

include () {
	for f in "$@"; do
		[[ -f "$f" ]] && source "$f"
	done
}

## prompts, we have p10k and startship
if "$P10K"; then
	# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
	# Initialization code that may require console input (password prompts, [y/n]
	# confirmations, etc.) must go above this block; everything else may go below.
	include "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
else 
	eval "$(starship init zsh)"
fi

# Make terminal feel like home
if [ "$(command -v fortune)" ]; then
    fortune $HOME/.config/fortunes/nikoli
    alias fortune='fortune $HOME/.config/fortunes/nikoli'
fi

# START PLUGINS ----

# zsh plugin manager
ZNAPDIR=$HOME/.local/repos/znap/
[[ -r $ZNAPDIR/znap.zsh ]] ||
	git clone --depth 1 -- \
			https://github.com/marlonrichert/zsh-snap.git $ZNAPDIR 
source $ZNAPDIR/znap.zsh

# source will both clone and start a plugin
if "$P10K"; then
	znap source romkatv/powerlevel10k
fi
znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-history-substring-search
znap source joshskidmore/zsh-fzf-history-search

# an alternative to simple fuzzy tab completion implemented below
# feels a bit disruptive to my shell workflow
# znap source Aloxaf/fzf-tab

# everybody says to source syntax-highlighting as last plugin
znap source zsh-users/zsh-syntax-highlighting

# END PLUGINS ----

## open new terminals in the last working dir
function cd
{
    builtin cd "$@"
    pwd > ~/.lastdir
}

# Fuzzy tab-completion matching from some person on stackexchange
# 0 -- vanilla completion (abc => abc)
# 1 -- smart case completion (abc => Abc)
# 2 -- word flex completion (abc => A-big-Car)
# 3 -- full flex completion (abc => ABraCadabra)
zstyle ':completion:*' matcher-list '' \
  'm:{a-z\-}={A-Z\_}' \
  'r:[^[:alpha:]]||[[:alpha:]]=** r:|=* m:{a-z\-}={A-Z\_}' \
  'r:|?=** m:{a-z\-}={A-Z\_}'

# Precaution incase XDG_CONFIG_HOME is unset? What is wrong with me?
export ZSHCONFIG=${XDG_CONFIG_HOME:=$HOME/.config}/zsh
include $HOME/.aliases.sh
include $ZSHCONFIG/aliases.sh

# Enable 256 color support for applications
# I have never actually used xterm, I really don't understand the whole $TERM
# variable thing. Confusion peaked when I read about people going through steps
# to be able to set/use $TERM="alacritty" --what are the reasons for doing that?
[ "$TERM" = "xterm" ] && export TERM=xterm-256color

# Use vim as the manpager (requires vim-manpager)
export MANPAGER="nvim -c MANPAGER -"

# Enable extglob pattern recognition
setopt extendedglob

# Make globbing case insensitive
unsetopt CASE_GLOB

# Change directory given just path
setopt autocd

# Share history between multiple zsh sessions
HISTFILE=$ZSHCONFIG/zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt INC_APPEND_HISTORY_TIME

# No beep on error, no errors if no pattern match
unsetopt beep nomatch

# do not close terminal on <C-d>
set -o ignoreeof

# thefuck config
# toggleable b/c can be slow sometimes
# NTS: if [ false ]; and if [ 0 ] actually return true
if false; then
	eval $(thefuck --alias)
	unsetopt correct
	unsetopt correct_all
	eval $(thefuck --alias --enable-experimental-instant-mode)
fi

# Fuzzy Search
# Added by .fzf/install; see .fzf/uninstall for removal
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh
if [[ -f /usr/share/autojump/autojump.zsh ]]; then
	. /usr/share/autojump/autojump.zsh
fi

# Use ripgrep for fzf
[[ -n rg ]] && export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'

# want to be able to fuzzy search file contents
# using ripgrep combined with preview
fif() {
	# find-in-file - usage: fif <searchTerm>, `fif .` to open search for all in cwd
  if [ ! "$#" -gt 0 ]; then echo "Need a string to search for!"; return 1; fi
  rg --files-with-matches --no-messages "$1" | fzf --preview "highlight -O ansi -l {} 2> /dev/null | rg --colors 'match:bg:yellow' --ignore-case --pretty --context 10 '$1' --preview-window='70%:wrap' || rg --ignore-case --pretty --context 10 '$1' {}"
}

# FIXME: why do I have this? Does it work?
rga-fzf() {
	# open file after the fuzzy search of contents. Should also search pdfs, docs
	RG_PREFIX="rga --files-with-matches"
	local file
	file="$(
		FZF_DEFAULT_COMMAND="$RG_PREFIX '$1'" \
			fzf --sort --preview="[[ ! -z {} ]] && rga --pretty --context 5 {q} {}" \
				--phony -q "$1" \
				--bind "change:reload:$RG_PREFIX {q}" \
				--preview-window="70%:wrap"
	)" &&
	echo "opening $file" &&
	xdg-open "$file"
}
alias rgafzf='rga-fzf'
alias rgf='rga-fzf'

# alternative using ripgrep-all (rga) combined with fzf-tmux preview
# implementation below makes use of "open" on macOS, which can be replaced by other commands if needed.
# allows to search in PDFs, E-Books, Office documents, zip, tar.gz, etc. (see https://github.com/phiresky/ripgrep-all)
# find-in-file - usage: fif <searchTerm> or fif "string with spaces" or fif "regex"
# fif() {
#     if [ ! "$#" -gt 0 ]; then echo "Need a string to search for!"; return 1; fi
#     local file
#     file="$(rga --max-count=1 --ignore-case --files-with-matches --no-messages "$@" | fzf-tmux +m --preview="rga --ignore-case --pretty --context 10 '"$@"' {}")" && open "$file"
# }

# Line Editor
# Define a custom zle widget to allow editing command in external editor
# FIXME: does not work inside of tmux
EDITOR=nvim
function edit-command-line-inplace() {
  if [[ $CONTEXT != start ]]; then
    if (( ! ${+widgets[edit-command-line]} )); then
      autoload -Uz edit-command-line
      zle -N edit-command-line
    fi
    zle edit-command-line
    return
  fi
  () {
    emulate -L zsh -o nomultibyte
    local editor=("${(@Q)${(z)${VISUAL:-${EDITOR:-vi}}}}") 
    case $editor in
      (*vim*)
        "${(@)editor}" -c "normal! $(($#LBUFFER + 1))go" -- $1
      ;;
      (*emacs*)
        local lines=("${(@f)LBUFFER}") 
        "${(@)editor}" +${#lines}:$((${#lines[-1]} + 1)) $1
      ;;
      (*)
        "${(@)editor}" $1
      ;;
    esac
    BUFFER=$(<$1)
    CURSOR=$#BUFFER
  } =(<<<"$BUFFER") </dev/tty
}

zle -N edit-command-line-inplace
# bindkey commands don't seem to work in tmux :(
bindkey "^X^E" edit-command-line-inplace

# Search history with already entered text
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/nikoli/.miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/nikoli/.miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/nikoli/.miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/nikoli/.miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

include /home/nikoli/.config/broot/launcher/bash/br
# git diff before commit
function gg {
    br --conf ~/.config/broot/git-diff-conf.toml --git-status
}

# bitwarden cli completions these seem to slow my startup so just use bw --help
# [ -f $HOME/.local/bin/bw ] && eval "$(bw completion --shell zsh); compdef _bw bw;"

[ -f /usr/bin/zoxide ] && eval "$(zoxide init zsh)"
export _ZO_ECHO=1

export FPATH="$REPOS/eza/completions/zsh:$FPATH"

# Pretty sure I have this for npm >> nvim mason 
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# nextflow bioinformatic pipes completions
# eval "$(_NF_CORE_COMPLETE=zsh_source nf-core)" # this is present inside of a
# conda env
PATH="$PATH:$HOME/.local/repos/sratoolkit.3.1.1-ubuntu64/bin"

[ -s "/home/nikoli/.scm_breeze/scm_breeze.sh" ] && source "/home/nikoli/.scm_breeze/scm_breeze.sh"

# autoload -U +X bashcompinit && bashcompinit
# complete -o nospace -C /usr/bin/terraform terraform

# env var aliases
# source ~/.aws/scripts/profile

# 2025-02-12 put this at EOF else slow launch? 
# (NC 2025-05-27) beginning or end doesn't seem to affect perceived startup
# speed
# To customize prompt, run `p10k configure` or edit $HOME/.p10k.zsh.

if "$P10K"; then
	[[ ! -f $HOME/.p10k.zsh ]] || source $HOME/.p10k.zsh
fi

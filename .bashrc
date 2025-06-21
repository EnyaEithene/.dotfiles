#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias nvim=lvim
PS1='[\u@\h \W]\$ '

export LANG=en_GB.UTF-8
export LC_ALL=en_GB.UTF-8

# Set terminal tab title to the current directory's last folder name
function set_terminal_title() {
    local title="${PWD##*/}"
    echo -ne "\033]0;${title}\007"
}

# Use the function every time you change directories
PROMPT_COMMAND="set_terminal_title"

export PATH="$HOME/bin:/usr/local/texlive/2024/bin/x86_64-linux:$HOME/.local/bin:$HOME/.dotfiles/.bin:$PATH:$HOME/.tmuxifier/bin:$PATH"
export MANPATH="/usr/local/texlive/2024/texmf-dist/doc/man:$MANPATH"
export INFOPATH="/usr/local/texlive/2024/texmf-dist/doc/info:$INFOPATH"
export EDITOR=lvim
export LIBVIRT_DEFAULT_URI=qemu:///system

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"
eval "$(starship init bash)"
eval "$(zoxide init bash)"
eval "$(tmuxifier init -)"

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

if command -v docker &> /dev/null && pgrep dockerd &> /dev/null; then
    xhost +local:docker > /dev/null 2>&1
fi

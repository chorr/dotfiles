# If not running interactively, don't do anything (leave this at the top of this file)
[[ $- != *i* ]] && return

# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
source ~/.local/share/omarchy/default/bash/rc

# Add your own exports, aliases, and functions here.
alias l="lsa"
alias lg="lazygit"
alias conf-bash="nvim ~/.bashrc"
alias conf-ghostty="nvim ~/.config/ghostty/config"
alias conf-hypr="nvim ~/.config/hypr/"
alias conf-waybar="nvim ~/.config/waybar/"
alias cd-flac="whipper cd rip --output-directory ~/Music"
alias reboot-windows="sudo efibootmgr --bootnext 0008 && sudo reboot"

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

# input method
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export INPUT_METHOD=fcitx

# path
export PATH=$HOME/.npm-global/bin:$HOME/.local/bin:$PATH

# pnpm
export PNPM_HOME="/home/chorr/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# flatpak
export XDG_DATA_DIRS=/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share:$XDG_DATA_DIRS


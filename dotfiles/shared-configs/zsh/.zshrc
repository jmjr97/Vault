# ======================================================================
# Config: zsh
# File: ~/.config/zsh/.zshrc
# Platform: shared
# ======================================================================

# Lines configured by zsh-newuser-install
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/john/.config/zsh/.zshrc'

# End of lines added by compinstall

###############
#--  Paths  --#
###############

export PATH=$PATH:~/.cargo/bin
export PATH=$PATH:~/go/bin

###############
#-- Aliases --#
###############

alias so='source ~/.config/zsh/.zshrc'

#-- Alias
alias modx="chmod u+x"

#-- navigation
alias ls="eza -a -s=type --icons=auto"
alias ll="eza -a -l -h -s=type --icons=auto"
alias ..="cd .."
alias rd='z -'

#-- pacman
alias pi="sudo pacman -S --needed"
alias pr="sudo pacman -Rns"
alias pu="sudo pacman -Syu"
alias ps="pacman -Ss"
alias pq="pacman -Qs"
alias pqe="pacman -Qe"
alias pc="checkupdates"

#-- apps
alias cat="bat"
alias top="btop"
alias ff="fastfetch"
alias spot="~/Vault/scripts/launchers/spotify.sh term"

#-- neovim
alias vim="nvim"
alias v="nvim ."
alias se="sudoedit"
alias oh="nvim ~/Dropbox/obsidian/home.md"
alias orn="nvim ~/Dropbox/obsidian/notes/_random.md"

#-- python
alias py="python"
alias pyenv="~/Vault/scripts/bash/pyenv.sh"
alias pya="source .venv/bin/activate"
alias pyd="deactivate"

#-- python scripts
alias stopwatch='/home/john/Code/python/learning/stopwatch/stopwatch.py'

#-- bash scripts
alias pclean="~/Vault/scripts/bash/pacclean.sh"

#-- archives
alias maketar="tar -czf"
alias viewtar="tar -xvzf"
alias untar="tar -xvzf"

#-- git
alias gs="git status"
alias ga="git add"
alias gaa="git add --all"
alias gc="git commit -m" 
alias gp="git push"
alias lg="lazygit -p ~/Vault/"

#-- configs
alias zconfig="vim ~/.config/zsh/.zshrc"
alias vconfig="vim ~/.config/nvim/init.lua"
alias hconfig="vim ~/.config/hypr/"
alias nconfig="vim ~/.config/niri/config.kdl"

#-- maintenance
alias pacmirrors="sudo reflector --verbose --country 'US' --latest 20 --sort rate --save /etc/pacman.d/mirrorlist"

#-- for fun
alias typetest="toipe -n 50"

####################
#-- My Functions --#
####################

function cd() {
	zo "$@"
	echo -e "\n\e[2;3;4;33m$(pwd)\e[0m"
	ls
}

function cdi() {
	zi
	echo -e "\n\e[2;3;4;33m$(pwd)\e[0m"
	ls
}

function mkd() {
	mkdir "$@"
	cd "$@"
}

###############
#-- Plugins --#
###############

source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#61afef'

bindkey '^ ' autosuggest-accept

autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-Z}'

#################
#-- Utilities --#
#################

#-- Zoxide
eval "$(zoxide init zsh)"
eval "$(zoxide init --cmd zo zsh)"

#-- Yazi
function f() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

#-- fzf
# alias fff="zle --border --exclude '.cache' -N fzf-cd-widget"
eval "$(fzf --zsh)"

zle     -N            fzf-cd-widget
bindkey -M emacs '\C-f' fzf-cd-widget
bindkey -M vicmd '\C-f' fzf-cd-widget
bindkey -M viins '\C-f' fzf-cd-widget

TRAPWINCH() {
  zle && { zle reset-prompt; zle -R }
}

#-- Git
autoload -Uz vcs_info
precmd() { vcs_info }

export EDITOR="nvim"

###############
#-- Theming --#
###############

#-- FZF Theme
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
  --highlight-line \
  --info=inline-right \
  --ansi \
  --ansi \
  --layout=reverse \
  --border=none
  --color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796 \
  --color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 \
  --color=marker:#b7bdf8,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796 \
  --color=selected-bg:#494d64 \
  --multi"

############
#-- Misc --#
############

bindkey '^[[Z' end-of-line

eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/zsh/starship.toml

# Created by `pipx` on 2024-08-23 05:13:04
export PATH="$PATH:/home/john/.local/bin"

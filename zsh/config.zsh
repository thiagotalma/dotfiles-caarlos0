#!/bin/zsh
export LSCOLORS='exfxcxdxbxegedabagacad'
export CLICOLOR=true

fpath=($DOTFILES/functions $fpath)

autoload -U "$DOTFILES"/functions/*(:t)
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# don't nice background tasks
setopt NO_BG_NICE
setopt NO_HUP
setopt NO_BEEP
# allow functions to have local options
setopt LOCAL_OPTIONS
# allow functions to have local traps
setopt LOCAL_TRAPS
# share history between sessions ???
setopt SHARE_HISTORY
# add timestamps to history
setopt EXTENDED_HISTORY
setopt PROMPT_SUBST
setopt CORRECT
setopt COMPLETE_IN_WORD
# adds history
setopt APPEND_HISTORY
# adds history incrementally and share it across sessions
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
# don't record dupes in history
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_VERIFY
setopt HIST_EXPIRE_DUPS_FIRST
# dont ask for confirmation in rm globs*
setopt RM_STAR_SILENT

zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# emacs mode
# I always enter vi mode by mistake
bindkey -e

# fuzzy find: start to type
bindkey "$terminfo[kcuu1]" up-line-or-beginning-search
bindkey "$terminfo[kcud1]" down-line-or-beginning-search
bindkey "$terminfo[cuu1]" up-line-or-beginning-search
bindkey "$terminfo[cud1]" down-line-or-beginning-search

# backward and forward word with option+left/right
bindkey '^[^[[D'    backward-word
bindkey '^[b'       backward-word
bindkey '^[[1;5D'   backward-word
bindkey '^[^[[C'    forward-word
bindkey '^[f'       forward-word
bindkey '^[[1;5C'   forward-word


# to to the beggining/end of line with fn+left/right or home/end
bindkey "${terminfo[khome]}" beginning-of-line
bindkey '^[[H'      beginning-of-line
bindkey '\e[1~'     beginning-of-line  # Linux console
bindkey '\e[H'      beginning-of-line  # xterm
bindkey '\eOH'      beginning-of-line  # gnome-terminal

bindkey "${terminfo[kend]}"  end-of-line
bindkey '^[[F'      end-of-line
bindkey '\e[4~'     end-of-line        # Linux console
bindkey '\e[F'      end-of-line        # xterm
bindkey '\eOF'      end-of-line        # gnome-terminal

# delete char with backspaces and delete
bindkey '^[[3~'     delete-char
bindkey '^?'        backward-delete-char

# delete word with ctrl+backspace
bindkey '^[[3;5~'   backward-delete-word
# bindkey '^[[3~'   backward-delete-word

# Mostrar o comando
bindkey '^[v'       quoted-insert


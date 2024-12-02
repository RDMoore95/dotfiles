env=~/.ssh/agent.env

agent_load_env () { test -f "$env" && . "$env" >| /dev/null ; }

agent_start () {
  (umask 077; ssh-agent >| "$env")
  . "$env" >| /dev/null ; }

agent_load_env

agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)

if [ ! "$SSH_AUTH_SOCK" ] || [ $agent_run_state = 2 ]; then
  agent_start
  ssh-add
elif [ "$SSH_AUTH_SOCK" ]  && [ $agent_run_state = 1 ]; then
  ssh-add
fi

unset env

# NOTE: Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi


# eval "$(oh-my-posh init zsh --config ~/.config/ohmyposh/omp.toml)"
# eval "$(oh-my-posh init zsh --config ~/.config/ohmyposh/minimal.toml)"
# eval "$(oh-my-posh init zsh --config ~/.config/ohmyposh/zen.toml)"


# NOTE: To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.

# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# autoload -Uz promptinit && promptinit && prompt powerlevel10k

# ZSH_THEME="bira"

eval "$(zoxide init zsh --cmd z)"
source <(fzf --zsh)

# zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
zstyle ':fzf-tab:*' fzf-flags --color=fg:4,fg+:3 --bind=tab:accept
zstyle ':completion:*' menu no

zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza --oneline --long --no-permissions --no-user --color=always --icons --all --header --modified --sort=modified --reverse $realpath'
zstyle ':fzf-tab:complete:cd:*' fzf-flags --height=45% --preview-window=right:80% --bind ctrl-y:preview-up --bind ctrl-e:preview-down
zstyle ':fzf-tab:complete:z:*' fzf-preview 'eza --oneline --long --no-permissions --no-user --color=always --icons --all --header --modified --sort=modified --reverse $realpath'
zstyle ':fzf-tab:complete:z:*' fzf-flags --height=45% --preview-window=right:80% --bind ctrl-y:preview-up --bind ctrl-e:preview-down

# NOTE: I'm not sure if I need the following line somewhere 
# autoload -U compinit && compinit

bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense' # optioal
# zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
# zstyle ':completion:*' format $'\e[2;37m %d\e[m'
# source <(carapace _carapace)

# zstyle ':completion:*:git:*' group-order 'main commands' 'alias commands' 'external commands'

source '/usr/share/zsh-antidote/antidote.zsh'
antidote load

if [ -f ~/.zsh_aliases ]; then
  . ~/.zsh_aliases
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"


eval "$(starship init zsh)"

export PATH="/home/dan/.cargo/bin:$PATH"

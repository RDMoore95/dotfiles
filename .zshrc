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

source '/usr/share/zsh-antidote/antidote.zsh'
antidote load

# NOTE: To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# autoload -Uz promptinit && promptinit && prompt powerlevel10k

# ZSH_THEME="bira"


source <(fzf --zsh)

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

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
# source <(carapace _carapace)

# zstyle ':completion:*:git:*' group-order 'main commands' 'alias commands' 'external commands'


eval "$(zoxide init zsh --cmd zd)"
if [ -f ~/.zsh_aliases ]; then
  . ~/.zsh_aliases
fi

eval "$(starship init zsh)"

export PATH="/home/dan/.cargo/bin:$PATH"

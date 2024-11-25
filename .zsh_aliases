alias n='nvim'
alias n.='nvim .'

alias cfg='/usr/bin/git --git-dir=/home/dan/.cfg/ --work-tree=/home/dan'
alias cfgstat='cfg status -uno'
alias cfgls='cfg ls-tree -r main --name-only'
alias cfga='cfg add -u'
alias cfgc='cfg commit -m "updated config without a commit message"'
alias cfgp='cfg push'
alias cfgall='cfga && cfgc && cfgp'

alias pacinstalled='awk "/\[ALPM\] installed/ { print $(NF-1) }" /var/log/pacman.log'

alias npmpack='npm ls --depth=0 -global'

if command -v batcat 2>&1 >/dev/null; then 
  alias bat='batcat'
fi
alias grep=rg

function nf() {
  file="$(fzf)"
  if [ ! -z "${file}" ]; then
    nvim $file
  fi
}

alias lg='lazygit'
alias yz='yazi'

alias las='ls -a'
alias lsl='ls -l'

alias cl='clear'

function zfd() {
  dir="$(fd . -t d -H | fzf --no-multi)"
  if [ ! -z "${dir}" ]; then
    zd $dir
  fi
}

alias t='tmux'

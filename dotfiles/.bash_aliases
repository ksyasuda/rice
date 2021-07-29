alias suda='sudo'

## Colorls
alias lca='colorls -A --sd -X'
alias lc='colorls --sd -X'
alias lcl='colorls --sd -Xl'
alias lcla='colorls -lA --sd -X'
alias lcal='colorls -lA --sd -X'

## Pacman/Yay
# update without noconfirm
alias spu='sudo pacman -Syu'
# cleanup orphaned packages
alias cleanup='suda pacman -Rns $(pacman -Qtdq)'
# update everything
alias upall="paru -Syu --noconfirm"

## Npm/Yarn
alias ns='npm start'
alias yb='yarn build'
alias ys='yarn start'
alias yi='yarn install'

## Git
alias gs='git status'
alias gc='git commit'
alias gp='git push'

## Helpful
alias count='ls -l | wc -l'
# use all cores
alias uac="sh ~/.bin/main/000*"
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias update-fc="suda fc-cache -fv"
alias unlock-db='suda rm /var/lib/pacman/db.lck'
alias dn='deactivate_node'
alias logs='ksystemlog &'

## youtube-dl
alias yta-best="youtube-dl --extract-audio --audio-format best"
alias yta-mp3="youtube-dl --extract-audio --audio-format mp3 --config-location ~/.config/youtube-dl/config.audio"
alias ytv-best="youtube-dl -f bestvideo+bestaudio"
# get error message from journalctl
alias jctl='journalctl -p 3 -xb'

## This is specific to WSL 2. If the WSL 2 VM goes rogue and decides not to free
## up memory, this command will free your memory after about 20-30 seconds.
## Details: https://github.com/microsoft/WSL/issues/4166#issuecomment-628493643
alias drop_cache="sudo sh -c \"echo 3 >'/proc/sys/vm/drop_caches' && swapoff -a && swapon -a && printf '\n%s\n' 'Ram-cache and Swap Cleared'\""

# mkdir
alias mkdir='mkdir -p'

## I'm Lazy
alias scripts='cd /home/sudacode/scripts'
alias freud='cd /home/sudacode/'
alias c=clear
alias btop=bpytop
alias fd='firebase deploy'
alias open='xdg-open'
alias glow='glow -p'
alias jn='jupyter-notebook'
alias blog='cd ~/projects/React/github/Sudacode-Blog-V3'
alias venv='source env/bin/activate'
alias eecs484='cd ~/projects/eecs484/project4'
alias music=ncmpcpp
alias reload='source ~/.zshrc'
alias golf='cd ~/projects/Python/SudacodeGolf/ && source env/bin/activate'
alias prolog=swipl
alias chess='cd ~/projects/React/github/sudacode-chess/'
alias temps='curl wttr.in'
alias whatsmyip='http ipinfo.io'
alias edit='sudoedit'
alias ports='sudo netstat -tupln'
alias ncdu='ncdu --color dark'

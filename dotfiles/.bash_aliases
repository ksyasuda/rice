alias sudo='sudo -v; sudo '
alias suda='sudo'

alias vi=vim

alias qutebrowser="qutebrowser --qt-arg stylesheet $HOME/.local/share/qutebrowser/fix-tooltips.qss"

# Aniwrapper
alias aniwrapper='aniwrapper -qD 144'

## Colorls
alias lca='colorls -A --sd --gs -X'
alias lc='colorls --sd --gs -X'
alias lcl='colorls --sd --gs -Xl'
alias lcla='colorls -lA --sd --gs -X'
alias lcal='colorls -lA --sd --gs -X'
alias lct='colorls --gs --tree=5'
alias ls='colorls --sd -X'

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
alias gst='git status'
alias gcmt='git commit'
alias gpush='git push'
alias gpull='git pull'

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

# wallpapers
alias mysan='feh --bg-scale ~/.wallpapers/MYSanGun-Inverted.png ~/.wallpapers/MYSanGun.png'

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
alias updates='~/SudacodeRice/scripts/package-updates'
alias aliases='cat ~/.bash_aliases'
alias sauce='~/Videos/sauce/'
alias wmedit='emc ~/.config/i3/config'
alias ani='cd $HOME/Projects/Scripts/aniwrapper'
alias archvm='VBoxManage startvm "arch-vm"'
alias chrome='google-chrome-beta --profile-directory="Profile 1" &>/dev/null &'
alias bar='~/SudacodeRice/scripts/launch_desktop.sh'
alias nord=nordvpn
alias lzd=lazydocker
alias lzg=lazygit
alias mounts='sudo ~/scripts/mounts.sh'
alias dc=docker-compose # sorry calculator
alias vimconf='vim ~/.vimrc'
alias sctl=systemctl
alias pyex='python -m'

## Rice
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias pushdots='config push senpai'
alias commitdots='config commit'
alias cs='config status'
alias f=floaterm

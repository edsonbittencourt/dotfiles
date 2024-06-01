# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
    git
    zsh-autosuggestions
    zsh-autopair
    tumult
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

export PATH=$PATH:/opt/homebrew/bin

alias k='kubectl'
alias h='history | grep -i'

mp4() {
    if [ -z "$1" ]; then
        echo "Uso: mp4 <url>"
        return 1
    fi
    
    local url="$1"
    yt-dlp -f 'bestvideo[height<=1080][ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best' \
           -S vcodec:h264 \
           --windows-filenames \
           --restrict-filenames \
           --embed-subs \
           --add-metadata \
           --add-chapters \
           --no-playlist \
           -N 4 \
           --remux-video "mp4/mkv" \
           -o "$HOME/Downloads/%(title)s.%(ext)s" \
           "$url"
}

function mp3() {
    yt-dlp -x --audio-format mp3 -o "/Users/edson/Downloads/%(title)s.%(ext)s" "$1"
}

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export PATH="$PATH:/Users/edson/.cache/lm-studio/bin"
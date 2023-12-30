# colors
export CLICOLOR=1
export LSCOLORS=GxExFxdaBxDaDahbadeche

# git branch in prompt
function parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

function precmd() {
  export PS1="%B%F{magenta}%n@%m%f:%F{cyan}%~%f%F{yellow}$(parse_git_branch)%f \$ %b"
}

# ctrl w delete word
export WORDCHARS=${WORDCHARS/\//}

# case-insensitive
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
autoload -Uz compinit && compinit -u

# custom alias
alias ll='ls -alhF'
alias la='ls -A'
alias l='ls -CF'
alias ctags="`brew --prefix`/bin/ctags"

# custom batch
batch() {
    if [ -z "$1" ]; then
        echo "error: batch sub command required."
        return
    fi

    local errors="\n"
    local sub_name="$1"

    for x in `ls`; do
        [[ -d "$x" ]] || continue
        cd $x
        pwd
        $@
        if [ $? -ne 0 ]; then
            errors+="error: $x\n"
        fi
        cd ..
    done
    echo $errors
}

# add for Android SDK NDK by J
ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/ndk/21.3.6528147

# add for repo by J
export PATH=~/bin:$PATH

# add for flutter by J
export ENABLE_FLUTTER_DESKTOP=true
export PATH=$PATH:/Volumes/XCoding/OSC/flutter/bin

# add for binutils by J
export PATH=$PATH:/usr/local/opt/binutils/bin

# add for ctags by J
alias ctags='/usr/local/bin/ctags'

# add for airport by J
alias airport='sudo /System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport'

# ADDED BY 010 EDITOR
export PATH="$PATH:/Applications/010 Editor.app/Contents/CmdLine"

source /usr/local/bin/antigen.sh

antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle command-not-found

antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

# Select theme
antigen theme robbyrussell

# Tell Antigen that you're done
antigen apply

export LANG=en_US.UTF-8
export PATH="/usr/local/sbin:~/.composer/vendor/bin/:$PATH"
alias flushdns="sudo killall -HUP mDNSResponder"

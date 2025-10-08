autoload -Uz compinit
compinit

export PS1='%F{blue}%~ %(?.%F{green}.%F{red})❯%f '

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export BUN_INSTALL="$HOME/.local"
export ORAS_CACHE="$HOME/.cache/oras"
export HOMEBREW_NO_INSTALLED_DEPENDENTS_CHECK=1
export HOMEBREW_NO_ENV_HINTS=1
export GOPATH="$HOME/.go"
export EDITOR="hx"
export PATH="$HOME/.orbstack/bin:/opt/homebrew/bin:/opt/homebrew/sbin:/opt/homebrew/opt/ruby/bin:/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin:$HOME/.local/bin:$HOME/.composer/vendor/bin:$GOPATH/bin:$PATH"

#export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense' # optional
#zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
#source <(carapace _carapace)

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

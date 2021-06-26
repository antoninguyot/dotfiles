source /usr/local/share/zsh-snap/znap.zsh

PS1=$'%F{c}[%2~]%(?,%F{g},%F{r})$%f '
znap prompt

znap source zsh-users/zsh-syntax-highlighting

znap eval trapd00r/LS_COLORS 'dircolors -b LS_COLORS'
znap source marlonrichert/zcolors
znap eval zcolors "zcolors ${(q)LS_COLORS}"

znap source zsh-users/zsh-completions
znap source marlonrichert/zsh-autocomplete

path+=(
   "/usr/local/sbin:~/.composer/vendor/bin/"
)

alias ls="exa"
alias ll="exa -l"
alias diga="dig -t A +short"

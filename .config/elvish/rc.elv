use github.com/zzamboni/elvish-modules/bang-bang
use github.com/zzamboni/elvish-modules/alias

set-env GOPATH $E:HOME/.go
set-env SSH_AUTH_SOCK $E:HOME/Library/Containers/com.maxgoedjen.Secretive.SecretAgent/Data/socket.ssh
set-env JAVA_HOME /opt/homebrew/Cellar/openjdk@11/11.0.20/libexec/openjdk.jdk/Contents/Home

set paths = [/opt/homebrew/bin
/opt/homebrew/sbin
/usr/local/bin
~/.bun/bin/
~/.composer/vendor/bin 
~/.local/bin
~/Library/Python/3.8/bin 
$E:GOPATH/bin
/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin
/usr/sbin
/usr/bin
/sbin
/bin
/Users/antonin/Library/Python/2.7/bin
/opt/homebrew/opt/ruby/bin
$@paths]

# eval (starship init elvish)
eval (slurp < ~/.config/elvish/starship.elv)
eval (carapace _carapace|slurp)

# clear scrollback when clearing the screen
fn clear {
  e:clear
  printf "\e[3J"
}

fn mkcd {
  |dir|
  mkdir $dir
  cd $dir
}

alias:new k kubectl
alias:new kaf kubectl apply -f
alias:new ip dig +short myip.opendns.com @resolver1.opendns.com
alias:new ctx kubectx
alias:new ll exa -lagh
alias:new l exa -lagh
alias:new tree exa -lagh --tree

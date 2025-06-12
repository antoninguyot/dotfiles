# Use sane XDG defaults instead of crappy macOS Library
set-env XDG_CONFIG_HOME $E:HOME/.config
set-env XDG_DATA_HOME $E:HOME/.local/share
set-env XDG_CACHE_HOME $E:HOME/.cache
set-env BUN_INSTALL $E:HOME/.local

set-env GOPATH $E:HOME/.go
set-env SSH_AUTH_SOCK $E:HOME/Library/Containers/com.maxgoedjen.Secretive.SecretAgent/Data/socket.ssh
set-env JAVA_HOME /opt/homebrew/Cellar/openjdk@11/11.0.20/libexec/openjdk.jdk/Contents/Home
set-env KUBECONFIG (ls -1 ~/.kube/configs/*.yaml | tr '\n' ':')
set-env HOMEBREW_NO_ENV_HINTS 1
set-env HOMEBREW_NO_INSTALLED_DEPENDENTS_CHECK 1
# Use elvish for subprocesses spawned by any elvish term
set-env SHELL /opt/homebrew/bin/elvish
# Use helix as the default editor
set-env EDITOR hx
# Configure Oras cache
set-env ORAS_CACHE $E:HOME/.oras/cache
# Set the $PATH env variable
set paths = [
  $E:HOME/.orbstack/bin
  /opt/homebrew/bin
  /opt/homebrew/sbin
  /opt/homebrew/opt/ruby/bin
  /opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin
  /usr/local/bin
  $E:HOME/.local/bin
  $E:HOME/.config/composer/vendor/bin 
  $E:GOPATH/bin
  $@paths
]

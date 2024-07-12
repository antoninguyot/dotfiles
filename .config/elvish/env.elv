#!/opt/homebrew/bin/elvish

set-env GOPATH $E:HOME/.go
set-env SSH_AUTH_SOCK $E:HOME/Library/Containers/com.maxgoedjen.Secretive.SecretAgent/Data/socket.ssh
set-env JAVA_HOME /opt/homebrew/Cellar/openjdk@11/11.0.20/libexec/openjdk.jdk/Contents/Home
set-env KUBECONFIG (find ~/.kube -type f -name "*.yaml" -o -name "config" | tr '\n' ':')

set-env HOMEBREW_NO_ENV_HINTS 1
set-env HOMEBREW_NO_INSTALLED_DEPENDENTS_CHECK 1

set paths = [
  /opt/homebrew/bin
  /opt/homebrew/sbin
  /opt/homebrew/opt/ruby/bin
  /opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin
  /usr/local/bin
  $E:HOME/.bun/bin
  $E:HOME/.composer/vendor/bin 
  $E:GOPATH/bin
  $@paths
]

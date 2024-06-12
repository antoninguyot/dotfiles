use path
use github.com/zzamboni/elvish-modules/bang-bang
use github.com/zzamboni/elvish-modules/terminal-title

set-env GOPATH $E:HOME/.go
set-env SSH_AUTH_SOCK $E:HOME/Library/Containers/com.maxgoedjen.Secretive.SecretAgent/Data/socket.ssh
set-env JAVA_HOME /opt/homebrew/Cellar/openjdk@11/11.0.20/libexec/openjdk.jdk/Contents/Home
set-env KUBECONFIG (find ~/.kube -type f -name "*.yaml" -o -name "config" | tr '\n' ':')
set-env HOMEBREW_NO_AUTO_UPDATE 1

set-env STARSHIP_LOG "trace starship timings"

# Use elvish for subprocesses spawned by any elvish term
set-env SHELL /opt/homebrew/bin/elvish

set paths = [
  /opt/homebrew/bin
  /opt/homebrew/sbin
  /opt/homebrew/opt/ruby/bin
  /opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin
  /usr/local/bin
  $E:HOME/.bun/bin/
  $E:HOME/.composer/vendor/bin 
  $E:GOPATH/bin
  $@paths
]

each {|p|
  if (not (path:is-dir &follow-symlink $p)) {
    echo (styled "Warning: directory "$p" in $paths no longer exists." red)
  }
} $paths

eval (starship init elvish)
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

fn ll {
  |@args|
  eza -lagh $@args
}

fn tree {
  |@args|
  eza -lagh --tree $@args
}

fn hla {
  |@args|
  helm ls -A
}

fn s_client {
  |hostname|
  openssl s_client -connect (printf "%s:443" $hostname) -servername $hostname
}

fn gitdiff {
  git diff --name-only --relative --diff-filter=d | xargs bat --diff
}

fn editor {
  |dir|
  cd $dir
  zellij action new-tab -l ~/.config/zellij/editor_layout.kdl
}

set edit:command-abbr['k'] = 'kubectl'
set edit:command-abbr['h'] = 'helm'
set edit:command-abbr['kaf'] = 'kubectl apply -f'
set edit:command-abbr['ga'] = 'git add'
set edit:command-abbr['gc'] = 'git commit'
set edit:command-abbr['gph'] = 'git push'
set edit:command-abbr['gpl'] = 'git pull'
set edit:command-abbr['kubectx'] = 'kubectl config use-context'
set edit:command-abbr['ctx'] = 'kubectl config use-context'

set edit:insert:binding[Alt-B] = { edit:move-dot-left-word }
set edit:insert:binding[Alt-F] = { edit:move-dot-right-word }
set edit:insert:binding[Alt-Backspace] = { edit:kill-word-left }

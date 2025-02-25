use path
use env

if (==s (get-env TERM) "xterm-ghostty") {
  use ghostty-integration
}

if (has-env ZELLIJ) {
    zellij action rename-tab (tilde-abbr $pwd)
  set after-chdir = [{
    |dir|
    zellij action rename-tab (tilde-abbr $pwd)
  }]
}

each {|p|
  if (not (path:is-dir &follow-symlink $p)) {
    echo (styled "Warning: directory "$p" in $paths no longer exists." red)
  }
} $paths

eval (carapace _carapace|slurp)

# Prompt

set edit:prompt = { styled (tilde-abbr $pwd) blue; styled ' ❯ ' green }
set edit:rprompt = { echo "" }

# Abbrevations (aliases)

set edit:command-abbr['k'] = 'kubectl'
set edit:command-abbr['h'] = 'helm'
set edit:command-abbr['kaf'] = 'kubectl apply -f'
set edit:command-abbr['g'] = 'git'
set edit:command-abbr['ga'] = 'git add'
set edit:command-abbr['gc'] = 'git commit'
set edit:command-abbr['gco'] = 'git checkout'
set edit:command-abbr['gph'] = 'git push'
set edit:command-abbr['gpl'] = 'git pull'
set edit:command-abbr['ctx'] = 'kubectx'

# Keybindings

set edit:insert:binding[Alt-B] = { edit:move-dot-left-word }
set edit:insert:binding[Alt-F] = { edit:move-dot-right-word }
set edit:insert:binding[Alt-Backspace] = { edit:kill-word-left }
set edit:insert:binding[Shift-Up] = { edit:lastcmd:start }
set edit:lastcmd:binding[Shift-Up] = { edit:listing:accept }


# Various helpers

fn clear {
  e:clear
  # clear scrollback when clearing the screen
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
  helm ls -A
}

fn s_client {
  |hostname &port=443|
  openssl s_client -connect (printf "%s:%s" $hostname $port) -servername $hostname
}

fn git-diff {
  git diff --name-only --relative --diff-filter=d | xargs bat --diff
}

fn git-back {
  git switch (path:base (git symbolic-ref refs/remotes/origin/HEAD))
  git pull
}

fn kubectx {
  |@args|
  if (== (count $args) 0) {
    kubectl config get-contexts
  } else {
    kubectl config use-context $@args
  }
}


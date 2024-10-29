use path
use env
use github.com/zzamboni/elvish-modules/bang-bang
use github.com/zzamboni/elvish-modules/terminal-title

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
  helm ls -A
}

fn rm {
  |@args|
  trash $@args  
}

fn s_client {
  |hostname|
  openssl s_client -connect (printf "%s:443" $hostname) -servername $hostname
}

fn gitdiff {
  git diff --name-only --relative --diff-filter=d | xargs bat --diff
}

set edit:command-abbr['k'] = 'kubectl'
set edit:command-abbr['h'] = 'helm'
set edit:command-abbr['kaf'] = 'kubectl apply -f'
set edit:command-abbr['ga'] = 'git add'
set edit:command-abbr['gc'] = 'git commit'
set edit:command-abbr['gco'] = 'git checkout'
set edit:command-abbr['gph'] = 'git push'
set edit:command-abbr['gpl'] = 'git pull'
set edit:command-abbr['kubectx'] = 'kubectl config use-context'
set edit:command-abbr['ctx'] = 'kubectl config use-context'

set edit:insert:binding[Alt-B] = { edit:move-dot-left-word }
set edit:insert:binding[Alt-F] = { edit:move-dot-right-word }
set edit:insert:binding[Alt-Backspace] = { edit:kill-word-left }
set edit:insert:binding[Shift-Up] = { edit:lastcmd:start }
set edit:lastcmd:binding[Shift-Up] = { edit:listing:accept }

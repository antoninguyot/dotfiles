#!/opt/homebrew/bin/elvish

# This script is intended to export the generated elvish env to a POSIX-compliant environment that should be evaled.
# This allows to preserve compliance with applications reliant on POSIX shells while not having to maintain separate paths. 

use env
use str

for env [(printenv)] {
  var key value = (str:split '=' $env)
  echo "export "$key="\""$value"\""
}

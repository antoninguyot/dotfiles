#!/opt/homebrew/bin/elvish

# This script is intended to export the generated elvish path (from .config/elvish/rc.elv) to a POSIX-compliant path that should be evaled.
# This allows to preserve compliance with applications reliant on POSIX shells while not having to maintain separate paths. 

echo "export PATH=\""$E:PATH"\""

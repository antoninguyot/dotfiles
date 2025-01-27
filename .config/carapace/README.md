# carapace config

## specs

Specs are used to override completions for single commands. They have to be named using the command name.

For instance, if you configure a shell alias for a command, a spec file can provide completions for the original command (see kubectx).

## bridges

Bridges allow carapace to fetch completions from another completion engine. The only configured engine is bash, since it's MUCH faster than zsh to load and provide completions.

To configure a bash bridge, source the correct completion script from carapace's own .bashrc found in the bridge folder, then copy a spec such as yadm to tell carapace it should use bash completions.

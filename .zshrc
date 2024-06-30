# Use asdf shims
. /usr/local/opt/asdf/libexec/asdf.sh

# Homebrew shell completion
# https://docs.brew.sh/Shell-Completion
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

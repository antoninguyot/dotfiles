MAKEFILE_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
CURRENT_PATH := $(notdir $(patsubst %/,%,$(dir $(MAKEFILE_PATH))))

all: symlink brew

symlink:
	@echo "Creating symbolic links"
	test -f ~/.zshrc || ln -s "$(CURRENT_PATH)/.zshrc" ~
	test -f ~/.vimrc || ln -s "$(CURRENT_PATH)/.vimrc" ~

brew:
	@echo "Installing packages..."
	cd "$(CURRENT_PATH)"
	brew bundle install
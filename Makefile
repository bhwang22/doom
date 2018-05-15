## Version: $Id$
##
######################################################################
##
### Commentary:
##
######################################################################
##
### Change Log:
##
######################################################################
##
### Code:

all: tree themes snippets

tree:
	@mkdir -p ~/.doom.d/+snippets
	@mkdir -p ~/.doom.d/+snippets/c-mode
	@mkdir -p ~/.doom.d/+snippets/cmake-mode
	@mkdir -p ~/.doom.d/+themes

themes:
	@ln -s -f ~/.doom.d/+theme\|doom-opera.el       ~/.doom.d/+themes/doom-opera-theme.el
	@ln -s -f ~/.doom.d/+theme\|doom-opera-light.el ~/.doom.d/+themes/doom-opera-light-theme.el

snippets:
	@ln -s -f ~/.doom.d/+snippets\|c\|once    ~/.doom.d/+snippets/c-mode/once
	@ln -s -f ~/.doom.d/+snippets\|cmake\|src ~/.doom.d/+snippets/cmake-mode/src

clean:
	@rm -rf ~/.doom.d/+snippets
	@rm -rf ~/.doom.d/+themes

######################################################################
### Makefile ends here

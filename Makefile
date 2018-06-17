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

all: tree snippets

tree:
	@mkdir -p ~/.doom.d/snippets
	@mkdir -p ~/.doom.d/snippets/c-mode
	@mkdir -p ~/.doom.d/snippets/cmake-mode

snippets:
	@ln -s -f ~/.doom.d/+snippets\|c\|once    ~/.doom.d/+snippets/c-mode/once
	@ln -s -f ~/.doom.d/+snippets\|cmake\|src ~/.doom.d/+snippets/cmake-mode/src

clean:
	@rm -rf ~/.doom.d/+snippets

######################################################################
### Makefile ends here

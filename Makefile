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

all: structure symlinks

structure:
	@mkdir -p ~/.doom.d/+themes

symlinks:
	@ln -s -f ~/.doom.d/+theme\|doom-opera.el ~/.doom.d/+themes/doom-opera-theme.el

clean:
	@rm -rf ~/.doom.d/+themes

######################################################################
### Makefile ends here

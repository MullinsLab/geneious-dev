GENEIOUS_HOME := $(HOME)/.geneious
export GENEIOUS_HOME

prefix  := /usr/local
bin     := $(prefix)/bin

scripts := bin/geneious-dev

install: install-dev-kit install-scripts

install-dev-kit: $(GENEIOUS_HOME)

$(GENEIOUS_HOME):
	@echo "# Installing dev kit"
	./bin/install-dev-kit

install-scripts:
	@echo "# Installing geneious-dev"
	@install -dv $(bin)
	@install -cv $(scripts) $(bin)

uninstall:
	@rm -v $(patsubst bin/%, $(bin)/%, $(scripts)) \
		| perl -pe 'print "rm: "'
	@echo "# $(GENEIOUS_HOME) not removed."

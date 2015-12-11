# Makefile
#
# This file is part of the bitpattern, a LaTeX package to typeset bit
# pattern diagrams.
# https://bitbucket.org/bourguet/bitpattern
#
# Copyright 2015 Jean-Marc Bourguet
#
# This program is provided under the terms of the LaTeX Project Public
# License distributed from CTAN archives in directory
# macros/latex/base/lppl.txt.

pdf: bitpattern.sty
	echo "\AtBeginDocument{\OnlyDescription}" > ltxdoc.cfg
	pdflatex bitpattern.dtx

pdf-sources:
	-rm ltxdoc.cfg
	pdflatex bitpattern.dtx

sty: bitpattern.sty

ctan: pdf
	mkdir bitpattern
	cp README.md bitpattern
	cp bitpattern.dtx bitpattern
	cp bitpattern.pdf bitpattern
	cp bitpattern.ins bitpattern
	tar czf bitpattern.tgz bitpattern
	rm -fr bitpattern

bitpattern.sty: bitpattern.dtx bitpattern.ins
	-rm bitpattern.sty
	latex bitpattern.ins

clean:
	-rm *.pdf
	-rm *~
	-rm -fr bitpattern
	-rm *.aux
	-rm *.log

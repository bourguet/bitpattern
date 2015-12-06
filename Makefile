pdf: bitpattern.sty
	echo "\AtBeginDocument{\OnlyDescription}" > ltxdoc.cfg
	pdflatex bitpattern.dtx

pdf-sources:
	-rm ltxdoc.cfg
	pdflatex bitpattern.dtx

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

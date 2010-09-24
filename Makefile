file=bd1
file2=mer

make:
	latex $(file).tex
	latex $(file).tex
	dvips $(file).dvi -o
	ps2pdf13 $(file).ps
mer:
	pdflatex  $(file2).tex
show:
	xpdf $(file).pdf
clean:
	rm *.dvi *.aux *.out *.log

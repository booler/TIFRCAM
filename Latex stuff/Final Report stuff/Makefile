# ~/Documents/SEM4-2/PROJECT/Report/Makefile

report : report.tex
	pdflatex report
	bibtex report
	pdflatex report
	pdflatex report

	rm -rf *.log *.out *.aux *.toc .DS_Store *.bbl *.blg

.PHONY : report clean

clean :
	rm -rf *.log *.out *.aux *.toc .DS_Store *.bbl *.blg
	rm -rf *.pdf

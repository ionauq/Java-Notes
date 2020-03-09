all: pdf mvpdf

clean:
	find . -type f -name "*.aux" -or -name "*.pdf" -or -name "*.log" -or -name "*.out" -or -name "*.toc" -or -name "*.gz" -or -name "*.bbl" -or -name "*.blg" | xargs rm -rf
	
pdf: *.tex
	xelatex --shell-escape main.tex 
mvpdf:
	mv ./main.pdf ../Java-Notes.pdf	


.PHONY: all pdf mvpdf clean


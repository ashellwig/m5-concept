RM=rm -rf
LATEXMK=latexmk -pdf -pdflatex="pdflatex -interaction=nonstopmode" -use-make
MAKE4HT=make4ht \
		main.tex \
		",charset=utf-8" "-cunihtf -utf8" \
		"" \
		"-interaction=nonstopmode"
BIB_FILE=main

# Build Commands
.PHONY: Main.pdf Main.html clean
all: Main.pdf Main.html viewpdf viewhtml clean
clean-all: clean all-clean
pdf: Main.pdf clean
html: Main.html

# Building
Main.pdf: main.tex
	$(LATEXMK) $<
	biber $(BIB_FILE)
	$(LATEXMK) $<
	$(LATEXMK) $<

Main.html: main.tex
	$(MAKE4HT)
	biber $(BIB_FILE)
	$(MAKE4HT)
	$(MAKE4HT)

# Viewing
viewpdf: Main.pdf
	/usr/bin/google-chrome-stable ./main.pdf

viewhtml: Main.html
	/usr/bin/google-chrome-stable ./main.html

# Cleaning
clean:
	$(RM) *.4tc
	$(RM) *.4ct
	$(RM) *.tmp
	$(RM) *.xref
	$(RM) *.idv
	$(RM) *.lg
	$(RM) *.lol
	$(RM) *.out.ps
	$(RM) *.bbl
	$(RM) *.bib.bbl
	$(RM) *.bib.blg
	$(RM) *.blg
	$(RM) *.aux
	$(RM) *.bcf
	$(RM) *.run.xml
	$(RM) *.toc
	$(RM) *.log
	$(RM) *.out
	$(RM) *.sample
	$(RM) *.fls
	$(RM) *.fdb_latexmk
	$(RM) *.synctex.gz



all-clean: clean
	latexmk -CA
	$(RM) *.pdf
	$(RM) *.html
	$(RM) *.css
	
# FILENAME = $(USER)_thesis
FILENAME = user_thesis
date=$(shell date +%Y-%m-%d)
output_file = draft_$(date).pdf

# LATEX=pdflatex
# LATEX=xelatex
LATEX=lualatex
BIBTEX = bibtex
# BIBTEX = biber

default: run_latexmk
	make copy_draft

run_latexmk:
	clear
	latexmk -pdf $(FILENAME)

%.pdf: %.tex *.tex *.bib
	$(LATEX) $<
	-$(BIBTEX)  $(basename $<)
	$(LATEX) $<
	$(LATEX) $<

copy_draft:
	rsync $(FILENAME).pdf $(output_file)

clean:
	\rm -f *.aux *.bbl *.blg *.dvi *.idx *.lof *.log *.lot *.toc \
		*.glg *.gls *.glo *.xdy *.nav *.out *.snm *.vrb *.mp \
		*.synctex.gz *.brf *.fls *.fdb_latexmk

realclean: clean
	\rm -f *.pdf

final:
	if [ -f *.aux ]; \
		then make clean; \
	fi
	latexmk -pdf $(FILENAME)
	make clean

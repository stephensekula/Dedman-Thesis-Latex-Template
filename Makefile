# file = $(USER)_thesis
file = user_thesis
driver = $(file).tex
date=$(shell date +%Y-%m-%d)
output_file = draft_$(date).pdf
tex_source = $(wildcard *.tex) $(wildcard src/*.tex)
image_source = $(wildcard images/figures/*.pdf) $(wildcard images/figures/*.jpg) $(wildcard images/figures/*.png)
bib_source = $(wildcard *.bib) $(wildcard bib/*.bib)
REFERENCES = true
#REFERENCES = false
LATEX=xelatex

all: document

text: $(driver) $(tex_source) $(image_source)
	$(LATEX) $(driver)
	$(LATEX) $(driver)

document: $(driver) $(tex_source) $(image_source) $(bib_source)
	make text
	if [ "$(REFERENCES)" = true ]; then \
		bibtex $(basename $(driver)); \
		$(LATEX) $(driver); \
		$(LATEX) $(driver); \
	fi
	cp $(basename $(driver)).pdf $(output_file)

clean:
	\rm -f *.aux *.bbl *.blg *.dvi *.idx *.lof *.log *.lot *.toc *.glg *.gls *.glo *.xdy *.nav *.out *.snm *.vrb *.mp *.synctex.gz *.brf

realclean: clean
	\rm -f *.pdf

final:
	if [ -f *.aux ]; \
		then make clean; \
	fi
	make document
	make clean

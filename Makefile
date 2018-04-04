# FILENAME = $(USER)_thesis
FILENAME = user_thesis

date = $(shell date +%Y-%m-%d)
output_file = draft_$(date).pdf

figure_src = $(wildcard images/figures/*.tex images/figures/*/*.tex)
figure_list = $(figure_src:.tex=.pdf)

# LATEX = pdflatex
# LATEX = xelatex
LATEX = lualatex

BIBTEX = bibtex
# BIBTEX = biber

default: document
	make copy_draft

figures: $(figure_list)

# Target assumes figure source is in same directory as expected figure path
images/%.pdf: images/%.tex
	latexmk -$(LATEX) -interaction=nonstopmode -halt-on-error $(basename $@)
	mv $(notdir $(basename $@)).pdf $(basename $@).pdf
	rm $(notdir $(basename $@)).*

text:
	latexmk -$(LATEX) -logfilewarnings -halt-on-error $(FILENAME)

document:
	clear
	make figures
	make text

copy_draft:
	rsync $(FILENAME).pdf $(output_file)

clean:
	\rm -f *.aux *.bbl *.blg *.dvi *.idx *.lof *.log *.lot *.toc \
		*.glg *.gls *.glo *.xdy *.nav *.out *.snm *.vrb *.mp \
		*.synctex.gz *.brf *.fls *.fdb_latexmk

clean_figures:
	rm -f $(figure_list)

realclean: clean
	\rm -f *.ps *.pdf
	make clean_figures

final:
	if [ -f *.aux ]; \
		then make clean; \
	fi
	make figures
	make text
	make clean

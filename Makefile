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

default: document copy_draft

all: abstract default

abstract: abstract.pdf

abstract.pdf: latex/standalone_abstract.tex
	latexmk -$(LATEX) -logfilewarnings -halt-on-error $<
	mv standalone_abstract.pdf abstract.pdf
	rm standalone_abstract.*

figures: $(figure_list)

# Target assumes figure source is in same directory as expected figure path
images/%.pdf: images/%.tex
	latexmk -$(LATEX) -interaction=nonstopmode -halt-on-error $(basename $@)
	mv $(notdir $(basename $@)).pdf $(basename $@).pdf
	rm $(notdir $(basename $@)).*

text:
	latexmk -$(LATEX) -logfilewarnings -halt-on-error $(FILENAME)

document: clear_screen figures text

copy_draft:
	rsync $(FILENAME).pdf $(output_file)

clear_screen:
	clear

clean:
	rm -f *.aux *.bbl *.blg *.dvi *.idx *.lof *.log *.lot *.toc \
		*.glg *.gls *.glo *.xdy *.nav *.out *.snm *.vrb *.mp \
		*.synctex.gz *.brf *.fls *.fdb_latexmk

clean_figures:
	rm -f $(figure_list)

realclean: clean clean_figures
	rm -f *.ps *.pdf

final:
	if [ -f *.aux ]; then \
		$(MAKE) clean; \
	fi
	$(MAKE) figures
	$(MAKE) abstract
	$(MAKE) text
	$(MAKE) clean

arXiv: realclean document
	mkdir submit_to_arXiv
	cp *.tex submit_to_arXiv
	cp *.aux submit_to_arXiv/ms.aux
	cp *.bbl submit_to_arXiv/ms.bbl
	cp Makefile submit_to_arXiv
	cp -r src latex bib images submit_to_arXiv
	if [ -d Dedman-Thesis-Latex-Template ]; then \
		cp -r Dedman-Thesis-Latex-Template submit_to_arXiv; \
	elif [ -d sty ]; then # If testing in the template \
		cp -r sty submit_to_arXiv; \
	fi
	mv submit_to_arXiv/*_thesis.tex submit_to_arXiv/ms.tex
	# Change the FILENAME to be ms ignoreing commented lines
	sed -i '/^ *#/d;s/#.*//;0,/FILENAME/s/.*/FILENAME = ms/' submit_to_arXiv/Makefile
	if [ -d Dedman-Thesis-Latex-Template ]; then \
		sed -i '/hyperref/,+d' submit_to_arXiv/Dedman-Thesis-Latex-Template/latex/packages.tex; # Remove hyperref for arXiv \
		sed -i '/hyperref/,+d' submit_to_arXiv/Dedman-Thesis-Latex-Template/latex/custom_commands.tex; # Remove hyperref for arXiv \
	elif [ -d sty ]; then \
		sed -i '/hyperref/,+d' submit_to_arXiv/latex/packages.tex; # Remove hyperref for arXiv \
		sed -i '/hyperref/,+d' submit_to_arXiv/latex/custom_commands.tex; # Remove hyperref for arXiv \
	fi
	tar -zcvf submit_to_arXiv.tar.gz submit_to_arXiv/
	rm -rf submit_to_arXiv
	$(MAKE) realclean

clean_arXiv:
	rm submit_to_arXiv.tar.gz

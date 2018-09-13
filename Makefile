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
	cp *.bbl submit_to_arXiv/ms.bbl
	cp Makefile submit_to_arXiv
	cp -r src latex bib images submit_to_arXiv
	if [ -d Dedman-Thesis-Latex-Template ]; then \
		mkdir submit_to_arXiv/Dedman-Thesis-Latex-Template; \
		cp Dedman-Thesis-Latex-Template/LICENSE submit_to_arXiv/Dedman-Thesis-Latex-Template/LICENSE; \
		cp -r Dedman-Thesis-Latex-Template/sty submit_to_arXiv/Dedman-Thesis-Latex-Template/sty; \
		cp -r Dedman-Thesis-Latex-Template/latex submit_to_arXiv/Dedman-Thesis-Latex-Template/latex; \
		rm submit_to_arXiv/Dedman-Thesis-Latex-Template/latex/user_commands.tex; \
		rm submit_to_arXiv/Dedman-Thesis-Latex-Template/latex/metadata.tex; \
		rm submit_to_arXiv/Dedman-Thesis-Latex-Template/latex/standalone_abstract.tex; \
	elif [ -d sty ]; then \
		cp -r sty submit_to_arXiv; \
	fi
	mv submit_to_arXiv/*_thesis.tex submit_to_arXiv/ms.tex
	# Change the FILENAME to ms while ignoring commented lines
	# Remove hyperref for arXiv
	if [ -d Dedman-Thesis-Latex-Template ]; then \
		sed -i '/hyperref/,+d' submit_to_arXiv/Dedman-Thesis-Latex-Template/latex/packages.tex; \
		sed -i '/hyperref/,+d' submit_to_arXiv/Dedman-Thesis-Latex-Template/latex/custom_commands.tex; \
	elif [ -d sty ]; then \
		sed -i '/hyperref/,+d' submit_to_arXiv/latex/packages.tex; \
		sed -i '/hyperref/,+d' submit_to_arXiv/latex/custom_commands.tex; \
	fi
	# Having .tex and .pdf files of the same name will cause arXiv to delete the .pdf
	find submit_to_arXiv/images/ -name "*.tex" -type f -delete
	# arXiv requires .bib files to be compiled to .bbl files and will remove any .bib files
	find submit_to_arXiv/ -name "*.bib" -type f -delete
	tar -zcvf submit_to_arXiv.tar.gz submit_to_arXiv/
	rm -rf submit_to_arXiv
	$(MAKE) realclean

clean_arXiv:
	if [ -f submit_to_arXiv.tar.gz ]; then \
		rm submit_to_arXiv.tar.gz; \
	fi

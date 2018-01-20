# Dedman College Thesis Latex Template

Fork of the [SMU Dedman College Ph.D. Thesis LaTeX template](https://www.smu.edu/graduate/CurrentStudents/Graduation/DissThesisGuide)

[![License](https://img.shields.io/badge/License-BSD%203--Clause-blue.svg)](https://opensource.org/licenses/BSD-3-Clause)

## Use

The template should compile out of the box. You'll want to rename a few things and organize them as you see fit.

- `user_thesis.tex`: Rename to the output of `$USER` or your last name and replace contents as needed
- `Makefile`: Change `user_thesis` to the name of whatever you renamed `user_thesis.tex` to
- `bib/example.bib`: Rename to a descriptive name of the contents of the BibTeX file
   - **Suggestion:** Have multiple BibTeX files that correspond to different topics
- `latex/FrontPages.tex`: Go through here and change all relevant data
- `latex/abstract.tex`: Replace with your abstract
- `latex/acknowledgements.tex`: Replace with your acknowledgements
- `src/appendix_A.tex`: Rename to a descriptive name of the contents of the file

## Compilation

### Linux

```bash
make [text,document,final,clean,realclean]
```

### MacOS

```bash
make [text,document,final,clean,realclean]
```

### Windows

TBA

### Docker

A Docker image with TexLive 2017 in it exists: [LaTeX-Docker](https://hub.docker.com/r/matthewfeickert/latex-docker/)


## Authors:

 - Maintainer (of fork): [Matthew Feickert](http://www.matthewfeickert.com/)

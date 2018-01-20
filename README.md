# Dedman College Thesis Latex Template

Fork of the [SMU Dedman College Ph.D. Thesis LaTeX template](https://www.smu.edu/graduate/CurrentStudents/Graduation/DissThesisGuide)

[![License](https://img.shields.io/badge/License-BSD%203--Clause-blue.svg)](https://opensource.org/licenses/BSD-3-Clause)

## Use

This is a template for how your thesis files and directory structure might look. This is **not** an area for you to actually build your thesis. As this is a version controlled repository changes to the template files _will_ occur, and will overwrite any files of the same name.

> Note: There is probably some smarter way to incorporate changes directly into a thesis repo using Git submodules or using selective `git cherry-pick`. However, the maintainer hasn't spent time figuring that out yet.

When you `git clone` this repository you should first copy the contents of this directory into the directory (please, for your own sake make that directory be a Git repo) that you're going to actually write your thesis in.

```bash
cp -r Dedman-Thesis-Latex-Template/* my_thesis_repo/
```

You'll want to rename a few things and organize them as you see fit.

- `user_thesis.tex`: Rename to the output of `$USER` or your last name and replace contents as needed
- `Makefile`: Change `user_thesis` to the name of whatever you renamed `user_thesis.tex` to
- `bib/example.bib`: Rename to a descriptive name of the contents of the BibTeX file
   - **Suggestion:** Have multiple BibTeX files that correspond to different topics
- `latex/FrontPages.tex`: Go through here and change all relevant data
- `latex/abstract.tex`: Replace with your abstract
- `latex/acknowledgements.tex`: Replace with your acknowledgements
- `src/appendix_A.tex`: Rename to a descriptive name of the contents of the file

## Compilation

The template should compile out of the box. For Unix like operating systems a template `Makefile` is provided.

### Linux

```bash
make [text,document,final,clean,realclean]
```

### MacOS

```bash
make [text,document,final,clean,realclean]
```

### Windows

As [Make is GNU software](https://www.gnu.org/software/make/) it is not limited to Unix like operating systems. You might consider looking into [Microsoft's `NMAKE`](https://msdn.microsoft.com/en-us/library/dd9y37ha.aspx), which should allow you to use the provided `Makefile` template with very slight changes.

### Docker

A Docker image with TexLive 2017 in it exists: [LaTeX-Docker](https://hub.docker.com/r/matthewfeickert/latex-docker/)


## Authors:

 - Maintainer (of fork): [Matthew Feickert](http://www.matthewfeickert.com/)

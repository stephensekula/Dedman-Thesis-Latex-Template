# Dedman College Thesis Latex Template

Fork of the [SMU Dedman College Ph.D. Thesis LaTeX template](https://www.smu.edu/graduate/CurrentStudents/Graduation/DissThesisGuide)

[![License](https://img.shields.io/badge/License-BSD%203--Clause-blue.svg)](https://opensource.org/licenses/BSD-3-Clause)

[![CircleCI](https://circleci.com/gh/matthewfeickert/Dedman-Thesis-Latex-Template/tree/master.svg?style=svg)](https://circleci.com/gh/matthewfeickert/Dedman-Thesis-Latex-Template/tree/master)
A pdf copy of the latest build of the template is [available here](https://www.physics.smu.edu/mfeickert/dedman-thesis-latex-template/template.pdf)

## Use

This is a template for how your thesis files and directory structure might look. This is **not** an area for you to actually build your thesis, but rather should be used as a Git submodule of the Git repository that contains your thesis.

### Setup

To use the template, add the template as a Git submodule after you've setup your thesis Git repository.

```bash
git submodule add git@github.com:matthewfeickert/Dedman-Thesis-Latex-Template.git
```

> Note: The above assumes that you've [setup an `ssh` key with GitHub](https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/)

Then **from your thesis repository** run the installer

```bash
bash Dedman-Thesis-Latex-Template/update_template.sh install
```

You should now have the template setup in your thesis repository and it should compile.

After checking that it complies, you'll want to rename a few things and organize them as you see fit.

- `user_thesis.tex`: Rename to the output of `$USER` or your last name and replace contents as needed
- `Makefile`: Change `user_thesis` to the name of whatever you renamed `user_thesis.tex` to
- `bib/example.bib`: Rename to a descriptive name of the contents of the BibTeX file
   - **Suggestion:** Have multiple BibTeX files that correspond to different topics
- `latex/metadata.tex`: Go through here and change all relevant data
- `src/user_config.tex`: Replace with all of your personal data
- `src/abstract.tex`: Replace with your abstract
- `src/acknowledgements.tex`: Replace with your acknowledgements
- `src/dedication.tex`: Replace with your thesis dedication
- `src/appendix_A.tex`: Rename to a descriptive name of the contents of the file

Now that you've added the submodule remember to commit the generated `.gitmodules` file and the submodule.

### Update

To update the submodule with the remote (updating your base LaTeX files) run the updater.

```bash
bash Dedman-Thesis-Latex-Template/update_template.sh
```

## Compilation

The template should compile "out of the box". For Unix like operating systems a template [`Makefile`](https://github.com/matthewfeickert/Dedman-Thesis-Latex-Template/blob/master/Makefile) is provided.

### Linux

```bash
make [abstract, figures, text, document, all, final, clean, clean_figures, realclean]
```

### MacOS

```bash
make [abstract, figures, text, document, all, final, clean, clean_figures, realclean]
```

### Windows

As [Make is GNU software](https://www.gnu.org/software/make/) it is not limited to Unix like operating systems. You might consider looking into [Microsoft's `NMAKE`](https://msdn.microsoft.com/en-us/library/dd9y37ha.aspx), which should allow you to use the provided `Makefile` template with very slight changes.

### Docker

A Docker image with Tex Live 2017 in it exists: [LaTeX-Docker](https://hub.docker.com/r/matthewfeickert/latex-docker/)


## Authors

 - Maintainer (of fork): [Matthew Feickert](http://www.matthewfeickert.com/)

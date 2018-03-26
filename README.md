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

Then **from your thesis repository** run the installer

```bash
bash Dedman-Thesis-Latex-Template/update_template.sh install
```

> Note: The above assumes that you've setup an `ssh` key with GitHub

You should now have the template setup in your thesis repository and it should compile.

After checking that it complies, you'll want to rename a few things and organize them as you see fit.

- `user_thesis.tex`: Rename to the output of `$USER` or your last name and replace contents as needed
- `Makefile`: Change `user_thesis` to the name of whatever you renamed `user_thesis.tex` to
- `bib/example.bib`: Rename to a descriptive name of the contents of the BibTeX file
   - **Suggestion:** Have multiple BibTeX files that correspond to different topics
- `latex/FrontPages.tex`: Go through here and change all relevant data
- `latex/abstract.tex`: Replace with your abstract
- `latex/acknowledgements.tex`: Replace with your acknowledgements
- `src/appendix_A.tex`: Rename to a descriptive name of the contents of the file

> Note: There is probably some smarter way to incorporate changes directly into a thesis repo using Git submodules or using selective `git cherry-pick`. However, the maintainer hasn't spent time figuring that out yet.

Now that you've added the submodule remember to commit the generated `.gitmodules` file and the submodule.

### Update

To update the submodule with the remote and then update your base LaTeX files run the updater.

```bash
bash Dedman-Thesis-Latex-Template/update_template.sh
```

## Compilation

The template should compile out of the box. For Unix like operating systems a template `Makefile` is provided.

### Linux

```bash
make [run_latexmk,final,clean,realclean]
```

### MacOS

```bash
make [run_latexmk,final,clean,realclean]
```

### Windows

As [Make is GNU software](https://www.gnu.org/software/make/) it is not limited to Unix like operating systems. You might consider looking into [Microsoft's `NMAKE`](https://msdn.microsoft.com/en-us/library/dd9y37ha.aspx), which should allow you to use the provided `Makefile` template with very slight changes.

### Docker

A Docker image with Tex Live 2017 in it exists: [LaTeX-Docker](https://hub.docker.com/r/matthewfeickert/latex-docker/)


## Authors

 - Maintainer (of fork): [Matthew Feickert](http://www.matthewfeickert.com/)

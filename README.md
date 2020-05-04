# Dedman College Thesis Latex Template

Fork of the [SMU Dedman College Ph.D. Thesis LaTeX template](https://www.smu.edu/graduate/CurrentStudents/Graduation/DissThesisGuide)

[![GitHub Actions Status: CI](https://github.com/matthewfeickert/Dedman-Thesis-Latex-Template/workflows/CI/badge.svg)](https://github.com/matthewfeickert/Dedman-Thesis-Latex-Template/actions?query=workflow%3A"CI"+branch%3Amaster)
[![GitHub Actions Status: Publish Docs](https://github.com/matthewfeickert/Dedman-Thesis-Latex-Template/workflows/Publish%20docs/badge.svg)](https://github.com/matthewfeickert/Dedman-Thesis-Latex-Template/actions?query=workflow%3A"Publish+docs"+branch%3Amaster)
[![License](https://img.shields.io/badge/License-BSD%203--Clause-blue.svg)](https://opensource.org/licenses/BSD-3-Clause)

A pdf copy of the latest build of the template is available here:
[![download](https://img.shields.io/badge/download-template%20build-blue.svg)](https://matthewfeickert.github.io/Dedman-Thesis-Latex-Template/template/template.pdf)

## Graduation Deadlines and Checklist

If you're using this template then you are probably in the process of writing your Ph.D. thesis and applying to graduate. SMU's Dedman College of Humanities and Sciences has several mandatory checkpoint reviews of your thesis along the way between applying for graduation and submitting your final thesis. **Take note of these** and consult the [Graduation Deadlines and Checklist page](https://www.smu.edu/graduate/CurrentStudents/Graduation/GraduationTimeline) for the deadlines associated with your target graduation date.

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
make [abstract, figures, text, document, all, final, clean, clean_figures, clean_drafts, realclean]
```

### MacOS

```bash
make [abstract, figures, text, document, all, final, clean, clean_figures, clean_drafts, realclean]
```

### Windows

As [Make is GNU software](https://www.gnu.org/software/make/) it is not limited to Unix like operating systems. You might consider looking into [Microsoft's `NMAKE`](https://msdn.microsoft.com/en-us/library/dd9y37ha.aspx), which should allow you to use the provided `Makefile` template with very slight changes.

### Docker

A Docker image with the latest version of Tex Live in it exists: [LaTeX-Docker](https://hub.docker.com/r/matthewfeickert/latex-docker/)


## Authors

 - Maintainer (of fork): [Matthew Feickert](http://www.matthewfeickert.com/)

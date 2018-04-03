# Changelog

The history of the thesis template before it was moved into version control is outlined below, as extracted from commented out code. It is meant mainly for historical record and not for active use.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/) which adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [0.0.1](https://github.com/matthewfeickert/Dedman-Thesis-Latex-Template/releases/tag/v0.0.1) - 2018-04-03
- Release of tag `v0.0.1` on GitHub to archive the old template

## Pre-version control

### 2016

Ted C Munger:

#### Added
- Added `vspace` to allow for three line titles in abstract section. This `vspace` eliminates bad box warnings when one has three line title and aligns text properly.
- Added comments for legibility and to assist in future edits.
- Added Copyright page in front pages per Dedman 2016 Standards.
- Added BEGIN and END comments for ease of editing

#### Changed
- Renamed file to `DL_thesis_v2016.sty` for specific SMU Dedman & Lyle Engineering School Standards as of 2016.
- Renamed Bibliography Section to Bibliography vs. References
- Unbolded Bibiography Chapter Title by adding `\normalfont`
- Tightened title line spacing on Abstract page per Dedman 2016 standards
- Commented out page and margin specifications for easier changeability by using the geometry package. Page specifications are now controlled from the command in the template file's preamble.

#### Removed
- Removed the "Dr." prefix from the Advisor field to be consistent with other "Members" of the committee to be consistent and remove the "Dr. Dr." incident if one adds the prefix in the field value for Advisor.
- Removed preceding space before `bf` in section and `em` in subsubsection definition which makes headers misaligned.
- Removed `()` around degrees per Dedman 2016 standards
- Removed italics for dedication per Dedman 2016 standards
- Removed extra space in second title page per Dedman 2016 standards
- Removed extra space between advisor and degree dates per Dedman 2016 standards
- Removed custom commands from style file and placed in new `customcommands.tex` file for make style more concise.

### 2008-04-07
- Fixed problems due to adding hyperref package (Saeed Abu-Nimeh)

### 1997
- The document style `dissertation` is modified from LaTeX style `report` (Yu Chih (Julie) Liu)

### 1993
- The document style definition file `thesis.sty` (Jin Liu)

### 1989-05-24
- Original creation of `report.sty`

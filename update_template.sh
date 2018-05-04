#!/bin/bash

function install {
    # In case using an older version of Git
    git submodule update --init --recursive
    git submodule update --recursive

    # Install files for the user to edit
    rsync -r --update Dedman-Thesis-Latex-Template/user_thesis.tex .
    if [ ! -d "latex" ]; then
        mkdir latex
    fi
    rsync -r --update Dedman-Thesis-Latex-Template/latex/user_commands.tex ./latex/
    rsync -r --update Dedman-Thesis-Latex-Template/latex/metadata.tex ./latex/
    rsync -r --update Dedman-Thesis-Latex-Template/latex/FrontPages.tex ./latex/
    rsync -r --update Dedman-Thesis-Latex-Template/latex/standalone_abstract.tex ./latex/
    rsync -r --update Dedman-Thesis-Latex-Template/src .
    rsync -r --update Dedman-Thesis-Latex-Template/images .
    rsync -r --update Dedman-Thesis-Latex-Template/bib .
    rsync -r --update Dedman-Thesis-Latex-Template/Makefile .

    # Use the template base files
    # -i.bak is used for compatability across GNU and BSD/macOS sed
    sed -i.bak 's/sty\//Dedman-Thesis-Latex-Template\/sty\//g' user_thesis.tex
    sed -i.bak 's/latex\/packages/Dedman-Thesis-Latex-Template\/latex\/packages/g' user_thesis.tex
    sed -i.bak 's/latex\/packages/Dedman-Thesis-Latex-Template\/latex\/packages/g' latex/standalone_abstract.tex
    sed -i.bak 's/latex\/preamble/Dedman-Thesis-Latex-Template\/latex\/preamble/g' user_thesis.tex
    sed -i.bak 's/latex\/custom_commands/Dedman-Thesis-Latex-Template\/latex\/custom_commands/g' user_thesis.tex
    rm -rf *.bak
}

function update {
    git submodule update --recursive --remote
}

function remove {
    if [[ -f Makefile ]]; then
        make realclean
    fi
    rm -rf Makefile user_thesis.tex src latex images bib
}

function main {

    if [[ "$1" == "install" ]]; then
        install
    elif [[ "$1" == "update" ]]; then
        update
        git diff --quiet Dedman-Thesis-Latex-Template
        if [[ $? -eq 0 ]]; then
            echo "The base files are up to date."
        else
            echo "Updated base files. Please commit changes to Dedman-Thesis-Latex-Template"
        fi
    elif [[ "$1" == "remove" ]]; then
        remove
    else
        printf "Do you want to sync your base LaTeX files with the template? [Y/N]: "
        read -r response
        if [[ "${response,,}" == "y" ]]; then
            update
            git diff --quiet Dedman-Thesis-Latex-Template
            if [[ $? -eq 0 ]]; then
                echo "The base files are up to date."
            else
                echo "Updated base files. Please commit changes to Dedman-Thesis-Latex-Template"
            fi
        fi
    fi
}

main $1

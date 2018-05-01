#!/bin/bash

function install {
    # In case using an older version of Git
    git submodule update --init --recursive
    git submodule update --recursive

    # Install files for the user to edit
    rsync -r --update Dedman-Thesis-Latex-Template/user_thesis.tex .
    rsync -r --update Dedman-Thesis-Latex-Template/latex/user_commands.tex ./latex/user_commands.tex
    rsync -r --update Dedman-Thesis-Latex-Template/images .
    rsync -r --update Dedman-Thesis-Latex-Template/bib .
    rsync -r --update Dedman-Thesis-Latex-Template/Makefile .

    # Use the template base files
    sed -i 's/sty\//Dedman-Thesis-Latex-Template\/sty/g' user_thesis.tex
    sed -i 's/latex\/packages/Dedman-Thesis-Latex-Template\/latex\/packages/g' user_thesis.tex
    sed -i 's/latex\/preamble/Dedman-Thesis-Latex-Template\/latex\/preamble/g' user_thesis.tex
    sed -i 's/latex\/custom_commands/Dedman-Thesis-Latex-Template\/latex\/custom_commands/g' user_thesis.tex
    sed -i 's/latex\/standalone_abstract/Dedman-Thesis-Latex-Template\/latex\/standalone_abstract/g' Makefile
}

function update {
    git submodule update --recursive --remote
}

function main {

    if [[ "$1" == "install" ]]; then
        install
    elif [[ "$1" == "update" ]]; then
        update
        echo "Updated base files"
    else
        printf "Do you want to sync your base LaTeX files with the template? [Y/N]: "
        read -r response
        if [[ "${response,,}" == "y" ]]; then
            update
            echo "Updated base files"
        fi
    fi
}

main $1

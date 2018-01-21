#!/bin/bash

function install {
    # In case using an older version of Git
    git submodule update --init --recursive
    git submodule update --recursive
    rsync -r --update --exclude=.git* --exclude=*.sh --exclude=README.md --exclude=LICENSE Dedman-Thesis-Latex-Template/* .
}

function update {
    git submodule update --recursive
    # Update only if the submodule's have been updated more recently then user's
    rsync -r --update Dedman-Thesis-Latex-Template/sty .
    rsync -r --update Dedman-Thesis-Latex-Template/latex/packages.tex ./latex/packages.tex
    rsync -r --update Dedman-Thesis-Latex-Template/latex/customcommands.tex ./latex/customcommands.tex
    rsync -r --update Dedman-Thesis-Latex-Template/latex/preamble.tex ./latex/preamble.tex
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

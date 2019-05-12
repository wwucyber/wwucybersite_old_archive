#!/usr/bin/env bash

# Grant Barton 2019

rm -r ./public

if [ $# -eq 1 ] ; then
    if [ $1 = "ssh" ] ; then
        git submodule add -b master git@github.com:wwucyber/wwucyber.github.io.git public
        exit 0
     else
        echo "To clone the build repo with HTTPS, pass no arguments.  To use SSH, pass 'SSH'."
        exit 0
    fi
fi

git submodule add -b master https://github.com/wwucyber/wwucyber.github.io.git public

git pull --recurse-submodules

exit 0

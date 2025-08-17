#!/bin/bash
set -e

# Input file (the main SVG created by lowlighter)
INPUT="github-metrics.svg"

# Output files
HEADER="github-header.svg"
LANGS="github-languages.svg"
COMMUNITY="github-community.svg"
REPOS="github-repositories.svg"

# Crop different parts using inkscape (x, y, width, height)
inkscape "$INPUT" --export-type=svg --export-area=0:0:800:200 -o "$HEADER"
inkscape "$INPUT" --export-type=svg --export-area=0:200:800:400 -o "$LANGS"
inkscape "$INPUT" --export-type=svg --export-area=0:400:800:600 -o "$COMMUNITY"
inkscape "$INPUT" --export-type=svg --export-area=0:600:800:800 -o "$REPOS"

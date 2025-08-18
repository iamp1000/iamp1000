#!/usr/bin/env bash
# .scripts/split-metrics.sh
# Split a single metrics SVG into multiple section SVGs using Inkscape.

set -euo pipefail
IFS=$'\n\t'

INPUT="${1:-metrics.svg}"       # default input file name
OUT="."           # where we write the cropped svgs
W=480                           # canvas width  (adjust if your SVG width differs)
H=800                           # canvas height (adjust if your SVG height differs)

mkdir -p "$OUT"

echo "== Inkscape version =="
inkscape --version

echo "== Working dir =="
pwd

echo "== Listing repo root =="
ls -la

# Sanity export to confirm Inkscape can read the file
echo "== Full export smoke-test =="
inkscape "$INPUT" --export-type=svg -o "$OUT/full.svg"

# -------------------------------------------------------------
# CROPS (export-area = x0:y0:x1:y1) — tweak Y coordinates to fit your layout
# Tip: Your current metrics SVG is ~480x797. Start with these bounds and nudge.
# -------------------------------------------------------------

# Header
inkscape "$INPUT" --export-type=svg --export-area=0:0:${W}:140          -o "$OUT/github-header.svg"

# Activity / Isocalendar block
inkscape "$INPUT" --export-type=svg --export-area=0:140:${W}:360        -o "$OUT/github-activity.svg"

# Languages block
inkscape "$INPUT" --export-type=svg --export-area=0:360:${W}:560        -o "$OUT/github-languages.svg"

# Community block
inkscape "$INPUT" --export-type=svg --export-area=0:560:${W}:700        -o "$OUT/github-community.svg"

# Repositories / metadata tail
inkscape "$INPUT" --export-type=svg --export-area=0:700:${W}:797        -o "$OUT/github-repositories.svg"

# Optional: if the file contains an element id, export by id (vector-true crop)
# inkscape "$INPUT" --export-type=svg --export-id=languages-bar --export-id-only -o "$OUT/github-languages-byid.svg" || true

echo "== Output dir listing =="
ls -la "$OUT"

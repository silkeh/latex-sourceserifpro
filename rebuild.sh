#!/bin/bash
# Simple Script to rebuild the fonts in this package.

# Parameters
fontname="SourceSerifPro"
vend="adobe"

# Remove capitals from font
font=${fontname,,}

# Backup the hand-written package
mv tex/latex/$font/$font.sty tex/latex/$font/$font.sty.tmp

# Font features (font v1.014)
# aalt    Access All Alternates
# case    Case-Sensitive Forms
# dnom    Denominators
# frac    Fractions
# kern    Kerning
# liga    Standard Ligatures
# lnum    Lining Figures
# numr    Numerators
# onum    Oldstyle Figures
# ordn    Ordinals
# pnum    Proportional Figures
# sinf    Scientific Inferiors
# size    Optical Size
# subs    Subscript
# sups    Superscript
# tnum    Tabular Figures
# zero    Slashed Zero

autoinst fonts/opentype/$vend/$font/*   \
    -target=.                           \
    -vendor="$vend"                     \
    -typeface="$font"                   \
    -encoding=OT1,T1,LY1,TS1            \
    -ts1                                \
    -nosmallcaps                        \
    -superiors                          \
    -inferiors                          \
    -fractions                          \
    -noswash                            \
    -notitling                          \
    -noornaments                        \
    -noupdmap

# Move the generated file and the hand-written one back
mv tex/latex/$font/$fontname.sty tex/latex/$font/$font-type1-autoinst.sty
mv tex/latex/$font/$font.sty.tmp tex/latex/$font/$font.sty

# Remove empty directories
find . -type d -empty -delete


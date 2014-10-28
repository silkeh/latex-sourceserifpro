#!/bin/sh
# Simple Script to rebuild the fonts in this package.

font="sourceserifpro"
fontcap="SourceSerifPro"
vend="adobe"

#mv fonts/enc/dvips/$font fonts/enc/dvips/$vend
#mv fonts/map/dvips/$font fonts/map/dvips/$vend

mv tex/latex/$font/$font.sty tex/latex/$font/$font.sty.tmp

# Font features (Version 1.014)
#aalt	Access All Alternates
#case	Case-Sensitive Forms
#dnom	Denominators
#frac	Fractions
#kern	Kerning
#liga	Standard Ligatures
#lnum	Lining Figures
#numr	Numerators
#onum	Oldstyle Figures
#ordn	Ordinals
#pnum	Proportional Figures
#sinf	Scientific Inferiors
#size	Optical Size
#subs	Subscript
#sups	Superscript
#tnum	Tabular Figures
#zero	Slashed Zero

autoinst fonts/opentype/$vend/$font/*	\
	-target=.							\
	-vendor="$vend"						\
	-typeface="$font"					\
	-encoding=OT1,T1,LY1,TS1			\
	-ts1								\
	-nosmallcaps						\
	-superiors							\
	-inferiors							\
	-fractions							\
	-noswash							\
	-notitling							\
	-noornaments						\
	-noupdmap

mv tex/latex/$font/$fontcap.sty tex/latex/$font/$font-type1-autoinst.sty
mv tex/latex/$font/$font.sty.tmp tex/latex/$font/$font.sty

rm -r fonts/type42
rm -r fonts/vpl
rm -r fonts/pl
rm -r fonts/truetype

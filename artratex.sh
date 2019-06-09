#!/bin/bash
set -e

#---------------------------------------------------------------------------#
#-                       LaTeX Automated Compiler                          -#
#-                          <By Huangrui Mo>                               -#
#- Copyright (C) Huangrui Mo <huangrui.mo@gmail.com>                       -#
#- This is free software: you can redistribute it and/or modify it         -#
#- under the terms of the GNU General Public License as published by       -#
#- the Free Software Foundation, either version 3 of the License, or       -#
#- (at your option) any later version.                                     -#
#---------------------------------------------------------------------------#

#---------------------------------------------------------------------------#
#->> Preprocessing
#---------------------------------------------------------------------------#
#-
#-> Get source filename
#-
if [[ "$#" == "1" ]]; then
    FileName=`echo *.tex`
elif [[ "$#" == "2" ]]; then
    FileName="$2"
else
    echo "---------------------------------------------------------------------------"
    echo "Usage: "$0"  <l|p|x>< |a|b>  <filename>"
    echo "TeX engine parameters: <l:lualatex>, <p:pdflatex>, <x:xelatex>"
    echo "Bib engine parameters: < :none>, <a:bibtex>, <b:biber>"
    echo "---------------------------------------------------------------------------"
    exit
fi
FileName=${FileName/.tex}
#-
#-> Get tex compiler
#-
if [[ $1 == *'l'* ]]; then
    TexCompiler="lualatex"
else
    if [[ $1 == *'p'* ]]; then
        TexCompiler="pdflatex"
    else
        TexCompiler="xelatex"
    fi
fi
#-
#-> Get bib compiler
#-
if [[ $1 == *'a'* ]]; then
    BibCompiler="bibtex"
elif [[ $1 == *'b'* ]]; then
    BibCompiler="biber"
else
    BibCompiler=""
fi
#-
#-> Set compilation out directory resembling the inclusion hierarchy
#-
Tmp="Tmp"
Tex="Tex"
if [[ ! -d $Tmp/$Tex ]]; then
    mkdir -p $Tmp/$Tex
fi
#-
#-> Set LaTeX environmental variables to add subdirs into search path
#-
export TEXINPUTS=".//:$TEXINPUTS" # paths to locate .tex 
export BIBINPUTS=".//:$BIBINPUTS" # paths to locate .bib
export BSTINPUTS=".//:$BSTINPUTS" # paths to locate .bst
#---------------------------------------------------------------------------#
#->> Compiling
#---------------------------------------------------------------------------#
#-
#-> Build textual content and auxiliary files
#-
$TexCompiler -output-directory=$Tmp $FileName || exit
#-
#-> Build references and links
#-
if [[ -n $BibCompiler ]]; then
    #- fix the inclusion path for hierarchical auxiliary files
    sed -i -e "s|\@input{|\@input{$Tmp/|g" $Tmp/"$FileName".aux
    #- extract and format bibliography database via auxiliary files
    $BibCompiler $Tmp/$FileName
    #- insert reference indicators into textual content
    $TexCompiler -output-directory=$Tmp $FileName || exit
    #- refine citation references and links
    $TexCompiler -output-directory=$Tmp $FileName || exit
fi
#---------------------------------------------------------------------------#
#->> Postprocessing
#---------------------------------------------------------------------------#
#-
#-> Set PDF viewer
#-
System_Name=`uname`
if [[ $System_Name == "Linux" ]]; then
    PDFviewer="xdg-open"
elif [[ $System_Name == "Darwin" ]]; then
    PDFviewer="open"
else
    PDFviewer="open"
fi
#-
#-> Open the compiled file
#-
$PDFviewer ./$Tmp/"$FileName".pdf || exit
echo "---------------------------------------------------------------------------"
echo "$TexCompiler $BibCompiler "$FileName".tex finished..."
echo "---------------------------------------------------------------------------"


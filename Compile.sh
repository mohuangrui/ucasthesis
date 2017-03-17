#* *************************************************************************
#*                        bash scripts for compile latex
#* *************************************************************************
#! /bin/bash
#* *************************************************************************
#*                        pre information
#* *************************************************************************
if [[ "$#" == "1" ]];then
    File_Name=`echo *.tex`
elif [[ "$#" == "2" ]];then
    File_Name="$2"
else
    echo "*************************************************************************"
    echo "Usage: "$0"  <x|xa|p|pa>  <file name>"
    echo "Flag <x:xelatex>, <p:pdflatex>, <a:auto compilation>"
    echo "if compile failed, use \"X\" to terminate the terminal..."
    echo "*************************************************************************"
    exit
fi
#* *************************************************************************
#*                      get the file name to compile
#* *************************************************************************
File_Name=${File_Name/.tex}
#* *************************************************************************
#*                        get the compiler
#* *************************************************************************
if [[ $1 == 'p' || $1 == 'pa' ]];then
    CompileName="pdflatex"
elif [[ $1 == 'x' || $1 == 'xa' ]];then
    CompileName="xelatex"
else
    echo "*************************************************************************"
    echo "wrong compiler parameter, use \"pdflatex\" as current compiler"
    CompileName="pdflatex"
    echo "*************************************************************************"
fi
#* *************************************************************************
#*                        temperary directory
#* *************************************************************************
#* set the temp directory name
Tmp="Tmp"
if [[ ! -d $Tmp ]];then
    mkdir -p $Tmp
fi
#* *************************************************************************
#*                include subdirs to compile path
#* *************************************************************************
export TEXINPUTS=".//:$TEXINPUTS"
export BIBINPUTS=".//:$BIBINPUTS"
export BSTINPUTS=".//:$BSTINPUTS"
#* *************************************************************************
#*                compile target file
#* *************************************************************************
$CompileName -output-directory=$Tmp $File_Name || exit
#* *************************************************************************
#*               if use bibtex, need following commands 
#* *************************************************************************
if [[ $1 == 'pa' || $1 == 'xa' ]];then
bibtex ./$Tmp/$File_Name
$CompileName -output-directory=$Tmp $File_Name || exit
$CompileName -output-directory=$Tmp $File_Name || exit
fi
#* *************************************************************************
#*                open the generated pdf file
#* *************************************************************************
System_Name=`uname`
if [[ $System_Name == "Linux" ]]; then
    PDFviewer="xdg-open"
elif [[ $System_Name == "Darwin" ]]; then
    PDFviewer="open"
else
    PDFviewer="open"
fi
$PDFviewer ./$Tmp/"$File_Name".pdf || exit
echo "*************************************************************************"
echo "use $CompileName compile "$File_Name".tex finished!"
echo "*************************************************************************"

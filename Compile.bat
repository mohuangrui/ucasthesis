@rem ******************************************
@rem *** Batch scripts for latex on windows ***
@rem ******************************************
@echo off
@rem ******************************************
@rem ********* Set target compiler ************
@rem ******************************************
set CompilerOrder="2"
@rem ******************************************
if %CompilerOrder% == "1" (
set CompileName="pdflatex"
) else (
set CompileName="xelatex"
)
@rem ******************************************
@rem ****** Get filename in batch for loop ****
@rem ******************************************
for %%F in (*.tex) do (
set FileName=%%~nF
)
@rem ******************************************
@rem ** Create Tmp dir for aux and log files  *
@rem ******************************************
if not exist "./Tmp" (
 md Tmp
 )
@rem ******************************************
@rem *** Include subdirs to compile path ******
@rem ******************************************
set TEXINPUTS=.//;%TEXINPUTS%
set BIBINPUTS=.//;%BIBINPUTS%
set BSTINPUTS=.//;%BSTINPUTS%
@rem ******************************************
@rem ********  Compile target file  ***********
@rem ******************************************
%CompileName% -output-directory=Tmp %FileName%
@rem ******************************************
@rem * if use bibtex, need following commands *
@rem ******************************************
bibtex ./Tmp/%FileName%
%CompileName% -output-directory=Tmp %FileName%
%CompileName% -output-directory=Tmp %FileName%
@rem ******************************************
@rem ****** Open the generated pdf file  ******
@rem ******************************************
start  " " /max "./Tmp/%FileName%.pdf"
@rem ******************************************
echo ****************************************************
echo use  %CompileName% compile %FileName%.tex finished!
echo ****************************************************

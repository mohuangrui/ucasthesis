@rem ------------------------------------------------
@rem            LaTeX Automated Compiler
@rem                <By Huangrui Mo>
@rem Copyright (C) Huangrui Mo <huangrui.mo@gmail.com>
@rem This is free software: you can redistribute it
@rem and/or modify it under the terms of the GNU General
@rem Public License as published by the Free Software
@rem Foundation, either version 3 of the License, or
@rem (at your option) any later version.
@rem ------------------------------------------------
@echo off
@rem ------------------------------------------------
@rem ->> Set tex compiler
@rem ------------------------------------------------
set CompilerOrder="2"
@rem ------------------------------------------------
if %CompilerOrder% == "1" (
set CompileName="pdflatex"
) else (
set CompileName="xelatex"
)
@rem ------------------------------------------------
@rem ->> Get source filename
@rem ------------------------------------------------
for %%F in (*.tex) do (
set FileName=%%~nF
)
@rem ------------------------------------------------
@rem ->> Set directory
@rem ------------------------------------------------
if not exist "./Tmp" (
 md Tmp
 )
@rem ------------------------------------------------
@rem ->> Set environmental variables
@rem ------------------------------------------------
set TEXINPUTS=.//;%TEXINPUTS%
set BIBINPUTS=.//;%BIBINPUTS%
set BSTINPUTS=.//;%BSTINPUTS%
@rem ------------------------------------------------
@rem ->> Build textual content
@rem ------------------------------------------------
%CompileName% -output-directory=Tmp %FileName%
@rem ------------------------------------------------
@rem ->> Build references and links
@rem ------------------------------------------------
bibtex ./Tmp/%FileName%
%CompileName% -output-directory=Tmp %FileName%
%CompileName% -output-directory=Tmp %FileName%
@rem ------------------------------------------------
@rem ->> View compiled file
@rem ------------------------------------------------
start  " " /max "./Tmp/%FileName%.pdf"
echo ------------------------------------------------
echo %CompileName% %FileName%.tex finished...
echo ------------------------------------------------

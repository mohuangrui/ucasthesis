@rem ******************************************
@rem ** Batch scripts for latex on windows ****
@rem ******************************************
@echo off
@rem ******************************************
if exist "./Tmp" (
cd ./Tmp
@rem * delete all temp files:
echo y | del *.*
@rem * only delete .aux file:
@rem del *.aux
 ) else (
echo Tmp is not exist!
pause
 )

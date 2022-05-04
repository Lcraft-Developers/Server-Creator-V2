@echo off
title Purpur Installer

:pupurversion
cd ../
cd ../
mkdir temp
cd ./temp
del purpur /s /q
mkdir purpur
cd ./purpur


curl -OJL https://api.pl3x.net/v2/purpur
cls
echo.
echo.
echo.
echo MC Versions:
type purpur
echo.
echo Please enter the Minecraft-Version
echo.
set /p ver=MC Version: 
curl -OJL https://api.pl3x.net/v2/purpur/%ver%
cls
echo.
echo.
echo.
echo Pupur Builds:
type %ver%
echo.
echo Please enter the Build-Version
echo.
set /p b=Build Version: 
cd ../../
goto pupurcreate

:pupurcreate
cls
mkdir downloads
cd ./downloads
curl -OJL https://api.pl3x.net/v2/purpur/%ver%/%b%/download
timeout /T 3 /nobreak > nul
cls
echo.
echo.
echo.
echo Pupur Version %ver% Build %b% was installed

echo @echo off> Start.bat
echo title Pupur Server>> Start.bat
echo.>> Start.bat
echo :start>> Start.bat
echo echo Pupur Server starting...>> Start.bat
echo java -jar Pupur-%ver%-%b%.jar >> Start.bat
echo echo.>> Start.bat
echo echo.>> Start.bat
echo echo.>> Start.bat
echo pause>> Start.bat
echo goto start>> Start.bat

cd ../
cd ./data/

pause
call ../data/Installer-Menu.bat
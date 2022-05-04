@echo off
title Paper Installer

:paperversion
cd ../
cd ../
mkdir temp
cd ./temp
del paper /s /q
mkdir paper
cd ./paper

curl -o versions.txt "https://papermc.io/api/v2/projects/paper/"
cls
echo.
echo.
echo.
echo Versions:
type versions.txt
echo.
echo Please enter the Minecraft-Version
echo.
set /p ver=MC Version: 
curl -o builds-%ver%.txt "https://papermc.io/api/v2/projects/paper/versions/%ver%/"
cls
echo.
echo.
echo.
echo Builds:
type builds-%ver%.txt
echo.
echo Please enter the Build-Version
echo.
set /p b=Build Version: 
cd ../../
goto papercreate

:papercreate
cls
mkdir downloads
cd ./downloads
curl -z paper-%ver%-%b%.jar -o paper-%ver%-%b%.jar https://papermc.io/api/v2/projects/paper/versions/%ver%/builds/%b%/downloads/paper-%ver%-%b%.jar
timeout /T 2 /nobreak > nul
cls
echo.
echo.
echo.
echo Paper Version %ver% Build %b% was installed

echo @echo off> PaperStart.bat
echo title Paper Server>> PaperStart.bat
echo.>> PaperStart.bat
echo :start>> PaperStart.bat
echo echo Paper Server starting...>> PaperStart.bat
echo java -jar paper-%ver%-%b%.jar >> PaperStart.bat
echo echo.>> PaperStart.bat
echo echo.>> PaperStart.bat
echo echo.>> PaperStart.bat
echo pause>> PaperStart.bat
echo goto start>> PaperStart.bat

cd ../
cd ./data/

pause
call ../data/Installer-Menu.bat
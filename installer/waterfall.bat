@echo off
title Waterfall Installer

:waterfallversion
cd ../
cd ../
mkdir temp
cd ./temp
del waterfall /s /q
mkdir waterfall
cd ./waterfall

curl -o versions.txt "https://papermc.io/api/v2/projects/waterfall/"
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
curl -o builds-%ver%.txt "https://papermc.io/api/v2/projects/waterfall/versions/%ver%/"
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
goto waterfallcreate

:waterfallcreate
cls
mkdir downloads
cd ./downloads
curl -z Waterfall-%ver%-%b%.jar -o Waterfall-%ver%-%b%.jar https://papermc.io/api/v2/projects/waterfall/versions/%ver%/builds/%b%/downloads/waterfall-%ver%-%b%.jar
timeout /T 2 /nobreak > nul
cls
echo.
echo.
echo.
echo Waterfall Version %ver% Build %b% was installed

echo @echo off> WaterfallStart.bat
echo title Waterfall Server>> WaterfallStart.bat
echo.>> WaterfallStart.bat
echo :start>> WaterfallStart.bat
echo echo Waterfall Server starting...>> WaterfallStart.bat
echo java -jar Waterfall-%ver%-%b%.jar >> WaterfallStart.bat
echo echo.>> WaterfallStart.bat
echo echo.>> WaterfallStart.bat
echo echo.>> WaterfallStart.bat
echo pause>> WaterfallStart.bat
echo goto start>> WaterfallStart.bat

cd ../
cd ./data/

pause
call ../data/Installer-Menu.bat
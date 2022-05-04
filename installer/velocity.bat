@echo off
title Velocity Installer

:velocityversion
cd ../
cd ../
mkdir temp
cd ./temp
del velocity /s /q
mkdir velocity
cd ./velocity

curl -o versions.txt https://velocity-download-api.herokuapp.com/
cls
echo.
echo.
echo.
echo Builds:
type versions.txt
echo.
echo Please enter the Build Version
echo.
set /p ver=Build Version:
cd ../../ 
goto velocitycreate

:velocitycreate
cls

mkdir downloads
cd ./downloads
curl -z velocity-%ver%-%b%.jar -o velocity-%ver%-%b%.jar https://versions.velocitypowered.com/download/%ver%.jar
timeout /T 2 /nobreak > nul

cls
echo.
echo.
echo.
echo velocity Version %ver% Build %b% was installed

echo @echo off> VelocityStart.bat
echo title velocity Server>> VelocityStart.bat
echo.>> VelocityStart.bat
echo :start>> VelocityStart.bat
echo echo velocity Server starting...>> VelocityStart.bat
echo java -jar velocity-%ver%-%b%.jar >> VelocityStart.bat
echo echo.>> VelocityStart.bat
echo echo.>> VelocityStart.bat
echo echo.>> VelocityStart.bat
echo pause>> VelocityStart.bat
echo goto start>> VelocityStart.bat

cd ../
cd ./data/

pause
call ../data/Installer-Menu.bat
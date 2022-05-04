@echo off
title Spigot Installer

:spigotversion
cd ../
cd ../
mkdir temp
cd ./temp
del spigot /s /q
mkdir spigot
cd ./spigot

cls
echo.
echo.
echo.
echo Please enter the Minecraft-Version
echo.
set /p ver=MC Version: 
echo.
cd ../../
goto spigotcreate

:spigotcreate
cls

cd ./temp/spigot
curl -z BuildTools.jar -o BuildTools.jar https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
cd ../../

mkdir downloads
mkdir BuildTools
cd ./BuildTools
xcopy ..\temp\spigot\BuildTools.jar .\ /s /y

echo.
echo Loading BuildTools...
timeout /T 4 /nobreak > nul
cls
java -jar -Xmx1024M BuildTools.jar --rev %ver%
echo.
echo.
move ./spigot-%ver%.jar ../downloads/
timeout /T 4 /nobreak > nul
cls
echo.
echo.
echo.
echo Spigot Version %ver% was installed

cd ../
cd ./downloads/
echo @echo off> SpigotStart.bat
echo title Spigot Server>> SpigotStart.bat
echo.>> SpigotStart.bat
echo :start>> SpigotStart.bat
echo echo Spigot Server starting...>> SpigotStart.bat
echo java -jar spigot-%ver%.jar >> SpigotStart.bat
echo echo.>> SpigotStart.bat
echo echo.>> SpigotStart.bat
echo echo.>> SpigotStart.bat
echo pause>> SpigotStart.bat
echo goto start>> SpigotStart.bat

cd ../
cd ./data/

pause
call ../data/Installer-Menu.bat
@echo off
title BungeeCord Installer

:bungeecordcreate
cd ../
cd ../
mkdir temp
cd ./temp
del bungeecord /s /q
mkdir bungeecord
cd ./bungeecord

cls
cd ../../
mkdir downloads
cd ./downloads

cd ../temp/bungeecord
curl -z BungeeCord.jar -o BungeeCord.jar https://ci.md-5.net/job/BungeeCord/lastSuccessfulBuild/artifact/bootstrap/target/BungeeCord.jar
cd ../../downloads

xcopy ..\temp\bungeecord\BungeeCord.jar .\ /s /y

timeout /T 2 /nobreak > nul
cls
echo.
echo.
echo.
echo Latest Bungeecord has been installed

echo @echo off> BungeecordStart.bat
echo title BungeeCord Server>> BungeecordStart.bat
echo.>> BungeecordStart.bat
echo :start>> BungeecordStart.bat
echo echo BungeeCord Server starting...>> BungeecordStart.bat
echo java -jar BungeeCord.jar >> BungeecordStart.bat
echo echo.>> BungeecordStart.bat
echo echo.>> BungeecordStart.bat
echo echo.>> BungeecordStart.bat
echo pause>> BungeecordStart.bat
echo goto start>> BungeecordStart.bat

cd ../
cd ./data/

pause
call ../data/Installer-Menu.bat
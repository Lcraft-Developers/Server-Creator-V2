@echo off
title Stop VMs

:vmstop
cls

taskkill/F /IM java.exe
taskkill/F /IM javaw.exe

echo All Tasks killed

pause
call ../data/Tools-Menu.bat
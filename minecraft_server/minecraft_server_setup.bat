@echo off

REM Script for downloading and setting up minecraft server on a windows computer. Location of server is in your documents folder.
REM First parameter in, is the name of the minecraft folder.
REM Example program call: minecraft_server_setup.bat my_server_name
REM Program must be run in cmd (NOT POWERSHELL).
REM Obviously need java before running. https://www.oracle.com/java/technologies/downloads/#jdk20-windows

REM del /s %USERPROFILE%\Documents\%1
set scriptlocation=%cd%

chdir /d %USERPROFILE%\Documents

mkdir %1
cd %1

REM Getting the minecraft_server.jar
REM Minecraft version 1.21
powershell.exe -command "& Invoke-WebRequest -OutFile server.jar -Uri https://piston-data.mojang.com/v1/objects/450698d1863ab5180c25d7c804ef0fe6369dd1ba/server.jar"

java -Xmx1024M -Xms1024M -jar server.jar nogui

del eula.txt
echo eula=true>eula.txt

echo Server folder location: %cd%\%1

java -Xmx1024M -Xms1024M -jar server.jar nogui

chdir /d %scriptlocation%

pause

::=======================::
:: SteamCMD Guardian 1.2 ::
::     By ckynick254     ::
::     Edited By R4G3    ::
::=======================::
set programname=SteamCMD Server Downloader/Updater

::======================::
::  Steam log-in info   ::
::    Replace after =   ::
:: With your Steam info ::
::======================::
set username=STEAMUSERNAME
set password=PASSWORD

::=======================::
::   SteamCMD folder     ::
::    Replace after =    ::
::=======================::
set runcmd=D:\SteamCMD\
 
::=======================::
::    Server folder      ::
::    Replace after =    ::
::=======================::
set setser=D:\Servers\

::=======================::
::   End of variables    ::
::=======================::
 
:: This will keep the window clean and easy to read
@ECHO off
 
:: Sets the title of the window
title %programname%
:: Clears the window incase there is anything there
cls
COLOR 1f
CD %runcmd%
 
:: Prints to the window what we are doing
ECHO %programname% has been started!
:start
ECHO.
ECHO.
ECHO   ##############################################################
ECHO   #                    Server Choices                          #
ECHO   # 1 - DayZ Dedicated Server                                  #
ECHO   # 2 - DayZ Experimental Dedicated Server                     #
ECHO   # 3 - Arma 3 Dedicated Server                                #
ECHO   # 4 - 7 Days to Die Dedicated Server                         #
ECHO   # 5 - Empyrion Dedicated Server                              #
ECHO   # 6 - The Forest Dedicated Server                            #
ECHO   # 7 - Miscreated Dedicated Server                            #
ECHO   # 8 - SURVIVAL Dedicated Server                              #
ECHO   # 9 - Mordhau Dedicated Server                               #
ECHO   # 0 - Space Engineers Dedicated Server                       #
ECHO   # A - Arma 3 Dedicated Server                                #
ECHO   # B - Rust Dedicated Server                                  #
ECHO   # C - ARK: Survival Evolved Dedicated Server                 #
ECHO   # D - Brink Dedicated Server                                 #
:: ECHO   # E - EXTRA OPTION Dedicated Server                          #
:: ECHO   # F - EXTRA OPTION Dedicated Server                          #
:: ECHO   # G - EXTRA OPTION Dedicated Server                          #
:: ECHO   # I - EXTRA OPTION Dedicated Server                          #
:: ECHO   # J - EXTRA OPTION Dedicated Server                          #
:: ECHO   # K - EXTRA OPTION Dedicated Server                          #
:: ECHO   # L - EXTRA OPTION Dedicated Server                          #
:: ECHO   # M - EXTRA OPTION Dedicated Server                          #
:: ECHO   # N - EXTRA OPTION Dedicated Server                          #
:: ECHO   # P - EXTRA OPTION Dedicated Server                          #
:: ECHO   # R - EXTRA OPTION Dedicated Server                          #
:: ECHO   # S - EXTRA OPTION Dedicated Server                          #
:: ECHO   # T - EXTRA OPTION Dedicated Server                          #
:: ECHO   # U - EXTRA OPTION Dedicated Server                          #
:: ECHO   # V - EXTRA OPTION Dedicated Server                          #
:: ECHO   # W - EXTRA OPTION Dedicated Server                          #
:: ECHO   # X - EXTRA OPTION Dedicated Server                          #
:: ECHO   # Y - EXTRA OPTION Dedicated Server                          #
:: ECHO   # Z - EXTRA OPTION Dedicated Server                          #
ECHO   # H - HELP!                                                  #
ECHO   # Q - Exit                                                   #
ECHO   ##############################################################
ECHO.
ECHO.
 
:: Delete variable %A%
SET "A="
SET /P A=Set Your Choice And Press Enter: 
ECHO Loading .........
IF "%A%"=="1" set app=223350 
IF "%A%"=="2" set app=1042420
IF "%A%"=="3" set app=233780
IF "%A%"=="4" set app=294420
IF "%A%"=="5" set app=530870
IF "%A%"=="6" set app=556450
IF "%A%"=="7" set app=302200
IF "%A%"=="8" set app=538480
IF "%A%"=="9" set app=629800
IF "%A%"=="0" set app=298740
IF "%A%"=="A" set app=233780
IF "%A%"=="B" set app=258550
IF "%A%"=="C" set app=376030
IF "%A%"=="D" set app=72780
:: IF "%A%"=="E" set app=CHANGEME
:: IF "%A%"=="F" set app=CHANGEME
:: IF "%A%"=="G" set app=CHANGEME
:: IF "%A%"=="I" set app=CHANGEME
:: IF "%A%"=="J" set app=CHANGEME
:: IF "%A%"=="K" set app=CHANGEME
:: IF "%A%"=="L" set app=CHANGEME
:: IF "%A%"=="M" set app=CHANGEME
:: IF "%A%"=="N" set app=CHANGEME
:: IF "%A%"=="O" set app=CHANGEME
:: IF "%A%"=="P" set app=CHANGEME
:: IF "%A%"=="R" set app=CHANGEME
:: IF "%A%"=="S" set app=CHANGEME
:: IF "%A%"=="T" set app=CHANGEME
:: IF "%A%"=="U" set app=CHANGEME
:: IF "%A%"=="V" set app=CHANGEME
:: IF "%A%"=="W" set app=CHANGEME
:: IF "%A%"=="X" set app=CHANGEME
:: IF "%A%"=="Y" set app=CHANGEME
:: IF "%A%"=="Z" set app=CHANGEME
IF "%A%"=="H" ECHO.
IF "%A%"=="H" ECHO https://developer.valvesoftware.com/wiki/SteamCMD
IF "%A%"=="H" ECHO.
IF "%A%"=="H" PAUSE
IF "%A%"=="H" goto start
IF "%A%"=="Q" EXIT
 
:: This is a return point in case the server crashes or is closed
:restart
ECHO.
ECHO (%date%)(%time%) %servername% is now installing/updating
ECHO Watching %servername% for crashes...
>> "%servername%.log" ECHO.
>> "%servername%.log" ECHO (%date%)(%time%) %servername% is now ONLINE
>> "%servername%.log" ECHO (%date%)(%time%) Watching %servername% for crashes...
 
::Start the actual update window
start /wait steamcmd +force_install_dir %setser%%app%Server\ +login %username% %password% +app_update %app% validate
ECHO (%time%) WARNING: srcds closed or crashed, restarting.
ECHO.
ECHO (%date%)(%time%) Crash or Close detected!
ECHO %servername% is now restarting...
>> "%servername%.log" ECHO.
>> "%servername%.log" ECHO (%date%)(%time%) Crash or Close detected!
>> "%servername%.log" ECHO (%date%)(%time%) %servername% is now restarting...
 
::Server crashed or closed, so we point it to the return point to start the server again
GOTO restart

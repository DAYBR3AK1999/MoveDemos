@echo off

cls
echo Date format = %date%
echo dd = %date:~0,2%
echo mm = %date:~3,2%
echo yyyy = %date:~6,8%
echo.
echo Timestamp = %date:~0,2%_%date:~3,2%_%date:~6,8%

rem Will create a directory with date of Batch execution.
set dirDay=%date:~0,2%
set dirYear=%date:~6,8%

rem use Windows time, in my case European.
for /f "delims=" %%a in ('wmic OS Get localdatetime ^| find "."') do set dt=%%a
set dirMonth=%dt:~4,2%

rem you can translate the monthname for example January to Janvier.
if %dirMonth%==01 set dirMonthname=January
if %dirMonth%==02 set dirMonthname=Febuary
if %dirMonth%==03 set dirMonthname=March
if %dirMonth%==04 set dirMonthname=April
if %dirMonth%==05 set dirMonthname=May
if %dirMonth%==06 set dirMonthname=June
if %dirMonth%==07 set dirMonthname=July
if %dirMonth%==08 set dirMonthname=August
if %dirMonth%==09 set dirMonthname=September
if %dirMonth%==10 set dirMonthname=October
if %dirMonth%==11 set dirMonthname=November
if %dirMonth%==12 set dirMonthname=December

echo %dirMonthname%

rem here is the path to where you want the .dem files to be placed.
set backupDir=C:\xampp\htdocs\records\Demos\"Counter Strike Source"\"Zombie Revival"

rem create backup folder if it doesn't exist
if not exist %backupDir%\%dirYear%\%dirMonthname%\%dirDay%\   mkdir %backupDir%\%dirYear%\%dirMonthname%\%dirDay%\

rem it moves the .dem files to the path from line 36.
move C:\Users\Administrator\Documents\GameServers\CSSourceZM\cstrike\*.dem*.* %backupDir%\%dirYear%\%dirMonthname%\%dirDay%\

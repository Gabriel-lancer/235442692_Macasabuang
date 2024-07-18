@echo off
title Simple Windows Utilities Batch Script

:: Display the menu
:menu
cls
echo.
echo 1. Display IP Configuration (ipconfig)
echo 2. List Running Tasks (tasklist)
echo 3. Kill a Task (taskkill)
echo 4. Check Disk (chkdsk)
echo 5. Format a Drive (format)
echo 6. Defragment a Drive (defrag)
echo 7. Find Text in a File (find)
echo 8. Change File Attributes (attrib)
echo 9. Exit
echo.
:: Prompt user to choose an option
set /p choice="Choose an option (1-9): "

:: Redirect to the corresponding section based on user input
if "%choice%"=="1" goto ipconfig
if "%choice%"=="2" goto tasklist
if "%choice%"=="3" goto taskkill
if "%choice%"=="4" goto chkdsk
if "%choice%"=="5" goto format
if "%choice%"=="6" goto defrag
if "%choice%"=="7" goto find
if "%choice%"=="8" goto attrib
if "%choice%"=="9" goto exit

:: Handle invalid choice
echo Invalid choice, please try again.
pause
goto menu

:ipconfig
:: Display IP configuration
cls
ipconfig
pause
goto menu

:tasklist
:: List all running tasks
cls
tasklist
pause
goto menu

:taskkill
:: Prompt for PID and kill the task
cls
echo Enter the PID of the process to kill:
set /p pid=
taskkill /PID %pid%
pause
goto menu

:chkdsk
:: Prompt for drive letter and check the disk
cls
echo Enter the drive letter to check (e.g., C:):
set /p drive=
chkdsk %drive%
pause
goto menu

:format
:: Prompt for drive letter and format the drive
cls
echo Enter the drive letter to format (e.g., E:):
set /p drive=
echo WARNING: Formatting will erase all data on the drive.
echo Are you sure you want to format %drive%? (Y/N):
set /p confirm=
if /I "%confirm%"=="Y" (
    format %drive%
) else (
    echo Format cancelled.
)
pause
goto menu

:defrag
cls
echo Enter the drive letter to defrag (e.g., C:):
set /p drive=
defrag %drive%
pause
goto menu

:find
cls
echo Enter the text to find:
set /p text=
echo Enter the file to search in (include the path if not in the same directory):
set /p file=
find "%text%" %file%
pause
goto menu

:attrib
cls
echo Enter the file or directory to change attributes (include the path if not in the same directory):
set /p file=
echo Enter the attributes (e.g., +r to make read-only, -r to make writable, +h to hide, -h to unhide):
set /p attributes=
attrib %attributes% %file%
pause
goto menu

:exit
exit

@echo off
setlocal

REM Step 1: Sort files on Drive C by date
echo Sorting files on Drive C by date...
pushd C:\
dir /b /o:d > "%temp%\filelist.txt"
popd

REM Step 2: Archive files to a folder on Drive D
set ArchiveFolder=D:\ArchiveFolder
echo Archiving files to %ArchiveFolder%...
if not exist "%ArchiveFolder%" mkdir "%ArchiveFolder%"
for /f "tokens=*" %%a in (%temp%\filelist.txt) do (
    move "C:\%%a" "%ArchiveFolder%\"
)

REM Step 3: Sort archived files by size
echo Sorting archived files by size...
pushd "%ArchiveFolder%"
dir /b /o:-s > "%temp%\archived_filelist.txt"
popd

REM Step 4: Prompt user for permission to delete old large files
set /p deleteFiles="Do you want to delete the old large files? (Y/N): "
if /i "%deleteFiles%"=="Y" (
    for /f "tokens=*" %%b in (%temp%\archived_filelist.txt) do (
        set "fileToDelete=%ArchiveFolder%\%%b"
        echo Deleting file: %%b
        del "%%b"
        echo File deleted.
    )
) else (
    echo No files will be deleted.
)

REM Clean up temporary files
del "%temp%\filelist.txt"
del "%temp%\archived_filelist.txt"

echo Operation completed.
pause

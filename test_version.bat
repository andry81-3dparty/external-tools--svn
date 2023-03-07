@echo off

setlocal

set "TEST_ROOT=%~dp0"

set "TEST_ROOT=%~dp0"

set "CONFIG_FILE_IN=%TEST_ROOT%\versions.lst"

rem load versions from file
for /F "usebackq eol=# tokens=1,* delims=|" %%i in ("%CONFIG_FILE_IN%") do (
  set "TOOLSET_ROOT_DIR=%%i"
  set "TOOLSET_BIN_DIR=%%j"
  call :PROCESS_FIELDS
)

pause

exit /b 0

:PROCESS_FIELDS
rem trim white spaces
:TRIM_TOOLSET_ROOT_DIR_LEFT
if defined TOOLSET_ROOT_DIR if "%TOOLSET_ROOT_DIR:~0,1%" == " " ( set "TOOLSET_ROOT_DIR=%TOOLSET_ROOT_DIR:~1%" & goto TRIM_TOOLSET_ROOT_DIR_LEFT )
:TRIM_TOOLSET_ROOT_DIR_RIGHT
if defined TOOLSET_ROOT_DIR if "%TOOLSET_ROOT_DIR:~-1%" == " " ( set "TOOLSET_ROOT_DIR=%TOOLSET_ROOT_DIR:~0,-1%" & goto TRIM_TOOLSET_ROOT_DIR_RIGHT )
:TRIM_TOOLSET_BIN_DIR_LEFT
if defined TOOLSET_BIN_DIR if "%TOOLSET_BIN_DIR:~0,1%" == " " ( set "TOOLSET_BIN_DIR=%TOOLSET_BIN_DIR:~1%" & goto TRIM_TOOLSET_BIN_DIR_LEFT )
:TRIM_TOOLSET_BIN_DIR_RIGHT
if defined TOOLSET_BIN_DIR if "%TOOLSET_BIN_DIR:~-1%" == " " ( set "TOOLSET_BIN_DIR=%TOOLSET_BIN_DIR:~0,-1%" & goto TRIM_TOOLSET_BIN_DIR_RIGHT )

set "TOOLSET_BIN_ROOT=%TEST_ROOT%%TOOLSET_ROOT_DIR%/%TOOLSET_BIN_DIR%"
set "TOOLSET_BIN_ROOT=%TOOLSET_BIN_ROOT:/=\%"

call :TEST
exit /b

:TEST
call :CMD "%%TOOLSET_BIN_ROOT%%\svn.exe" --version
exit /b 0

:CMD
echo.^>%*
rem run command and truncate the output
set IS_LAST_LINE_EMPTY=0
set LINE_STR_INDEX=0
for /F "usebackq delims=" %%i in (`@%* ^| findstr /B /N /R /C:".*"`) do (
  set LINE_STR=%%i
  call :PRINT && goto CMD_EXIT
  set /A LINE_STR_INDEX+=1
)

:CMD_EXIT
if %IS_LAST_LINE_EMPTY% EQU 0 echo.

exit /b 0

:PRINT
setlocal ENABLEDELAYEDEXPANSION

set LASTERROR=1
set OFFSET=0
:OFFSET_LOOP
set CHAR=!LINE_STR:~%OFFSET%,1!
if not "!CHAR!" == ":" ( set /A OFFSET+=1 && goto OFFSET_LOOP )
set /A OFFSET+=1

if "!LINE_STR:~%OFFSET%!" == "" set IS_LAST_LINE_EMPTY=1

set STOPSEQUENCE=!LINE_STR:~%OFFSET%,13!
if /i "!STOPSEQUENCE!" == "copyright (c)" (
  set LASTERROR=0
  goto PRINT_EXIT
)

echo.!LINE_STR:~%OFFSET%!

:PRINT_EXIT
(
  endlocal
  set IS_LAST_LINE_EMPTY=%IS_LAST_LINE_EMPTY%
  exit /b %LASTERROR%
)

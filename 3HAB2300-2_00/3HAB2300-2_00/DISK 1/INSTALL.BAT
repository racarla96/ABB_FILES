@echo off
cls
if exist c:\s4prog\nul goto stop
mkdir c:\s4prog
copy a:\update.exe c:\s4prog
copy a:\readme.txt c:\s4prog
echo. 
echo The S4-program Update is now installed in c:\s4prog 
echo To start S4-program Update enter at the DOS-prompt:
echo s4prog\update
echo. 
echo An icon may also be created in Windows Program Manager 
echo Start command is to be c:\s4prog\update.exe  
echo.
goto end
:stop
echo The S4-program Update cannot be installed
echo Directory c:\s4prog already exists and must first be deleted
echo.  
goto end
:end

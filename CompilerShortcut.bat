@echo off
setlocal


set projectName=TestProj
path="C:\Users\nobem\Documents\RandomProgramming\Assembly\Learning\LASM"
cd /d "C:\Users\nobem\Documents\RandomProgramming\Assembly\Learning\LASM"


\masm32\bin\ml /c /Zd /coff %projectName%.asm
if errorlevel 1 (
    echo Assembly failed. Press any key to exit.
    pause >nul
    exit /b
)

echo Linking %projectName%.obj...
\masm32\bin\Link /SUBSYSTEM:CONSOLE %projectName%.obj
if errorlevel 1 (
    echo Linking failed. Press any key to exit.
    pause >nul
    exit /b
)



if not exist path./Output (
    mkdir "Output"
)

move "%projectName%.obj" "./Output"
move "%projectName%.exe" "./Output"

echo.
echo Done. Press any key to exit.
pause >nul

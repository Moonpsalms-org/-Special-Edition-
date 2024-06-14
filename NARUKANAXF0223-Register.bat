@echo off
REM Check if running as administrator
net session >nul 2>&1
if %errorLevel% == 0 (
    title 聖なるかな　Special Edition By Moonpsalms-org
    echo 聖なるかな　Special Edition 注册表修复程序 By Moonpsalms-org
    echo Running with administrative privileges...
    echo=
    echo=
    echo 首次打开游戏前或移动游戏到别的文件夹，需要运行此脚本。
    echo 按任意键开始修复……
    pause >nul
    cd /d "%~dp0"
    if exist NarukanaXF0223.exe goto UpdateRegistry
    echo 请将此程序放置于NarukanaXF0223.exe同一目录下再运行，按任意键退出...
    goto end
) else (
    echo 请以管理员身份运行，按任意键退出...
    pause >nul
    exit
)

:UpdateRegistry
SET CurrentDir=%CD%
SET CurrentDir=%CurrentDir:\=\\%

REM 删除旧的注册表项
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\XUSE_CORP\NarukanaXF0223" /f

REM 创建新的注册表文件
> ".\Update.reg" ECHO Windows Registry Editor Version 5.00
>>".\Update.reg" ECHO.
>>".\Update.reg" ECHO [HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\XUSE_CORP]
>>".\Update.reg" ECHO.
>>".\Update.reg" ECHO [HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\XUSE_CORP\NarukanaXF0223]
>>".\Update.reg" ECHO "HD"="%CurrentDir%\\HD\\"
>>".\Update.reg" ECHO "CD"="%CurrentDir%\\CD\\"
>>".\Update.reg" ECHO "PatchVersion"=dword:00010006
>>".\Update.reg" ECHO "install"="%CurrentDir%\\"

cls

REM 导入新的注册表文件
regedit /s ".\Update.reg"
"%windir%\regedit.exe" /s ".\Update.reg"
"%windir%\SysWoW64\regedit.exe" /s ".\Update.reg"

REM 删除临时注册表文件
del /F /Q ".\Update.reg"

echo 修复完成，按任意键退出
:end
pause >nul
exit

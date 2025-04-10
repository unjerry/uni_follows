@echo off
setlocal

:: 提示用户输入端口号，如果为空则默认使用 8000
set /p PORT=请输入服务器端口号（默认为8000，如果直接回车则使用8000）:
if "%PORT%"=="" set PORT=8000

:: 获取当前目录路径
set "DIR=%CD%"

:: 启动 Python HTTP 服务器
start "" python -m http.server %PORT% --directory "%DIR%"

:: 等待服务器启动
timeout /t 3 /nobreak >nul

:: 在默认浏览器中打开指定的网页
start "" http://localhost:%PORT%/index.html

endlocal

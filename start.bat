@echo off
:: 核心防闪退：开启延迟扩展 + 错误不退出 + 强制切换到脚本目录
setlocal enabledelayedexpansion
cd /d "%~dp0" 2>nul
chcp 65001 >nul 2>&1
title 数据平台操作指南 - 本地服务器
cls

echo ==============================================
echo          数据平台操作指南 - 本地服务器
echo ==============================================
echo 正在准备启动...
echo 🔔 提示：打开页面后，此窗口请勿关闭！
echo.

:: 第一步：检查index.html是否存在（核心前置校验）
if not exist "index.html" (
    echo ❌ 错误：未找到 index.html 文件！
    echo 📌 请确保 start.bat 和 index.html 在同一个文件夹里
    echo.
    pause
    exit /b 1
)

:: 第二步：尝试用Python启动（优先级1）
python --version >nul 2>&1
if !errorlevel! equ 0 (
    echo ✅ 正在用Python启动服务器...
    start "" "http://localhost:8000/index.html"
    python -m http.server 8000
    goto :end
)

:: 第三步：尝试用Python3启动（优先级2）
python3 --version >nul 2>&1
if !errorlevel! equ 0 (
    echo ✅ 正在用Python3启动服务器...
    start "" "http://localhost:8000/index.html"
    python3 -m http.server 8000
    goto :end
)

:: 第四步：用PowerShell启动（兜底方案，Windows自带）
echo ⚙️  正在用系统自带方式启动服务器...
powershell -Command "$ErrorActionPreference='Stop'; try { $listener = New-Object System.Net.HttpListener; $listener.Prefixes.Add('http://localhost:8000/'); $listener.Start(); Write-Host '✅ 服务器启动成功！'; Start-Process 'http://localhost:8000/index.html'; while ($listener.IsListening) { Start-Sleep -Seconds 1 }; $listener.Stop() } catch { Write-Host '❌ 启动失败，请手动打开浏览器访问：http://localhost:8000/index.html'; Start-Sleep -Seconds 10 }"

:end
:: 防闪退：无论成功/失败，都暂停窗口
echo.
echo ==============================================
echo          服务器已停止（关闭此窗口即可）
echo ==============================================
pause >nul
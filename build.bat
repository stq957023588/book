@echo off
chcp 65001
setlocal enabledelayedexpansion
echo 开始构建
rmdir /s /q "public"
echo 清除缓存
echo Building...
hugo --minify
echo 构建结束

REM === 设置目标目录（修改为你要清理的路径）===
set "TARGET=C:\Users\95702\Documents\Workspace\book-publick"

echo 正在清理目录：%TARGET%

REM === 先删除文件 ===
for %%F in ("%TARGET%\*") do (
    set "NAME=%%~nxF"
    if /I not "!NAME!"==".gitignore" (
        if /I not "!NAME!"==".git" (
            if /I not "!NAME!"==".idea" (
                del /f /q "%%F" 2>nul
            )
        )
    )
)

REM === 再删除文件夹（确保用 /d 识别目录）===
for /d %%D in ("%TARGET%\*") do (
    set "NAME=%%~nxD"
    if /I not "!NAME!"==".git" (
        if /I not "!NAME!"==".idea" (
            rmdir /s /q "%%D" 2>nul
        )
    )
)



REM === 复制 public 文件夹内容到 TARGET ===
REM /E 复制所有子目录，包括空目录
REM /H 包括隐藏和系统文件
REM /Y 覆盖已存在文件无需提示
robocopy "public" "%TARGET%" /E /DCOPY:T /NFL /NDL /NJH /NJS /NP

cd /d "%TARGET%"

REM 获取当前日期和时间，格式化为 YYYY-MM-DD_HH-MM-SS
for /f "tokens=1-4 delims=/:. " %%a in ("%DATE% %TIME%") do (
    set "YYYY=%%d"
    set "MM=%%b"
    set "DD=%%c"
    set "HH=%%e"
)
REM 有时候 TIME 包含小数秒和空格，简单处理：
set "COMMIT_TIME=%DATE% %TIME%"
set "COMMIT_MSG=自动更新 public 文件夹内容 [%COMMIT_TIME%]"

git add .
git commit -m "%COMMIT_MSG%"

REM git push origin main  (如需要可以取消注释)
git push

echo Git 提交完成！

pause

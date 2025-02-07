@echo off
chcp 65001

setlocal EnableDelayedExpansion

for /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set mydate=%%a-%%b-%%c)
for /f "tokens=1-2 delims=/:" %%a in ('time /t') do (set mytime=%%a:%%b)

set now=!mydate!
echo 当前日期为：%now%

set "set_date=2024-12-01"
echo 设置日期为 !set_date!
date !set_date!

echo 启动SAS
start "" "D:\Program Files\SASHome\SASFoundation\9.4\sas.exe"

echo 等待SAS启动
ping -n 8 127.0.0.1>nul

echo 还原日期为%now%
date %now%

exit
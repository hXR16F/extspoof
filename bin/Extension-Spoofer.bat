:: Programmed by hXR16F
:: hXR16F.ar@gmail.com

@echo off
setlocal EnableDelayedExpansion

set /p "q1=Original filename : "
set /p "q2=Filename to spoof : "
set /p "q3=Add '.' before extension? [y/n] : "

for /f "tokens=1,2* delims=." %%i in ('echo !q1!') do (set "filename=%%i" & set "extension=%%j")
for /f "tokens=1,2* delims=." %%i in ('echo !q2!') do (set "spoofed_filename=%%i" & set "spoofed_extension=%%j")
if /i "%q3%" equ "y" (set "dot=.") else (set "dot=")

cls
(
	echo # Extension spoofer by hXR16F
	echo Params = ['%filename%', '%extension%', '%spoofed_filename%', '%spoofed_extension%', '%dot%']
)
copy "%q1%" "backup_%q1%"
rem python spoof.py "%filename%" "%extension%" "%spoofed_filename%" "%spoofed_extension%" "%dot%"
spoof.exe "%filename%" "%extension%" "%spoofed_filename%" "%spoofed_extension%" "%dot%"

@ping localhost -n 3 > nul
exit /b
:: Programmed by hXR16F
:: hXR16F.ar@gmail.com

@echo off
setlocal EnableDelayedExpansion

if exist "input.ini" (
	set line=1
	for /f "tokens=1*" %%i in (input.ini) do (
		if "!line!" equ "1" set "q1=%%i"
		if "!line!" equ "2" set "q2=%%i"
		if "!line!" equ "3" set "q3=%%i"
		set /a line+=1
	)
) else (
	set /p "q1=File to spoof (drag ^& drop) : "
	set /p "q2=Spoofed filename : "
	set /p "q3=Add '.' before extension? [y/n] : "
)

for /f "tokens=1*" %%i in ('echo !q1!') do (set "filename=%%~ni" & set "extension=%%~xi" & set "path_to_file=%%~dpi")
for /f "tokens=1,2* delims=." %%i in ('echo !q2!') do (set "spoofed_filename=%%i" & set "spoofed_extension=%%j")
if /i "%q3%" equ "y" (set "dot=.") else (if /i "%q3%" equ "1" (set "dot=."))

cls
(
	echo # Extension spoofer by hXR16F
	echo Params = ['%filename%', '%extension%', '%spoofed_filename%', '%spoofed_extension%', '%dot%', '%path_to_file%']
)
if exist "spoof.exe" (
	copy "spoof.exe" "%path_to_file%"
	pushD "%path_to_file%"
		spoof.exe "%filename%" "%extension%" "%spoofed_filename%" "%spoofed_extension%" "%dot%"
		del /f /q "spoof.exe"
	popD
) else (
	copy "spoof.py" "%path_to_file%"
	pushD "%path_to_file%"
		spoof.py "%filename%" "%extension%" "%spoofed_filename%" "%spoofed_extension%" "%dot%"
		del /f /q "spoof.py"
	popD
)
if exist "input.ini" del /f /q "input.ini"
start "" "spoof.vbs"
ping localhost -n 2 > nul 
exit



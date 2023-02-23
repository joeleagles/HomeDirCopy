@echo off

rem the powershell command is a compressed version of this script (cmd can't calculate values higher than 32 bit):

rem "$currentuser=$env:username

rem $TotalSize = (($FolderSizes = @(
rem "C:\users\$currentuser\Desktop"
rem "C:\users\$currentuser\Documents"
rem "C:\users\$currentuser\Downloads"
rem ) | ForEach{ [PSCustomObject]@{
rem     'Folder' = (Split-Path $_ -Leaf)
rem     'Size'   = ((Get-ChildItem $_ -File -Recurse) | Measure-Object Length -Sum).Sum
rem }}) | Measure-Object -Property Size -Sum).Sum

rem $FolderSizes | ForEach{
rem     '{0,-12}: {1,6:N2} GB' -f $_.Folder , ($_.Size / 1GB)
rem }
rem '{0,-12}: {1,6:N2} GB' -f 'Total Size' , ($TotalSize / 1GB)

rem exit

powershell.exe -NoExit -encodedCommand JABjAHUAcgByAGUAbgB0AHUAcwBlAHIAPQAkAGUAbgB2ADoAdQBzAGUAcgBuAGEAbQBlAA0ACgANAAoAJABUAG8AdABhAGwAUwBpAHoAZQAgAD0AIAAoACgAJABGAG8AbABkAGUAcgBTAGkAegBlAHMAIAA9ACAAQAAoAA0ACgAiAEMAOgBcAHUAcwBlAHIAcwBcACQAYwB1AHIAcgBlAG4AdAB1AHMAZQByAFwARABlAHMAawB0AG8AcAAiAA0ACgAiAEMAOgBcAHUAcwBlAHIAcwBcACQAYwB1AHIAcgBlAG4AdAB1AHMAZQByAFwARABvAGMAdQBtAGUAbgB0AHMAIgANAAoAIgBDADoAXAB1AHMAZQByAHMAXAAkAGMAdQByAHIAZQBuAHQAdQBzAGUAcgBcAEQAbwB3AG4AbABvAGEAZABzACIADQAKACkAIAB8ACAARgBvAHIARQBhAGMAaAB7ACAAWwBQAFMAQwB1AHMAdABvAG0ATwBiAGoAZQBjAHQAXQBAAHsADQAKACAAIAAgACAAJwBGAG8AbABkAGUAcgAnACAAPQAgACgAUwBwAGwAaQB0AC0AUABhAHQAaAAgACQAXwAgAC0ATABlAGEAZgApAA0ACgAgACAAIAAgACcAUwBpAHoAZQAnACAAIAAgAD0AIAAoACgARwBlAHQALQBDAGgAaQBsAGQASQB0AGUAbQAgACQAXwAgAC0ARgBpAGwAZQAgAC0AUgBlAGMAdQByAHMAZQApACAAfAAgAE0AZQBhAHMAdQByAGUALQBPAGIAagBlAGMAdAAgAEwAZQBuAGcAdABoACAALQBTAHUAbQApAC4AUwB1AG0ADQAKAH0AfQApACAAfAAgAE0AZQBhAHMAdQByAGUALQBPAGIAagBlAGMAdAAgAC0AUAByAG8AcABlAHIAdAB5ACAAUwBpAHoAZQAgAC0AUwB1AG0AKQAuAFMAdQBtAA0ACgANAAoAJABGAG8AbABkAGUAcgBTAGkAegBlAHMAIAB8ACAARgBvAHIARQBhAGMAaAB7AA0ACgAgACAAIAAgACcAewAwACwALQAxADIAfQA6ACAAewAxACwANgA6AE4AMgB9ACAARwBCACcAIAAtAGYAIAAkAF8ALgBGAG8AbABkAGUAcgAgACwAIAAoACQAXwAuAFMAaQB6AGUAIAAvACAAMQBHAEIAKQANAAoAfQANAAoAJwB7ADAALAAtADEAMgB9ADoAIAB7ADEALAA2ADoATgAyAH0AIABHAEIAJwAgAC0AZgAgACcAVABvAHQAYQBsACAAUwBpAHoAZQAnACAALAAgACgAJABUAG8AdABhAGwAUwBpAHoAZQAgAC8AIAAxAEcAQgApAA0ACgANAAoAZQB4AGkAdAA=

echo Would You Like to Copy all Directories?
:reprompt
echo a=Copy All    e=Exclude Downloads      n=Quit
set /p copyoption=

if "%copyoption%"=="a" (GOTO copyall)
if "%copyoption%"=="e" (GOTO copymost)
if "%copyoption%"=="n" (EXIT) else (GOTO reprompt)

:copyall
pushd "%~dp0"
robocopy c:\users\%username%\Desktop\ ".\Desktop" /E /Z /ZB /R:5 /W:5 /TBD /NP /V /MT:16
robocopy c:\users\%username%\Documents\ ".\Documents" /E /Z /ZB /R:5 /W:5 /TBD /NP /V /MT:16
robocopy c:\users\%username%\Downloads\ ".\Downloads" /E /Z /ZB /R:5 /W:5 /TBD /NP /V /MT:16
echo "file transfer complete, exit?"
pause
EXIT

:copymost
pushd "%~dp0"
robocopy c:\users\%username%\Desktop\ ".\Desktop" /E /Z /ZB /R:5 /W:5 /TBD /NP /V /MT:16
robocopy c:\users\%username%\Documents\ ".\Documents" /E /Z /ZB /R:5 /W:5 /TBD /NP /V /MT:16
echo "file transfer complete, exit?"
pause
EXIT
@echo off
echo Gebe den Ordner namen ein (keine Leerzeichen)
set /p foldername=""
IF EXIST %foldername% (
    echo Ordner exestiert, Suche nach Daten Struktur
    goto exists
)
:dontexists
md %foldername%
cd %foldername%
md %DATE:~-4%
cd %DATE:~-4%
goto struct
:exists
cd %foldername%
IF EXIST %DATE:~-4% (
    echo Ordner ist bereits erstellt und auf dem neusten stand
    powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; Add-Type -AssemblyName System.Drawing; $notify = New-Object System.Windows.Forms.NotifyIcon; $notify.Icon = [System.Drawing.SystemIcons]::Information; $notify.Visible = $true; $notify.ShowBalloonTip(0, 'System', 'Dieser Ordner exestiert bereits', [System.Windows.Forms.ToolTipIcon]::None)}"
    goto end
)
echo Neue Ordner Struktur gefundne!
md %DATE:~-4%
cd %DATE:~-4%
echo Ordner Struktur Hinzugefügt!
goto struct
:struct
md Januar
md Februar
md März
md April
md Mai
md Juni
md Juli
md August
md September
md Oktober
md November
md Dezember
:end

exit
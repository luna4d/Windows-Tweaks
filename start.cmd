CD %~dp0

REM REmove Reserved Storage
REG ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\ReserveManager /v ShippedWithReserves /t REG_DWORD /d 0 /f

REM Change Option Control Panel
REG ADD "HKCU\Control Panel\Mouse" /v DoubleClickSpeed /t REG_SZ /d "200" /f
REG ADD "HKCU\Control Panel\Keyboard" /v KeyboardDelay /t REG_SZ /d "0" /f
REG ADD "HKCU\Control Panel\Keyboard" /v KeyboardSpeed /t REG_SZ /d "31" /f

REM SLEEP OFF
powercfg /SETACVALUEINDEX 381b4222-f694-41f0-9685-ff5bb260df2e 238c9fa8-0aad-41ed-83f4-97be242c8f20 29f6c1db-86da-48c5-9fdb-f2b67b1f44da 0
REM HIBERNATE OFF
powercfg /HIBERNATE OFF
REM HDD saving
powercfg /SETACVALUEINDEX 381b4222-f694-41f0-9685-ff5bb260df2e 0012ee47-9041-4b5d-9b77-535fba8b1442 6738e2c4-e8a5-4a42-b16a-e040e769756e 0
REM PCIe SSD if unresponsive and requires a power cycle. (not for NVME)
powercfg /SETACVALUEINDEX 381b4222-f694-41f0-9685-ff5bb260df2e 501a4d13-42af-4429-9fd1-a8218c268e20 ee12f906-d277-404b-b6da-e5fa1a576df5 0

REM Change Group Policy Auto Update system restart
REM REG ADD HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU /v AUOptions /t REG_DWORD /d 3 /f
REG ADD HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU /v NoAutoUpdate /t REG_DWORD /d 0 /f
REG ADD HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU /v ScheduledInstallDay /t REG_DWORD /d 0 /f
REG ADD HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU /v ScheduledInstallTime /t REG_DWORD /d 3 /f
REG ADD HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU /v NoAutoRebootWithLoggedOnUsers /t REG_DWORD /d 1 /f

REM gpupdate /force

REM Theme optimize
REG ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects /v VisualFXSetting /t REG_DWORD /d 3 /f
REG ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v TaskbarAnimations /t REG_DWORD /d 0 /f
REG ADD "HKCU\Control Panel\Desktop\WindowMetrics" /v MinAnimate /t REG_SZ /d "0" /f
REG ADD "HKCU\Control Panel\Desktop" /v FontSmoothing /t REG_SZ /d "0" /f
REG ADD "HKCU\Control Panel\Desktop" /v UserPreferencesMask /t REG_BINARY /d "9012028010000000" /f

REM 2:DEFAULT
REM 0x16:FORGROUND-L 0x14:BACKGROUND-L 0x18:BALANCE-L
REM 0x26:FORGROUND-S 0x24:BACKGROUND-S 0x28:BALANCE-S
REM 0x1A:Long Fixed 3:1 0x19:Long Fixed 2:1 0x18:Long Fixed 1:1
REG ADD HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\PriorityControl /v Win32PrioritySeparation /t REG_DWORD /d 0x1A /f

REM Service disable
sc config lfsvc start=disabled
sc stop lfsvc
sc config DiagTrack start=disabled
sc stop DiagTrack
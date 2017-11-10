CD %~dp0

#Install RDP Wrapper
START /B /D bin\RDPWrap-v1.6.1 RDPWInst.exe -i -o

#Change Option Control Panel
REG ADD HKCU\Control Panel\Mouse /v DoubleClickSpeed /t REG_SZ /d 100 /f
REG ADD HKCU\Control Panel\Keyboard /v KeyboardDelay /t REG_SZ /d 0 /f
REG ADD HKCU\Control Panel\Keyboard /v KeyboardSpeed /t REG_SZ /d 31 /f

#HDD saving
powercfg /setacvalueindex SCHEME_CURRENT 381b4222-f694-41f0-9685-ff5bb260df2e 6738e2c4-e8a5-4a42-b16a-e040e769756e 0
PCIe SSD if unresponsive and requires a power cycle. (not for NVME)
powercfg /setacvalueindex SCHEME_CURRENT 501a4d13-42af-4429-9fd1-a8218c268e20 ee12f906-d277-404b-b6da-e5fa1a576df5 0

#Change Group Policy Auto Update system restart
REG ADD HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU /v AUOptions /t REG_DWORD /d 3 /f
REG ADD HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU /v NoAutoUpdate /t REG_DWORD /d 0 /f
REG ADD HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU /v ScheduledInstallDay /t REG_DWORD /d 0 /f
REG ADD HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU /v ScheduledInstallTime /t REG_DWORD /d 3 /f
REG ADD HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU /v NoAutoRebootWithLoggedOnUsers /t REG_DWORD /d 1 /f

#gpupdate /force



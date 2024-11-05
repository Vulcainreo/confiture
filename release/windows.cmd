Systeminfo > "System.Systeminfo.txt"

Systeminfo > "System.Systeminfo.txt"
wmic COMPUTERSYSTEM list FULL > "System.wmic.computersystem.txt"
wmic QFE > "System.wmic.qfe.txt"


whoami /ALL > "User.whoami.txt"
secedit /export /CFG "Policy.secedit.export.txt"

secedit /export /CFG "Policy.secedit.export.txt"


gpresult /z /scope computer > "Policy.gpresult.txt"

net user > "Users.net_user.txt"
net localgroup > "Users.net_localgroup.txt"

netstat -an  > "Network.netstat.txt"
nbtstat -a %COMPUTERNAME% > "Network.nbtstat.txt"
ipconfig /all > "Network.ipconfig.txt"
route print > "Network.route.print.txt"
netsh dump > "Network.netsh.txt"

Get-SmbShare | ForEach-Object { [PSCustomObject]@{Name=$_.Name;Path=$_.Path;Description=$_.Description;ScopeName=$_.ScopeName;CurrentUserAccess=$_.CurrentUserAccess;ShareState=$_.ShareState;UserRights=(Get-SmbShareAccess -Name $_.Name | Select-Object @{Name="AccountName";Expression={$_.AccountName}},AccessControlType)}} > "Shares.wmic.share.txt"


reg export "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services" "Reg.HKLM.Services.dump.txt"
reg export "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" "Reg.HKLM.Control.dump.txt"
reg export "HKEY_LOCAL_MACHINE\SOFTWARE" "Reg.HKLM.Software.dump.txt"

wmic PROCESS list full >  "Processus.wmic.process.txt"
wmic SERVICE list FULL > "Services.wmic.service.txt"

schtasks /query /v > "Tasks.schtasks.txt"
wmic JOB list FULL > "Tasks.wmic.job.txt"
at > "Tasks.at.txt"



netsh advfirewall firewall show rule name=all > "Network.netsh.rules.txt"


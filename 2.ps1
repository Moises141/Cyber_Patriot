$Button21_Click = {info}
function info{
 cmd /c msinfo32.exe
}
$Button20_Click = {Defender}
Function Defender{
#Enables windows Defender
Set-MpPreference -DisableRealtimeMonitoring 0
}

$Button19_MouseClick = {Link1}
function Link1{
 Start-Process https://sites.google.com/view/cyber-archive/home?authuser=0
}

$Button18_Click = {Link2}
function link2{
Start-Process https://www.virustotal.com/gui/home/upload
}

$Button9_Click = {Find}
Function Find{
Winget install -e --id AntibodySoftware.WizTree
}

$Button14_Click = {ListUsers}
function ListUsers{
cmd /c net users| Out-File C:\Users\Public\Desktop\Users_list.txt
}

$Button5_Click = {weak}
function Weak{
REM Weak Services
dism /online /disable-feature /featurename:IIS-WebServerRole
dism /online /disable-feature /featurename:IIS-WebServer
dism /online /disable-feature /featurename:IIS-CommonHttpFeatures
dism /online /disable-feature /featurename:IIS-HttpErrors
dism /online /disable-feature /featurename:IIS-HttpRedirect
dism /online /disable-feature /featurename:IIS-ApplicationDevelopment
dism /online /disable-feature /featurename:IIS-NetFxExtensibility
dism /online /disable-feature /featurename:IIS-NetFxExtensibility45
dism /online /disable-feature /featurename:IIS-HealthAndDiagnostics
dism /online /disable-feature /featurename:IIS-HttpLogging
dism /online /disable-feature /featurename:IIS-LoggingLibraries
dism /online /disable-feature /featurename:IIS-RequestMonitor
dism /online /disable-feature /featurename:IIS-HttpTracing
dism /online /disable-feature /featurename:IIS-Security
dism /online /disable-feature /featurename:IIS-URLAuthorization
dism /online /disable-feature /featurename:IIS-RequestFiltering
dism /online /disable-feature /featurename:IIS-IPSecurity
dism /online /disable-feature /featurename:IIS-Performance
dism /online /disable-feature /featurename:IIS-HttpCompressionDynamic
dism /online /disable-feature /featurename:IIS-WebServerManagementTools
dism /online /disable-feature /featurename:IIS-ManagementScriptingTools
dism /online /disable-feature /featurename:IIS-IIS6ManagementCompatibility
dism /online /disable-feature /featurename:IIS-Metabase
dism /online /disable-feature /featurename:IIS-HostableWebCore
dism /online /disable-feature /featurename:IIS-StaticContent
dism /online /disable-feature /featurename:IIS-DefaultDocument
dism /online /disable-feature /featurename:IIS-DirectoryBrowsing
dism /online /disable-feature /featurename:IIS-WebDAV
dism /online /disable-feature /featurename:IIS-WebSockets
dism /online /disable-feature /featurename:IIS-ApplicationInit
dism /online /disable-feature /featurename:IIS-ASPNET
dism /online /disable-feature /featurename:IIS-ASPNET45
dism /online /disable-feature /featurename:IIS-ASP
dism /online /disable-feature /featurename:IIS-CGI
dism /online /disable-feature /featurename:IIS-ISAPIExtensions
dism /online /disable-feature /featurename:IIS-ISAPIFilter
dism /online /disable-feature /featurename:IIS-ServerSideIncludes
dism /online /disable-feature /featurename:IIS-CustomLogging
dism /online /disable-feature /featurename:IIS-BasicAuthentication
dism /online /disable-feature /featurename:IIS-HttpCompressionStatic
dism /online /disable-feature /featurename:IIS-ManagementConsole
dism /online /disable-feature /featurename:IIS-ManagementService
dism /online /disable-feature /featurename:IIS-WMICompatibility
dism /online /disable-feature /featurename:IIS-LegacyScripts
dism /online /disable-feature /featurename:IIS-LegacySnapIn
dism /online /disable-feature /featurename:IIS-FTPServer
dism /online /disable-feature /featurename:IIS-FTPSvc
dism /online /disable-feature /featurename:IIS-FTPExtensibility
dism /online /disable-feature /featurename:TFTP
dism /online /disable-feature /featurename:TelnetClient
dism /online /disable-feature /featurename:TelnetServer
REM SMB Passwords unencrypted to third party? How bout nah
reg ADD HKLM\SYSTEM\CurrentControlSet\services\LanmanWorkstation\Parameters /v EnablePlainTextPassword /t REG_DWORD /d 0 /f
REM Remotely accessible registry paths cleared
reg ADD HKLM\SYSTEM\CurrentControlSet\Control\SecurePipeServers\winreg\AllowedExactPaths /v Machine /t REG_MULTI_SZ /d "" /f
REM Remotely accessible registry paths and sub-paths cleared
reg ADD HKLM\SYSTEM\CurrentControlSet\Control\SecurePipeServers\winreg\AllowedPaths /v Machine /t REG_MULTI_SZ /d "" /f
REM Restict anonymous access to named pipes and shares
reg ADD HKLM\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters /v NullSessionShares /t REG_MULTI_SZ /d "" /f
REM Restrict CD ROM drive
reg ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v AllocateCDRoms /t REG_DWORD /d 1 /f
REM Disallow remote access to floppie disks
reg ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v AllocateFloppies /t REG_DWORD /d 1 /f
REM Prevent print driver installs 
reg ADD "HKLM\SYSTEM\CurrentControlSet\Control\Print\Providers\LanMan Print Services\Servers" /v AddPrinterDrivers /t REG_DWORD /d 1 /f
REM Limit local account use of blank passwords to console
reg ADD "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v LimitBlankPasswordUse /t REG_DWORD /d 1 /f
REM Maximum Machine Password Age
reg ADD HKLM\SYSTEM\CurrentControlSet\services\Netlogon\Parameters /v MaximumPasswordAge /t REG_DWORD /d 15 /f
REM Require Security Signature
reg ADD HKLM\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters /v enablesecuritysignature /t REG_DWORD /d 0 /f 
REM Enable Security Signature
reg ADD HKLM\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters /v requiresecuritysignature /t REG_DWORD /d 0 /f 
}
$Button8_Click = {Rootkit}
function Rootkit{
powershell Invoke-WebRequest -OutFile MBRTKit.exe https://data-cdn.mbamupdates.com/web/mbar-1.10.3.1001.exe
MBRTKit.exe
}
$Button4_Click = {Update}
function Update{
REM Windows auomatic updates
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" /v AUOptions /t REG_DWORD /d 3 /f
}

$Button17_Click = {PortMaster}
function PortMaster{
winget install -e --id Safing.Portmaster
}

$Button16_Click = {Notepad}
function Notepad{
winget install -e --id Notepad++.Notepad++
}

$Button11_Click = {Bitdefender}
function Bitdefender{
winget install -e --id Bitdefender.Bitdefender
}
$Button10_Click = {Brave}
function Brave{
winget install -e --id BraveSoftware.BraveBrowser
}

$Button15_Click = {List}
function list{
cmd /c Taskmgr.exe
}

$Button3_Click = {Remote}
function Remote {
REM No Remote Desktop
cmd /c reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 1 /f 
cmd /c reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" /v UserAuthentication /t REG_DWORD /d 0 /f
}
$Button12_Click = {Networks}
function Networks {
	cmd /c ncpa.cpl
}

$Button13_Click = {ListProgams}
function ListProgams {
    cmd /c appwiz.cpl
}

$Button7_Click = {Scan}
function Scan{
Sfc.exe /scannow
}

$TextBox4_TextChanged = {
}
$Button6_Click = {Password}
function Password{
REM Passwords must be 10 digits
net accounts /minpwlen:10
REM Passwords must be changed every 30 days
net accounts /maxpwage:30
REM Passwords can only be changed after 5 day has passed
net accounts /minpwage:5
REM Display current password policy
}

$TextBox1_TextChanged = {
}
$Button2_Click = {Guest}
function Guest{
cmd /c net user guest /active:no
}

$Button1_Click = {Firewall}
function Firewall{
	Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled True
}

Add-Type -AssemblyName System.Windows.Forms
. (Join-Path $PSScriptRoot '2.designer.ps1')
$Form1.ShowDialog()
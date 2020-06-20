<#
.SYNOPSIS
    Quick description of this script

.DESCRIPTION
    Longer description of what this script does

.PARAMETER FirstNumber
    This parameter does blablabla

.PARAMETER CheckVersion
    This parameter will just dump the script current version.

.INPUTS
    None. You cannot pipe objects to that script.

.OUTPUTS
    None for now

.EXAMPLE
.\Do-Something.ps1
This will launch the script and do someting

.EXAMPLE
.\Do-Something.ps1 -CheckVersion
This will dump the script name and current version like :
SCRIPT NAME : Do-Something.ps1
VERSION : v1.0

.NOTES
None

.LINK
    https://www.blackhillsinfosec.com/poking-holes-in-the-firewall-egress-testing-with-allports-exposed/

.LINK
    https://www.sans.org/blog/pen-test-poster-white-board-powershell-built-in-port-scanner/
#>
[CmdLetBinding(DefaultParameterSetName = "NormalRun")]
Param(
    [Parameter(Mandatory = $False, Position = 1, ParameterSetName = "NormalRun")][ValidateRange(1,65535)][int]$StartPort = 1,
    [Parameter(Mandatory = $False, Position = 2, ParameterSetName = "NormalRun")][ValidateRange(1,65535)][int]$EndPort = 1024,
    [Parameter(Mandatory = $false, Position = 3, ParameterSetName = "CheckOnly")][switch]$CheckVersion
)

<# ------- SCRIPT_HEADER (Only Get-Help comments and Param() above this point) ------- #>
#Initializing a $Stopwatch variable to use to measure script execution
$stopwatch = [system.diagnostics.stopwatch]::StartNew()
#Using Write-Debug and playing with $DebugPreference -> "Continue" will output whatever you put on Write-Debug "Your text/values"
# and "SilentlyContinue" will output nothing on Write-Debug "Your text/values"
$DebugPreference = "Continue"
# Set Error Action to your needs
$ErrorActionPreference = "SilentlyContinue"
#Script Version
$ScriptVersion = "0.1"
<# Version changes
v0.1 : first script version
v0.1 -> v0.5 : 
#>
$ScriptName = $MyInvocation.MyCommand.Name
If ($CheckVersion) {Write-Host "SCRIPT NAME     : $ScriptName `nSCRIPT VERSION  : $ScriptVersion";exit}
# Log or report file definition
$UserDocumentsFolder = "$($env:Userprofile)\Documents"
$OutputReport = "$UserDocumentsFolder\$($ScriptName)_Output_$(get-date -f yyyy-MM-dd-hh-mm-ss).csv"
# Other Option for Log or report file definition (use one of these)
$ScriptLog = "$UserDocumentsFolder\$($ScriptName)_Logging_$(Get-Date -Format 'dd-MMMM-yyyy-hh-mm-ss-tt').txt"
<# ---------------------------- /SCRIPT_HEADER ---------------------------- #>
<# -------------------------- DECLARATIONS -------------------------- #>
$ObjColl = @()
$Counter = 0
<# /DECLARATIONS #>
<# -------------------------- FUNCTIONS -------------------------- #>

<# /FUNCTIONS #>
<# -------------------------- EXECUTIONS -------------------------- #>
$StartPort..$EndPort | ForEach-Object {
    $Counter++
    write-progress -Activity "scanning ports of the local machine..." -Status "Scanning port $_" -PercentComplete ($Counter/1024*100)
    $Test = New-Object System.Net.Sockets.TcpClient
    $wait = $test.BeginConnect("AllPorts.exposed",$_,$null,$null)
    ($wait.AsyncWAitHandle.waitone(250,$false))
    if($Test.Connected){
    $ObjColl += New-Object PSObject -property @{
        Port = $_
        Status = "Connected"
    }
       # write-host "$_ opened"
    } else {
    $ObjColl += New-Object PSObject -property @{
            Port = $_
            Status = "closed"
      }
       # write-host "$_ closed"
    }
} | Out-Null

$ObjColl | Export-CSV $OutputReport -NoTypeInformation
Notepad $OutputReport
<# /EXECUTIONS #>
<# -------------------------- CLEANUP VARIABLES -------------------------- #>

<# /CLEANUP VARIABLES#>
<# ---------------------------- SCRIPT_FOOTER ---------------------------- #>
#Stopping StopWatch and report total elapsed time (TotalSeconds, TotalMilliseconds, TotalMinutes, etc...
$stopwatch.Stop()
$msg = "`n`nThe script took $([math]::round($($StopWatch.Elapsed.TotalSeconds),2)) seconds to execute..."
Write-Host $msg
$msg = $null
$StopWatch = $null
<# ---------------- /SCRIPT_FOOTER (NOTHING BEYOND THIS POINT) ----------- #>

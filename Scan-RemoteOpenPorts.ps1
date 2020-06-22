[CmdLetBinding(DefaultParameterSetName = "NormalRun")]
Param(
    [Parameter(Mandatory = $False, Position = 1, ParameterSetName = "NormalRun")][ValidateRange(1,65535)][int[]]$PortCollection = @(80, 443, 53),
    [Parameter(Mandatory = $false, Position = 2, ParameterSetName = "NormalRun")][string[]]$Hosts= @("192.168.1.1"),
    [Parameter(Mandatory = $false, Position = 3, ParameterSetName = "CheckOnly")][switch]$CheckVersion
)

#region Version Check
$ScriptVersion = "0.1"
$ScriptName = $MyInvocation.MyCommand.Name
If ($CheckVersion) {Write-Host "SCRIPT NAME     : $ScriptName `nSCRIPT VERSION  : $ScriptVersion";exit}
#Endregion

Foreach ($Item in $Hosts) {
    write-host "--------"
    Write-host "$Item"
    Foreach ($Port in $PortCollection) {
        Write-Host "Testing port $Port"
        $Connection = New-Object Net.Sockets.TcpClient
        Try {
            $Connection.Connect($Item,$Port)
            Write-Output "Port $Port is OPEN"
        } Catch {
            Write-Output "Port $Port if CLOSED"
        }
    }
}


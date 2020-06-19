$Stopwatch = New-Object System.Diagnostics.Stopwatch
$Stopwatch.Start()

$ObjColl = @()


$Counter = 0

1..1024 | % {
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

$ObjColl | Out-GridView

$Stopwatch.Stop()
Write-Host "The script took $($Stopwatch.Elapsed.Seconds) to execute"
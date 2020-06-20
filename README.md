# Scan-LocalOpenedPorts

Just a script that scans by default opened Network ports 1 to 1024 on the machine where it's executed.

Use -StartPort and -EndPort to define which ports to scan. Maximum is 65535 and minimum is 0...

# Help dump


NAME

    .\Scan-LocalOpenedPorts\Scan-LocalOpenedPorts.ps1
    
SYNOPSIS

    This script will scan all ports (default 1 to 1024, u can go up to 65535) on the local machine
    and show which ones are opened and which are closed. Results will be stored in a file in the
    user's document folder.
    
    
SYNTAX

    .\Scan-LocalOpenedPorts\Scan-LocalOpenedPorts.ps1 [[-StartPort] <Int32>] [[-EndPort] <Int32>] 
    [<CommonParameters>]
    
    .\Scan-LocalOpenedPorts\Scan-LocalOpenedPorts.ps1 [[-CheckVersion]] [<CommonParameters>]
    
    
DESCRIPTION

    Nothing more to say than what's in the Synopsis for now...
    

PARAMETERS

    -StartPort <Int32>
        Which port we start to scan
        
        Required?                    false
        Position?                    2
        Default value                1
        Accept pipeline input?       false
        Accept wildcard characters?  false
        
    -EndPort <Int32>
        Until which port we scan
        
        Required?                    false
        Position?                    3
        Default value                1024
        Accept pipeline input?       false
        Accept wildcard characters?  false
        
    -CheckVersion [<SwitchParameter>]
        This parameter will just dump the script current version.
        
        Required?                    false
        Position?                    4
        Default value                False
        Accept pipeline input?       false
        Accept wildcard characters?  false
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see 
        about_CommonParameters (https:/go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS

    None. You cannot pipe objects to that script.
    
    
OUTPUTS

    a CSV file containing the ports number and the status of each port
    
    
NOTES
    
    
        None
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS C:\>.\Scan-LocalOpenedPorts.ps1
    
    This will scan ports 1 to 1024 and get the status of each port (closde or opened)
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS C:\>.\Scan-LocalOpenedPorts.ps1 -StartPort 10 -EndPort 250
    
    This will scan ports from 10 to 250 and get the status of each port (closed or opened)
    
    
    
    
    -------------------------- EXAMPLE 3 --------------------------
    
    PS C:\>.\Do-Something.ps1 -CheckVersion
    
    This will dump the script name and current version like :
    SCRIPT NAME : Do-Something.ps1
    VERSION : v1.0
    
    
    
    
    
RELATED LINKS

    https://www.blackhillsinfosec.com/poking-holes-in-the-firewall-egress-testing-with-allports-exposed/
    https://www.sans.org/blog/pen-test-poster-white-board-powershell-built-in-port-scanner/




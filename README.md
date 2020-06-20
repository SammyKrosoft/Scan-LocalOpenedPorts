# Scan-LocalOpenedPorts

Just a script that scans by default opened Network ports 1 to 1024 on the machine where it's executed.

Use -StartPort and -EndPort to define which ports to scan. Maximum is 65535 and minimum is 0...

# Help dump

Get-Help Scan-LocalOpenePorts.ps1 -Full



NOM
    C:\Users\Yelosubmarine\OneDrive\_Boulot\Documents\GitHub Repositories\Scan-LocalOpenedPorts\Scan-LocalOpenedPorts.ps1
    
RÉSUMÉ
    This script will scan all ports (default 1 to 1024, u can go up to 65535) on the local machine
    and show which ones are opened and which are closed. Results will be stored in a file in the
    user's document folder.
    
    
SYNTAXE
    C:\Users\Yelosubmarine\OneDrive\_Boulot\Documents\GitHub Repositories\Scan-LocalOpenedPorts\Scan-LocalOpenedPorts.ps1 [[-StartPort] <Int32>] [[-EndPort] <Int32>] [<CommonParameters>]
    
    C:\Users\Yelosubmarine\OneDrive\_Boulot\Documents\GitHub Repositories\Scan-LocalOpenedPorts\Scan-LocalOpenedPorts.ps1 [[-CheckVersion]] [<CommonParameters>]
    
    
DESCRIPTION
    Nothing more to say than what's in the Synopsis for now...
    

PARAMÈTRES
    -StartPort <Int32>
        Which port we start to scan
        
        Obligatoire ?                false
        Position ?                   2
        Valeur par défaut                     1
        Accepter l'entrée de pipeline ?       false
        Accepter les caractères génériques ?  false
        
    -EndPort <Int32>
        Until which port we scan
        
        Obligatoire ?                false
        Position ?                   3
        Valeur par défaut                     1024
        Accepter l'entrée de pipeline ?       false
        Accepter les caractères génériques ?  false
        
    -CheckVersion [<SwitchParameter>]
        This parameter will just dump the script current version.
        
        Obligatoire ?                false
        Position ?                   4
        Valeur par défaut                     False
        Accepter l'entrée de pipeline ?       false
        Accepter les caractères génériques ?  false
        
    <CommonParameters>
        Cette applet de commande prend en charge les paramètres courants : Verbose, Debug,
     ErrorAction, ErrorVariable, WarningAction, WarningVariable,
     OutBuffer, PipelineVariable et OutVariable. Pour plus d’informations, voir
     about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
ENTRÉES
    None. You cannot pipe objects to that script.
    
    
SORTIES
    a CSV file containing the ports number and the status of each port
    
    
NOTES
    
    
        None
    
    -------------------------- EXEMPLE 1 --------------------------
    
    PS C:\>.\Scan-LocalOpenedPorts.ps1
    
    This will scan ports 1 to 1024 and get the status of each port (closde or opened)
    
    
    
    
    -------------------------- EXEMPLE 2 --------------------------
    
    PS C:\>.\Scan-LocalOpenedPorts.ps1 -StartPort 10 -EndPort 250
    
    This will scan ports from 10 to 250 and get the status of each port (closed or opened)
    
    
    
    
    -------------------------- EXEMPLE 3 --------------------------
    
    PS C:\>.\Do-Something.ps1 -CheckVersion
    
    This will dump the script name and current version like :
    SCRIPT NAME : Do-Something.ps1
    VERSION : v1.0
    
    
    
    
    
LIENS CONNEXES
    https://www.blackhillsinfosec.com/poking-holes-in-the-firewall-egress-testing-with-allports-exposed/
    https://www.sans.org/blog/pen-test-poster-white-board-powershell-built-in-port-scanner/




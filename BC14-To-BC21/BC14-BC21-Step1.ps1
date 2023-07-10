#Import Module
Import-Module 'C:\Program Files\Microsoft Dynamics 365 Business Central\140\Service\NavAdminTool.ps1'

#Uninstall Extensions from BC 14
Get-NAVAppInfo -ServerInstance BC140 -Tenant default | % { Uninstall-NAVApp -ServerInstance BC140 -Tenant default -Name $_.Name -Version $_.Version -Force}

#Unpublish Extensions from BC 14
Get-NAVAppInfo -ServerInstance BC140 | % { Unpublish-NAVApp -ServerInstance BC140 -Name $_.Name -Version $_.Version }

#Remove Symbols
Get-NAVAppInfo -ServerInstance BC140 -SymbolsOnly | % { Unpublish-NAVApp -ServerInstance BC140 -Name $_.Name -Version $_.Version }

#Stop Service
Stop-NAVServerInstance -ServerInstance BC140

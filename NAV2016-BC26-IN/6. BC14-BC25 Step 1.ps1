########################################################################
#Author : Saurav Dhyani
#Date   : 11-05-2025
#Purpose: Execute Step 1 of BC Upgrade
#Steps  : 
#1. Replace $ServerInstance Parameter Below with your Old BC Server Instance Name (Service Name).
########################################################################

$ServerInstance = "BC140"

Import-Module 'C:\Program Files\Microsoft Dynamics 365 Business Central\140\Service\NavAdminTool.ps1'

#Uninstall all extensions from the tenants.
Get-NAVAppInfo -ServerInstance $ServerInstance -Tenant default| % { Uninstall-NAVApp -ServerInstance $ServerInstance -Tenant default -Name $_.Name -Version $_.Version -Force}

#Unpublish all extensions from the application server instance
Get-NAVAppInfo -ServerInstance $ServerInstance | % { Unpublish-NAVApp -ServerInstance $ServerInstance -Name $_.Name -Version $_.Version }

#Unpublish all system, test, and application symbols.
Get-NAVAppInfo -ServerInstance $ServerInstance -SymbolsOnly | % { Unpublish-NAVApp -ServerInstance $ServerInstance -Name $_.Name -Version $_.Version }

#Stop Service
Stop-NAVServerInstance -ServerInstance $ServerInstance

#Clear references to .flf license, if used by the database.
#UPDATE [master].[dbo].[$ndo$srvproperty] SET [license] = null
#UPDATE [<app database name>].[dbo].[$ndo$dbproperty] SET [license] = null
#UPDATE [<tenant database name>].[dbo].[$ndo$tenantproperty] SET [license] = null

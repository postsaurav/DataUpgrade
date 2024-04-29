########################################################################
#Author : Saurav Dhyani
#Date   : 27-04-2024
#Purpose: Execute Step 1 of BC Upgrade
#Steps  : 
#1. Replace $ServerInstance Parameter Below with your Old BC Server Instance Name (Service Name).
########################################################################

$ServerInstance = "BC220"

#Import Module
Import-Module 'C:\Program Files\Microsoft Dynamics 365 Business Central\220\Service\NavAdminTool.ps1'

#Uninstall Extensions from BC 22
Get-NAVAppInfo -ServerInstance $ServerInstance -Tenant default | % { Uninstall-NAVApp -ServerInstance $ServerInstance -Tenant default -Name $_.Name -Version $_.Version -Force}

#Unpublish Extensions from BC 22
Get-NAVAppInfo -ServerInstance $ServerInstance | % { Unpublish-NAVApp -ServerInstance $ServerInstance -Name $_.Name -Version $_.Version }

#Remove Symbols
Get-NAVAppInfo -ServerInstance $ServerInstance -SymbolsOnly | % { Unpublish-NAVApp -ServerInstance $ServerInstance -Name $_.Name -Version $_.Version }

#Stop Service
Stop-NAVServerInstance -ServerInstance $ServerInstance
﻿﻿########################################################################
#Author : Saurav Dhyani
#Date   : 19-11-2025
#Purpose: Execute Step 1 of BC Upgrade
#Steps  : 
#1. Replace BC260 Parameter Below with your Old BC Server Instance Name (Service Name).
########################################################################

#Import Module
Import-Module 'C:\Program Files\Microsoft Dynamics 365 Business Central\260\Service\NavAdminTool.ps1'

#Uninstall Extensions from BC 26
Get-NAVAppInfo -ServerInstance BC260 -Tenant default | % { Uninstall-NAVApp -ServerInstance BC260 -Tenant default -Name $_.Name -Version $_.Version -Force}

#Unpublish Extensions from BC 26
Get-NAVAppInfo -ServerInstance BC260 | % { Unpublish-NAVApp -ServerInstance BC260 -Name $_.Name -Version $_.Version}

#Remove Symbols
Get-NAVAppInfo -ServerInstance BC260 -SymbolsOnly | % { Unpublish-NAVApp -ServerInstance BC260 -Name $_.Name -Version $_.Version }

#Stop Service
Stop-NAVServerInstance -ServerInstance BC260
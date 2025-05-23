﻿#﻿########################################################################
#Author : Saurav Dhyani
#Date   : 02-02-2025
#Purpose: Execute Step 1 of BC Upgrade
#Steps  : 
#1. Replace BC200 Parameter Below with your Old BC Server Instance Name (Service Name).
########################################################################

#Import Module
Import-Module 'C:\Program Files\Microsoft Dynamics 365 Business Central\200\Service\NavAdminTool.ps1'

#Uninstall Extensions from Previous Version
Get-NAVAppInfo -ServerInstance BC200 -Tenant default | % { Uninstall-NAVApp -ServerInstance BC200 -Tenant default -Name $_.Name -Version $_.Version -Force}

#Unpublish Extensions from Previous Version
Get-NAVAppInfo -ServerInstance BC200 | % { Unpublish-NAVApp -ServerInstance BC200 -Name $_.Name -Version $_.Version}

#Remove Symbols
Get-NAVAppInfo -ServerInstance BC200 -SymbolsOnly | % { Unpublish-NAVApp -ServerInstance BC200 -Name $_.Name -Version $_.Version }

#Stop Service
Stop-NAVServerInstance -ServerInstance BC200
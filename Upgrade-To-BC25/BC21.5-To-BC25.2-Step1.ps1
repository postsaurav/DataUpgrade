﻿########################################################################
#Author : Saurav Dhyani
#Date   : 28-01-2025
#Purpose: Execute Step 1 of BC Upgrade
#Steps  : 
#1. Replace BC210 Parameter Below with your Old BC Server Instance Name (Service Name).
########################################################################

#Import Module
Import-Module 'C:\Program Files\Microsoft Dynamics 365 Business Central\210\Service\NavAdminTool.ps1'

#Uninstall Extensions from BC 21
Get-NAVAppInfo -ServerInstance BC210 -Tenant default | % { Uninstall-NAVApp -ServerInstance BC210 -Tenant default -Name $_.Name -Version $_.Version -Force}

#Unpublish Extensions from BC 21
Get-NAVAppInfo -ServerInstance BC210 | % { Unpublish-NAVApp -ServerInstance BC210 -Name $_.Name -Version $_.Version}

#Remove Symbols
Get-NAVAppInfo -ServerInstance BC210 -SymbolsOnly | % { Unpublish-NAVApp -ServerInstance BC210 -Name $_.Name -Version $_.Version }

#Stop Service
Stop-NAVServerInstance -ServerInstance BC210
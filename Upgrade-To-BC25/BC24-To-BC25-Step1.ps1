﻿########################################################################
#Author : Saurav Dhyani
#Date   : 23-12-2024
#Purpose: Execute Step 1 of BC Upgrade
#Steps  : 
#1. Replace BC240 Parameter Below with your Old BC Server Instance Name (Service Name).
########################################################################

#Import Module
Import-Module 'C:\Program Files\Microsoft Dynamics 365 Business Central\240\Service\NavAdminTool.ps1'

#Uninstall Extensions from BC 24
Get-NAVAppInfo -ServerInstance BC240 -Tenant default | % { Uninstall-NAVApp -ServerInstance BC240 -Tenant default -Name $_.Name -Version $_.Version -Force}

#Unpublish Extensions from BC 24
Get-NAVAppInfo -ServerInstance BC240 | % { Unpublish-NAVApp -ServerInstance BC240 -Name $_.Name -Version $_.Version}

#Remove Symbols
Get-NAVAppInfo -ServerInstance BC240 -SymbolsOnly | % { Unpublish-NAVApp -ServerInstance BC240 -Name $_.Name -Version $_.Version }

#Stop Service
Stop-NAVServerInstance -ServerInstance BC240
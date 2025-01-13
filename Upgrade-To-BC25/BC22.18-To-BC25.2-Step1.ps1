﻿########################################################################
#Author : Saurav Dhyani
#Date   : 13-01-2025
#Purpose: Execute Step 1 of BC Upgrade
#Steps  : 
#1. Replace BC220 Parameter Below with your Old BC Server Instance Name (Service Name).
########################################################################

#Import Module
Import-Module 'C:\Program Files\Microsoft Dynamics 365 Business Central\220\Service\NavAdminTool.ps1'

#Uninstall Extensions from BC 22
Get-NAVAppInfo -ServerInstance BC220 -Tenant default | % { Uninstall-NAVApp -ServerInstance BC220 -Tenant default -Name $_.Name -Version $_.Version -Force}

#Unpublish Extensions from BC 22
Get-NAVAppInfo -ServerInstance BC220 | % { Unpublish-NAVApp -ServerInstance BC220 -Name $_.Name -Version $_.Version}

#Remove Symbols
Get-NAVAppInfo -ServerInstance BC220 -SymbolsOnly | % { Unpublish-NAVApp -ServerInstance BC220 -Name $_.Name -Version $_.Version }

#Stop Service
Stop-NAVServerInstance -ServerInstance BC220
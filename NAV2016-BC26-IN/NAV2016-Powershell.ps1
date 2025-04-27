#Import-Module
Import-module 'C:\Program Files\Microsoft Dynamics NAV\90\Service\NavAdminTool.ps1'

#Sync-navtenant
Sync-NAVTenant -ServerInstance DynamicsNAV90 -Mode Sync

#Get Company
Get-NAVCompany -ServerInstance DynamicsNAV90

#Copy Company
Copy-NAVCompany -ServerInstance DynamicsNAV90 -SourceCompanyName "CRONUS India Ltd." -DestinationCompanyName "MOCK"
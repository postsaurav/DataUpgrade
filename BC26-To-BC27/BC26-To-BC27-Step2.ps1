﻿########################################################################
#Author : Saurav Dhyani
#Date   : 19-11-2025
#Purpose: Execute Step 2 of BC Upgrade
########################################################################


#Import Module
Import-Module 'C:\Program Files\Microsoft Dynamics 365 Business Central\270\Service\NavAdminTool.ps1'

#Convert the application database to version 27
Invoke-NAVApplicationDatabaseConversion -DatabaseServer localhost -DatabaseName Upgrade-26-To-27-US

#Configure version 27 server for DestinationAppsForMigration
Set-NAVServerConfiguration -ServerInstance BC270 -KeyName DatabaseServer -KeyValue localhost
#Set-NAVServerConfiguration -ServerInstance BC270 -KeyName DatabaseInstance -KeyValue 
Set-NAVServerConfiguration -ServerInstance BC270 -KeyName DatabaseName -KeyValue Upgrade-26-To-27-US
Set-NavServerConfiguration -ServerInstance BC270 -KeyName "EnableTaskScheduler" -KeyValue false

Restart-NAVServerInstance -ServerInstance BC270

#Import-NAVServerLicense -ServerInstance BC270 -LicenseFile "C:\Upgrade\Dev.bclicense"
#Restart-NAVServerInstance -ServerInstance BC270

#Synchronize tenant
Sync-NAVTenant -ServerInstance BC270 -Tenant default -Mode Sync

#Publish extensions
Publish-NAVApp -ServerInstance BC270 -Path "D:\UpgradeToBC27\Core Apps\Microsoft_System Application.app"
Publish-NAVApp -ServerInstance BC270 -Path "D:\UpgradeToBC27\Core Apps\Microsoft_Business Foundation.app"
Publish-NAVApp -ServerInstance BC270 -Path "D:\UpgradeToBC27\Core Apps\Microsoft_Base Application.app"
Publish-NAVApp -ServerInstance BC270 -Path "D:\UpgradeToBC27\Core Apps\Microsoft_Application.app"

#Restart service
Restart-NAVServerInstance -ServerInstance BC270


#Synchronize Apps
Sync-NAVApp -ServerInstance BC270 -Tenant default -Name "System Application" -Version 27.1.41698.41776
Sync-NAVApp -ServerInstance BC270 -Tenant default -Name "Business Foundation" -Version 27.1.41698.41776
Sync-NAVApp -ServerInstance BC270 -Tenant default -Name "Base Application" -Version 27.1.41698.41776
Sync-NAVApp -ServerInstance BC270 -Tenant default -Name "Application" -Version 27.1.41698.41776


#Upgrade data
Start-NAVAppDataUpgrade -ServerInstance BC270 -Name "System Application" -Version 27.1.41698.41776
Start-NAVAppDataUpgrade -ServerInstance BC270 -Name "Business Foundation" -Version 27.1.41698.41776
Start-NAVAppDataUpgrade -ServerInstance BC270 -Name "Base Application" -Version 27.1.41698.41776
Start-NAVAppDataUpgrade -ServerInstance BC270 -Name "Application" -Version 27.1.41698.41776


#Upgrade control add-ins
$AddinsFolder = 'C:\Program Files\Microsoft Dynamics 365 Business Central\270\Service\Add-ins'

Set-NAVAddIn -ServerInstance BC270 -AddinName 'Microsoft.Dynamics.Nav.Client.BusinessChart' -PublicKeyToken 31bf3856ad364e35 -ResourceFile ($AppName = Join-Path $AddinsFolder 'BusinessChart\Microsoft.Dynamics.Nav.Client.BusinessChart.zip')
Set-NAVAddIn -ServerInstance BC270 -AddinName 'Microsoft.Dynamics.Nav.Client.FlowIntegration' -PublicKeyToken 31bf3856ad364e35 -ResourceFile ($AppName = Join-Path $AddinsFolder 'FlowIntegration\Microsoft.Dynamics.Nav.Client.FlowIntegration.zip')
Set-NAVAddIn -ServerInstance BC270 -AddinName 'Microsoft.Dynamics.Nav.Client.OAuthIntegration' -PublicKeyToken 31bf3856ad364e35 -ResourceFile ($AppName = Join-Path $AddinsFolder 'OAuthIntegration\Microsoft.Dynamics.Nav.Client.OAuthIntegration.zip')
Set-NAVAddIn -ServerInstance BC270 -AddinName 'Microsoft.Dynamics.Nav.Client.PageReady' -PublicKeyToken 31bf3856ad364e35 -ResourceFile ($AppName = Join-Path $AddinsFolder 'PageReady\Microsoft.Dynamics.Nav.Client.PageReady.zip')
Set-NAVAddIn -ServerInstance BC270 -AddinName 'Microsoft.Dynamics.Nav.Client.PowerBIManagement' -PublicKeyToken 31bf3856ad364e35 -ResourceFile ($AppName = Join-Path $AddinsFolder 'PowerBIManagement\Microsoft.Dynamics.Nav.Client.PowerBIManagement.zip')
Set-NAVAddIn -ServerInstance BC270 -AddinName 'Microsoft.Dynamics.Nav.Client.RoleCenterSelector' -PublicKeyToken 31bf3856ad364e35 -ResourceFile ($AppName = Join-Path $AddinsFolder 'RoleCenterSelector\Microsoft.Dynamics.Nav.Client.RoleCenterSelector.zip')
Set-NAVAddIn -ServerInstance BC270 -AddinName 'Microsoft.Dynamics.Nav.Client.SatisfactionSurvey' -PublicKeyToken 31bf3856ad364e35 -ResourceFile ($AppName = Join-Path $AddinsFolder 'SatisfactionSurvey\Microsoft.Dynamics.Nav.Client.SatisfactionSurvey.zip')
Set-NAVAddIn -ServerInstance BC270 -AddinName 'Microsoft.Dynamics.Nav.Client.VideoPlayer' -PublicKeyToken 31bf3856ad364e35 -ResourceFile ($AppName = Join-Path $AddinsFolder 'VideoPlayer\Microsoft.Dynamics.Nav.Client.VideoPlayer.zip')
Set-NAVAddIn -ServerInstance BC270 -AddinName 'Microsoft.Dynamics.Nav.Client.WebPageViewer' -PublicKeyToken 31bf3856ad364e35 -ResourceFile ($AppName = Join-Path $AddinsFolder 'WebPageViewer\Microsoft.Dynamics.Nav.Client.WebPageViewer.zip')
Set-NAVAddIn -ServerInstance BC270 -AddinName 'Microsoft.Dynamics.Nav.Client.WelcomeWizard' -PublicKeyToken 31bf3856ad364e35 -ResourceFile ($AppName = Join-Path $AddinsFolder 'WelcomeWizard\Microsoft.Dynamics.Nav.Client.WelcomeWizard.zip')


#Update Solution Version
Set-NAVServerConfiguration -ServerInstance BC270 -KeyName SolutionVersionExtension -KeyValue "437dbf0e-84ff-417a-965d-ed2bb9650972" -ApplyTo All  
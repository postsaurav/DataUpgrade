﻿########################################################################
#Author : Saurav Dhyani
#Date   : 27-04-2024
#Purpose: Execute Step 2 of BC Upgrade
########################################################################


#Import Module
Import-Module 'C:\Program Files\Microsoft Dynamics 365 Business Central\240\Service\NavAdminTool.ps1'

#Convert the application database to version 24
Invoke-NAVApplicationDatabaseConversion -DatabaseServer localhost -DatabaseName DemoUpgrade

#Configure version 22 server for DestinationAppsForMigration
Set-NAVServerConfiguration -ServerInstance BC240 -KeyName DatabaseServer -KeyValue localhost
#Set-NAVServerConfiguration -ServerInstance BC240 -KeyName DatabaseInstance -KeyValue 
Set-NAVServerConfiguration -ServerInstance BC240 -KeyName DatabaseName -KeyValue DemoUpgrade
Set-NavServerConfiguration -ServerInstance BC240 -KeyName "EnableTaskScheduler" -KeyValue false

Restart-NAVServerInstance -ServerInstance BC240

Import-NAVServerLicense -ServerInstance BC240 -LicenseFile "C:\Upgrade\Dev.bclicense"
Restart-NAVServerInstance -ServerInstance BC240

#Synchronize tenant
Sync-NAVTenant -ServerInstance BC240 -Tenant default -Mode Sync

#Publish extensions
Publish-NAVApp -ServerInstance BC240 -Path "C:\Upgrade\Core Apps\Microsoft_System Application.app"
Publish-NAVApp -ServerInstance BC240 -Path "C:\Upgrade\Core Apps\Microsoft_Business Foundation.app"
Publish-NAVApp -ServerInstance BC240 -Path "C:\Upgrade\Core Apps\Microsoft_Base Application.app"
Publish-NAVApp -ServerInstance BC240 -Path "C:\Upgrade\Core Apps\Microsoft_Application.app"

#Restart service
Restart-NAVServerInstance -ServerInstance BC240


#Synchronize Apps
Sync-NAVApp -ServerInstance BC240 -Tenant default -Name "System Application" -Version 24.0.16410.18056
Sync-NAVApp -ServerInstance BC240 -Tenant default -Name "Business Foundation" -Version 24.0.16410.18056
Sync-NAVApp -ServerInstance BC240 -Tenant default -Name "Base Application" -Version 24.0.16410.18056
Sync-NAVApp -ServerInstance BC240 -Tenant default -Name "Application" -Version 24.0.16410.18056

#Upgrade data
Start-NAVAppDataUpgrade -ServerInstance BC240 -Name "System Application" -Version 24.0.16410.18056
Install-NAVApp -ServerInstance BC240 -Name "Business Foundation" -Version 24.0.16410.18056
Start-NAVAppDataUpgrade -ServerInstance BC240 -Name "Base Application" -Version 24.0.16410.18056
Start-NAVAppDataUpgrade -ServerInstance BC240 -Name "Application" -Version 24.0.16410.18056


#Upgrade control add-ins
$AddinsFolder = 'C:\Program Files\Microsoft Dynamics 365 Business Central\240\Service\Add-ins'

Set-NAVAddIn -ServerInstance BC240 -AddinName 'Microsoft.Dynamics.Nav.Client.BusinessChart' -PublicKeyToken 31bf3856ad364e35 -ResourceFile ($AppName = Join-Path $AddinsFolder 'BusinessChart\Microsoft.Dynamics.Nav.Client.BusinessChart.zip')
Set-NAVAddIn -ServerInstance BC240 -AddinName 'Microsoft.Dynamics.Nav.Client.FlowIntegration' -PublicKeyToken 31bf3856ad364e35 -ResourceFile ($AppName = Join-Path $AddinsFolder 'FlowIntegration\Microsoft.Dynamics.Nav.Client.FlowIntegration.zip')
Set-NAVAddIn -ServerInstance BC240 -AddinName 'Microsoft.Dynamics.Nav.Client.OAuthIntegration' -PublicKeyToken 31bf3856ad364e35 -ResourceFile ($AppName = Join-Path $AddinsFolder 'OAuthIntegration\Microsoft.Dynamics.Nav.Client.OAuthIntegration.zip')
Set-NAVAddIn -ServerInstance BC240 -AddinName 'Microsoft.Dynamics.Nav.Client.PageReady' -PublicKeyToken 31bf3856ad364e35 -ResourceFile ($AppName = Join-Path $AddinsFolder 'PageReady\Microsoft.Dynamics.Nav.Client.PageReady.zip')
Set-NAVAddIn -ServerInstance BC240 -AddinName 'Microsoft.Dynamics.Nav.Client.PowerBIManagement' -PublicKeyToken 31bf3856ad364e35 -ResourceFile ($AppName = Join-Path $AddinsFolder 'PowerBIManagement\Microsoft.Dynamics.Nav.Client.PowerBIManagement.zip')
Set-NAVAddIn -ServerInstance BC240 -AddinName 'Microsoft.Dynamics.Nav.Client.RoleCenterSelector' -PublicKeyToken 31bf3856ad364e35 -ResourceFile ($AppName = Join-Path $AddinsFolder 'RoleCenterSelector\Microsoft.Dynamics.Nav.Client.RoleCenterSelector.zip')
Set-NAVAddIn -ServerInstance BC240 -AddinName 'Microsoft.Dynamics.Nav.Client.SatisfactionSurvey' -PublicKeyToken 31bf3856ad364e35 -ResourceFile ($AppName = Join-Path $AddinsFolder 'SatisfactionSurvey\Microsoft.Dynamics.Nav.Client.SatisfactionSurvey.zip')
Set-NAVAddIn -ServerInstance BC240 -AddinName 'Microsoft.Dynamics.Nav.Client.VideoPlayer' -PublicKeyToken 31bf3856ad364e35 -ResourceFile ($AppName = Join-Path $AddinsFolder 'VideoPlayer\Microsoft.Dynamics.Nav.Client.VideoPlayer.zip')
Set-NAVAddIn -ServerInstance BC240 -AddinName 'Microsoft.Dynamics.Nav.Client.WebPageViewer' -PublicKeyToken 31bf3856ad364e35 -ResourceFile ($AppName = Join-Path $AddinsFolder 'WebPageViewer\Microsoft.Dynamics.Nav.Client.WebPageViewer.zip')
Set-NAVAddIn -ServerInstance BC240 -AddinName 'Microsoft.Dynamics.Nav.Client.WelcomeWizard' -PublicKeyToken 31bf3856ad364e35 -ResourceFile ($AppName = Join-Path $AddinsFolder 'WelcomeWizard\Microsoft.Dynamics.Nav.Client.WelcomeWizard.zip')

#Change application version
Set-NAVApplication -ServerInstance BC240 -ApplicationVersion 24.0.16410.0 -Force
Sync-NAVTenant -ServerInstance BC240 -Mode Sync -Tenant default
Start-NAVDataUpgrade -ServerInstance BC240 -FunctionExecutionMode Serial -Tenant default -SkipUserSessionCheck
Set-NAVServerConfiguration -ServerInstance BC240 -KeyName SolutionVersionExtension -KeyValue "437dbf0e-84ff-417a-965d-ed2bb9650972" -ApplyTo All  